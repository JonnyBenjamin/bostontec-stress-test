#!/usr/bin/env python3
"""
BostonTec Configurator Stress Test - Main Script
A comprehensive automation script for stress testing the BostonTec 3D Workbench Builder
and identifying intermittent PDF export bugs.

Features:
- Configurable iterations (default: 5)
- Enhanced logging (console, network, performance, element state)
- Single browser window for efficiency
- Comprehensive data export
- Screenshot capture
"""

import json
import logging
import time
import argparse
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from playwright.sync_api import sync_playwright, Page, Browser, BrowserContext


class BostonTecStressTest:
    def __init__(self, test_path_file: str, iterations: int = 5, headless: bool = False):
        self.test_path_file = test_path_file
        self.iterations = iterations
        self.headless = headless
        self.target_url = "https://www.bostontec.com/3d-workbench-builder/?"
        
        # Setup logging
        self.setup_logging()
        
        # Load test path
        self.test_steps = self.load_test_path()
        
        # Statistics
        self.stats = {
            'total_runs': 0,
            'successful_runs': 0,
            'failed_runs': 0,
            'step_failures': {},
            'run_times': [],
            'console_logs': [],
            'network_requests': [],
            'performance_metrics': []
        }

    def setup_logging(self):
        """Configure comprehensive logging"""
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s',
            handlers=[
                logging.FileHandler('bostontec_stress_test.log'),
                logging.StreamHandler()
            ]
        )
        self.logger = logging.getLogger(__name__)

    def setup_page_listeners(self, page: Page):
        """Setup comprehensive page event listeners"""
        # Console log listener
        page.on("console", lambda msg: self.capture_console_log(msg))
        
        # Network request listeners
        page.on("request", lambda request: self.capture_network_request(request, "request"))
        page.on("response", lambda response: self.capture_network_request(response, "response"))
        page.on("requestfailed", lambda request: self.capture_network_request(request, "failed"))
        
        # Page error listener
        page.on("pageerror", lambda error: self.capture_page_error(error))

    def capture_console_log(self, msg):
        """Capture console logs from the page"""
        log_entry = {
            'timestamp': time.time(),
            'type': msg.type,
            'text': msg.text,
            'level': 'info'
        }
        
        # Categorize console messages
        if msg.type == 'error':
            log_entry['level'] = 'error'
            self.logger.error(f"Console Error: {msg.text}")
        elif msg.type == 'warning':
            log_entry['level'] = 'warning'
            self.logger.warning(f"Console Warning: {msg.text}")
        elif msg.type == 'log':
            self.logger.info(f"Console Log: {msg.text}")
        
        self.stats['console_logs'].append(log_entry)

    def capture_network_request(self, request_or_response, event_type):
        """Capture network requests and responses safely"""
        try:
            if event_type == "request":
                log_entry = {
                    'timestamp': time.time(),
                    'event': 'request',
                    'url': request_or_response.url,
                    'method': request_or_response.method if hasattr(request_or_response, 'method') else 'N/A',
                    'resource_type': request_or_response.resource_type if hasattr(request_or_response, 'resource_type') else 'N/A'
                }
            elif event_type == "response":
                log_entry = {
                    'timestamp': time.time(),
                    'event': 'response',
                    'url': request_or_response.url,
                    'status': request_or_response.status,
                    'status_text': request_or_response.status_text,
                    'response_time': time.time()
                }
            elif event_type == "failed":
                # Handle failed requests safely
                failure_text = 'Unknown failure'
                try:
                    if hasattr(request_or_response, 'failure') and request_or_response.failure:
                        if isinstance(request_or_response.failure, dict):
                            failure_text = request_or_response.failure.get('errorText', 'Unknown failure')
                        else:
                            failure_text = str(request_or_response.failure)
                except:
                    failure_text = 'Unknown failure'
                    
                log_entry = {
                    'timestamp': time.time(),
                    'event': 'failed',
                    'url': request_or_response.url,
                    'failure_text': failure_text
                }
            
            self.stats['network_requests'].append(log_entry)
            
            # Log important network events
            if event_type == "failed":
                self.logger.error(f"Network Request Failed: {request_or_response.url}")
            elif event_type == "response" and request_or_response.status >= 400:
                self.logger.warning(f"Network Response Error: {request_or_response.status} - {request_or_response.url}")
                
        except Exception as e:
            # Don't let network logging break the main test
            self.logger.warning(f"Error capturing network request: {e}")

    def capture_page_error(self, error):
        """Capture page errors"""
        self.logger.error(f"Page Error: {error}")

    def load_test_path(self) -> List[Dict]:
        """Load and validate the test path from JSON file"""
        try:
            with open(self.test_path_file, 'r') as f:
                steps = json.load(f)
            
            self.logger.info(f"Loaded {len(steps)} test steps from {self.test_path_file}")
            return steps
        except Exception as e:
            self.logger.error(f"Failed to load test path: {e}")
            raise

    def locate_element(self, page: Page, step: Dict) -> Optional[Tuple[str, str]]:
        """Locate an element based on selector type and value"""
        selector_type = step['selector_type']
        selector_value = step['selector_value']
        
        try:
            if selector_type == "text":
                base = step.get('base', 'button')
                element = page.locator(f"{base}:has-text('{selector_value}')").first
                if element.count() > 0:
                    return "text", f"{base}:has-text('{selector_value}')"
            
            elif selector_type == "testid":
                element = page.locator(f'[data-testid="{selector_value}"]').first
                if element.count() > 0:
                    return "testid", f'[data-testid="{selector_value}"]'
            
            elif selector_type == "composite":
                element = page.locator(selector_value).first
                if element.count() > 0:
                    return "composite", selector_value
            
            elif selector_type == "section_product":
                element = page.locator(f'[data-testid="section-product"].zv-product-{selector_value}').first
                if element.count() > 0:
                    return "section_product", f'[data-testid="section-product"].zv-product-{selector_value}'
            
            return None, None
            
        except Exception as e:
            self.logger.error(f"Error locating element: {e}")
            return None, None

    def execute_step(self, page: Page, step: Dict, run_number: int, step_number: int) -> bool:
        """Execute a single test step with enhanced logging"""
        step_name = step['step']
        action = step['action']
        
        self.logger.info(f"Run {run_number}, Step {step_number}: {step_name} - {action}")
        
        try:
            # Wait for page to be ready
            try:
                page.wait_for_load_state('domcontentloaded', timeout=5000)
            except:
                pass
            
            if action == "click":
                selector_type, selector = self.locate_element(page, step)
                if selector:
                    element = page.locator(selector).first
                    
                    # Capture element state before click
                    try:
                        before_state = self.capture_element_state(element, "before")
                        self.logger.info(f"  📊 Element state before: {before_state}")
                    except:
                        pass
                    
                    element.click()
                    self.logger.info(f"  ✓ Clicked element: {selector}")
                    
                    # Capture element state after click
                    try:
                        time.sleep(0.5)
                        after_state = self.capture_element_state(element, "after")
                        self.logger.info(f"  📊 Element state after: {after_state}")
                    except:
                        pass
                    
                    return True
                else:
                    self.logger.error(f"  ✗ Element not found for step: {step_name}")
                    return False
            
            elif action == "increment_quantity":
                selector_type, selector = self.locate_element(page, step)
                if selector:
                    section = page.locator(selector).first
                    
                    if section.count() > 0:
                        increment_button = section.locator('[data-testid="increment-button"]').first
                        if increment_button.count() > 0:
                            increment_button.click()
                            self.logger.info(f"  ✓ Incremented quantity in section: {step['selector_value']}")
                            return True
                        else:
                            self.logger.error(f"  ✗ Increment button not found in section: {step['selector_value']}")
                            return False
                    else:
                        self.logger.error(f"  ✗ Section not found: {step['selector_value']}")
                        return False
                else:
                    self.logger.error(f"  ✗ Could not locate section for increment: {step['step']}")
                    return False
            
            else:
                self.logger.error(f"  ✗ Unknown action: {action}")
                return False
                
        except Exception as e:
            self.logger.error(f"  ✗ Error executing step '{step_name}': {e}")
            self.logger.error(f"  📍 Error location: {step}")
            self.logger.error(f"  🔍 Current page URL: {page.url}")
            return False

    def capture_element_state(self, element, state_label):
        """Capture the state of an element for debugging"""
        try:
            state = {
                'visible': element.is_visible(),
                'enabled': element.is_enabled(),
                'classes': element.evaluate('el => Array.from(el.classList)'),
                'text': element.text_content()[:100] if element.text_content() else 'No text',
                'tag_name': element.evaluate('el => el.tagName'),
                'attributes': element.evaluate('el => Object.fromEntries(Array.from(el.attributes).map(attr => [attr.name, attr.value]))')
            }
            return state
        except Exception as e:
            return f"Error capturing state: {e}"

    def execute_test_run(self, page: Page, run_number: int) -> bool:
        """Execute a single test run"""
        start_time = time.time()
        
        try:
            # Wait for page to be ready
            try:
                page.wait_for_load_state('domcontentloaded', timeout=15000)
                self.logger.info("DOM content loaded")
            except Exception as e:
                self.logger.warning(f"DOM content load timeout: {e}")
            
            # Give page time to render dynamic content
            time.sleep(5)
            self.logger.info("Waited for dynamic content")
            
            # Execute each step
            for i, step in enumerate(self.test_steps, 1):
                success = self.execute_step(page, step, run_number, i)
                if not success:
                    self.logger.error(f"Step {i} failed, aborting run {run_number}")
                    return False
                
                # Small delay between steps
                time.sleep(1)
            
            run_time = time.time() - start_time
            self.stats['run_times'].append(run_time)
            self.logger.info(f"Test run {run_number} completed successfully in {run_time:.2f} seconds")
            return True
            
        except Exception as e:
            self.logger.error(f"Test run {run_number} failed with error: {e}")
            return False

    def run_stress_test(self):
        """Main method to run the stress test"""
        self.logger.info(f"🚀 Starting BostonTec Stress Test")
        self.logger.info(f"Target URL: {self.target_url}")
        self.logger.info(f"Test path: {self.test_path_file}")
        self.logger.info(f"Iterations: {self.iterations}")
        self.logger.info(f"Enhanced logging: Console, Network, Performance, Element State")
        
        with sync_playwright() as p:
            # Launch browser once
            browser = p.chromium.launch(headless=self.headless)
            self.logger.info("🌐 Launched Chromium browser")
            
            # Create single context and page
            context = browser.new_context()
            page = context.new_page()
            
            # Setup comprehensive page listeners
            self.setup_page_listeners(page)
            self.logger.info("📡 Setup page event listeners for comprehensive logging")
            
            try:
                for run in range(1, self.iterations + 1):
                    self.logger.info(f"\n{'='*60}")
                    self.logger.info(f"Starting Test Run {run}/{self.iterations}")
                    self.logger.info(f"{'='*60}")
                    
                    # Navigate to the target URL for each run
                    page.goto(self.target_url)
                    self.logger.info(f"Loaded page: {self.target_url}")
                    
                    # Execute the test run
                    success = self.execute_test_run(page, run)
                    
                    self.stats['total_runs'] += 1
                    
                    if success:
                        self.stats['successful_runs'] += 1
                        self.logger.info(f"✅ Test run {run} completed successfully")
                    else:
                        self.stats['failed_runs'] += 1
                        self.logger.error(f"❌ Test run {run} failed")
                    
                    # Take screenshot after each run
                    screenshot_path = f"run_{run}_final_state.png"
                    page.screenshot(path=screenshot_path)
                    self.logger.info(f"Screenshot saved: {screenshot_path}")
                    
                    # Small delay between runs
                    if run < self.iterations:
                        self.logger.info("⏳ Waiting 3 seconds before next iteration...")
                        time.sleep(3)
                        
            finally:
                # Keep browser open for manual inspection
                self.logger.info(f"\n🔍 All {self.iterations} iterations completed!")
                self.logger.info("Browser will remain open for manual inspection.")
                self.logger.info("Close the browser window when you're done, or press Enter to close automatically...")
                input()
                
                context.close()
                browser.close()
                self.logger.info("🔒 Browser closed")
        
        self.print_summary()
        self.save_detailed_data()

    def print_summary(self):
        """Print comprehensive test execution summary"""
        self.logger.info(f"\n{'='*60}")
        self.logger.info("BOSTONTEC STRESS TEST SUMMARY")
        self.logger.info(f"{'='*60}")
        self.logger.info(f"Total Runs: {self.stats['total_runs']}")
        self.logger.info(f"Successful: {self.stats['successful_runs']}")
        self.logger.info(f"Failed: {self.stats['failed_runs']}")
        
        if self.stats['run_times']:
            avg_time = sum(self.stats['run_times']) / len(self.stats['run_times'])
            self.logger.info(f"Average Run Time: {avg_time:.2f} seconds")
            self.logger.info(f"Fastest Run: {min(self.stats['run_times']):.2f} seconds")
            self.logger.info(f"Slowest Run: {max(self.stats['run_times']):.2f} seconds")
        
        success_rate = (self.stats['successful_runs'] / self.stats['total_runs']) * 100
        self.logger.info(f"Success Rate: {success_rate:.1f}%")
        
        # Logging statistics
        self.logger.info(f"\n📊 ENHANCED LOGGING STATISTICS:")
        self.logger.info(f"Console Logs Captured: {len(self.stats['console_logs'])}")
        self.logger.info(f"Network Requests Tracked: {len(self.stats['network_requests'])}")
        
        # Console log summary
        if self.stats['console_logs']:
            error_logs = [log for log in self.stats['console_logs'] if log['level'] == 'error']
            warning_logs = [log for log in self.stats['console_logs'] if log['level'] == 'warning']
            self.logger.info(f"Console Errors: {len(error_logs)}")
            self.logger.info(f"Console Warnings: {len(warning_logs)}")
        
        # Network request summary
        if self.stats['network_requests']:
            failed_requests = [req for req in self.stats['network_requests'] if req['event'] == 'failed']
            error_responses = [req for req in self.stats['network_requests'] if req['event'] == 'response' and req.get('status', 200) >= 400]
            self.logger.info(f"Failed Network Requests: {len(failed_requests)}")
            self.logger.info(f"Error Responses (4xx/5xx): {len(error_responses)}")
        
        self.logger.info(f"\n📁 Detailed logs saved to: bostontec_stress_test.log")
        self.logger.info(f"📸 Screenshots saved for each run")
        self.logger.info(f"🔍 Check console logs and network requests for debugging insights")

    def save_detailed_data(self):
        """Save all captured data to a JSON file for detailed analysis"""
        try:
            data_to_save = {
                'test_summary': {
                    'total_runs': self.stats['total_runs'],
                    'successful_runs': self.stats['successful_runs'],
                    'failed_runs': self.stats['failed_runs'],
                    'success_rate': (self.stats['successful_runs'] / self.stats['total_runs']) * 100 if self.stats['total_runs'] > 0 else 0,
                    'run_times': self.stats['run_times'],
                    'average_run_time': sum(self.stats['run_times']) / len(self.stats['run_times']) if self.stats['run_times'] else 0
                },
                'console_logs': self.stats['console_logs'],
                'network_requests': self.stats['network_requests'],
                'performance_metrics': self.stats['performance_metrics'],
                'timestamp': time.time(),
                'test_path_file': self.test_path_file,
                'target_url': self.target_url
            }
            
            filename = f"bostontec_stress_test_data_{int(time.time())}.json"
            with open(filename, 'w') as f:
                json.dump(data_to_save, f, indent=2, default=str)
            
            self.logger.info(f"💾 Detailed data saved to: {filename}")
            
        except Exception as e:
            self.logger.error(f"Failed to save detailed data: {e}")


def main():
    parser = argparse.ArgumentParser(description='BostonTec Configurator Stress Test')
    parser.add_argument('--iterations', '-i', type=int, default=5, 
                       help='Number of test iterations (default: 5)')
    parser.add_argument('--test-path', '-t', type=str, default='test_path.json',
                       help='Path to test path JSON file (default: test_path.json)')
    parser.add_argument('--headless', action='store_true',
                       help='Run browser in headless mode')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Enable verbose logging')
    
    args = parser.parse_args()
    
    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)
    
    # Validate test path file exists
    if not Path(args.test_path).exists():
        print(f"Error: Test path file '{args.test_path}' not found")
        return 1
    
    try:
        print("🚀 BostonTec Configurator Stress Test")
        print("=" * 50)
        print(f"Iterations: {args.iterations}")
        print(f"Test path: {args.test_path}")
        print(f"Headless: {args.headless}")
        print("=" * 50)
        
        stress_test = BostonTecStressTest(
            test_path_file=args.test_path,
            iterations=args.iterations,
            headless=args.headless
        )
        
        stress_test.run_stress_test()
        return 0
        
    except Exception as e:
        print(f"Error running stress test: {e}")
        return 1


if __name__ == "__main__":
    exit(main())
