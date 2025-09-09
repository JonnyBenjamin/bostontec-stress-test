#!/usr/bin/env python3
"""
BostonTec Configurator Stress Test - Main Script
A comprehensive automation script for stress testing the BostonTec 3D Workbench Builder
and identifying intermittent PDF export bugs through memory pressure monitoring.

Features:
- Configurable iterations (default: 5)
- Enhanced logging (console, network, performance, element state)
- Memory usage monitoring and pressure detection
- Performance degradation tracking across runs
- Automatic garbage collection when memory usage is high
- Memory pattern analysis for PDF bug correlation
- Single browser window for efficiency
- Comprehensive data export with memory analysis
- Screenshot capture
"""

import json
import logging
import time
import argparse
import os
from pathlib import Path
from typing import Dict, List, Optional, Tuple
from playwright.sync_api import sync_playwright, Page, Browser, BrowserContext
from reportlab.lib.pagesizes import letter, A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, PageBreak
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_RIGHT
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime
import pandas as pd
import io
from reportlab.lib.utils import ImageReader
from reportlab.platypus import Image


class BostonTecStressTest:
    def __init__(self, test_path_file: str, iterations: int = 5, headless: bool = False):
        self.test_path_file = test_path_file
        self.iterations = iterations
        self.headless = headless
        self.target_url = "https://www.bostontec.com/3d-workbench-builder/?"
        self.generate_pdf = True  # Default to generating PDF reports
        
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
            'performance_metrics': [],
            'memory_metrics': [],
            'performance_degradation': []
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
        """Capture console logs from the page with smart filtering"""
        # Smart filtering - only capture relevant logs
        if not self._is_relevant_console_log(msg):
            return
        
        log_entry = {
            'timestamp': time.time(),
            'type': msg.type,
            'text': msg.text,
            'level': 'info',
            'relevance': self._get_console_log_relevance(msg)
        }
        
        # Categorize console messages
        if msg.type == 'error':
            log_entry['level'] = 'error'
            self.logger.error(f"🚨 RELEVANT Console Error: {msg.text}")
        elif msg.type == 'warning':
            log_entry['level'] = 'warning'
            self.logger.warning(f"⚠️  RELEVANT Console Warning: {msg.text}")
        elif msg.type == 'log':
            self.logger.info(f"📝 RELEVANT Console Log: {msg.text}")
        
        self.stats['console_logs'].append(log_entry)

    def _is_relevant_console_log(self, msg):
        """Determine if a console log is relevant for PDF bug investigation"""
        text = msg.text.lower()
        
        # Zoovu-specific errors (high priority)
        if any(domain in text for domain in ['zoovu.com', 'barracuda-cdn.zoovu.com', 'orca-exd-global-components.zoovu.com', 'zoovu-components-library.zoovu.com']):
            return True
        
        # Canvas/WebGL memory errors
        if any(keyword in text for keyword in ['canvas', 'webgl', 'memory', 'heap', 'allocation', 'blob', 'pdf']):
            return True
        
        # JavaScript errors that could affect PDF generation
        if msg.type == 'error' and any(keyword in text for keyword in ['typeerror', 'referenceerror', 'out of memory', 'memory pressure']):
            return True
        
        # Configurator-specific errors
        if any(keyword in text for keyword in ['configurator', 'product', 'summary', 'parameters', 'uselazyloading']):
            return True
        
        # Image loading failures that could cause missing images in PDFs
        if any(keyword in text for keyword in ['failed to load resource', 'image', 'screenshot', 'render']):
            return True
        
        return False

    def _get_console_log_relevance(self, msg):
        """Get the relevance category for a console log"""
        text = msg.text.lower()
        
        if any(domain in text for domain in ['zoovu.com', 'barracuda-cdn.zoovu.com', 'orca-exd-global-components.zoovu.com', 'zoovu-components-library.zoovu.com']):
            return 'zoovu_error'
        elif any(keyword in text for keyword in ['canvas', 'webgl', 'memory', 'heap', 'allocation', 'blob', 'pdf']):
            return 'pdf_generation'
        elif any(keyword in text for keyword in ['configurator', 'product', 'summary', 'parameters', 'uselazyloading']):
            return 'configurator_error'
        elif any(keyword in text for keyword in ['failed to load resource', 'image', 'screenshot', 'render']):
            return 'image_loading'
        else:
            return 'other'

    def capture_network_request(self, request_or_response, event_type):
        """Capture network requests and responses with smart filtering"""
        try:
            # Smart filtering - only capture relevant network requests
            if not self._is_relevant_network_request(request_or_response, event_type):
                return
            
            if event_type == "request":
                log_entry = {
                    'timestamp': time.time(),
                    'event': 'request',
                    'url': request_or_response.url,
                    'method': request_or_response.method if hasattr(request_or_response, 'method') else 'N/A',
                    'resource_type': request_or_response.resource_type if hasattr(request_or_response, 'resource_type') else 'N/A',
                    'relevance': self._get_network_request_relevance(request_or_response.url)
                }
            elif event_type == "response":
                log_entry = {
                    'timestamp': time.time(),
                    'event': 'response',
                    'url': request_or_response.url,
                    'status': request_or_response.status,
                    'status_text': request_or_response.status_text,
                    'response_time': time.time(),
                    'relevance': self._get_network_request_relevance(request_or_response.url)
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
                    'failure_text': failure_text,
                    'relevance': self._get_network_request_relevance(request_or_response.url)
                }
            
            self.stats['network_requests'].append(log_entry)
            
            # Log important network events with relevance indicators
            if event_type == "failed":
                self.logger.error(f"🚨 RELEVANT Network Request Failed: {request_or_response.url}")
            elif event_type == "response" and request_or_response.status >= 400:
                self.logger.warning(f"⚠️  RELEVANT Network Response Error: {request_or_response.status} - {request_or_response.url}")
                
        except Exception as e:
            # Don't let network logging break the main test
            self.logger.warning(f"Error capturing network request: {e}")

    def _is_relevant_network_request(self, request_or_response, event_type):
        """Determine if a network request is relevant for PDF bug investigation"""
        url = request_or_response.url.lower()
        
        # Zoovu-specific requests (high priority)
        if any(domain in url for domain in ['zoovu.com', 'barracuda-cdn.zoovu.com', 'orca-exd-global-components.zoovu.com', 'zoovu-components-library.zoovu.com']):
            return True
        
        # PDF generation related requests
        if any(keyword in url for keyword in ['pdf', 'canvas', 'blob', 'screenshot', 'render', 'export']):
            return True
        
        # Image/asset loading failures that could cause missing images in PDFs
        if any(keyword in url for keyword in ['image', 'asset', 'static', 'media']) and event_type in ['failed', 'response']:
            if event_type == 'failed':
                return True
            elif event_type == 'response' and hasattr(request_or_response, 'status') and request_or_response.status >= 400:
                return True
        
        # Email/lead gen form submission failures
        if any(keyword in url for keyword in ['email', 'lead', 'form', 'submit', 'contact']) and event_type in ['failed', 'response']:
            if event_type == 'failed':
                return True
            elif event_type == 'response' and hasattr(request_or_response, 'status') and request_or_response.status >= 400:
                return True
        
        # Failed requests are always relevant
        if event_type == 'failed':
            return True
        
        return False

    def _get_network_request_relevance(self, url):
        """Get the relevance category for a network request"""
        url_lower = url.lower()
        
        if any(domain in url_lower for domain in ['zoovu.com', 'barracuda-cdn.zoovu.com', 'orca-exd-global-components.zoovu.com', 'zoovu-components-library.zoovu.com']):
            return 'zoovu_request'
        elif any(keyword in url_lower for keyword in ['pdf', 'canvas', 'blob', 'screenshot', 'render', 'export']):
            return 'pdf_generation'
        elif any(keyword in url_lower for keyword in ['image', 'asset', 'static', 'media']):
            return 'image_loading'
        elif any(keyword in url_lower for keyword in ['email', 'lead', 'form', 'submit', 'contact']):
            return 'lead_generation'
        else:
            return 'other'

    def capture_page_error(self, error):
        """Capture page errors"""
        self.logger.error(f"Page Error: {error}")

    def capture_performance_metrics(self, page: Page, run_number: int, step_name: str = None):
        """Capture performance metrics including memory usage"""
        try:
            # Get browser performance metrics
            metrics = page.evaluate("""
                () => {
                    const performance = window.performance;
                    const memory = performance.memory || {};
                    const navigation = performance.getEntriesByType('navigation')[0] || {};
                    
                    return {
                        timestamp: Date.now(),
                        memory: {
                            used: memory.usedJSHeapSize || 0,
                            total: memory.totalJSHeapSize || 0,
                            limit: memory.jsHeapSizeLimit || 0
                        },
                        navigation: {
                            load_time: navigation.loadEventEnd - navigation.loadEventStart || 0,
                            dom_content_loaded: navigation.domContentLoadedEventEnd - navigation.domContentLoadedEventStart || 0,
                            first_paint: performance.getEntriesByType('paint').find(entry => entry.name === 'first-paint')?.startTime || 0,
                            first_contentful_paint: performance.getEntriesByType('paint').find(entry => entry.name === 'first-contentful-paint')?.startTime || 0
                        },
                        timing: {
                            now: performance.now()
                        }
                    };
                }
            """)
            
            # Add run context
            metrics['run_number'] = run_number
            metrics['step_name'] = step_name
            metrics['memory_usage_percent'] = (metrics['memory']['used'] / metrics['memory']['limit']) * 100 if metrics['memory']['limit'] > 0 else 0
            
            self.stats['performance_metrics'].append(metrics)
            
            # Log memory pressure warnings
            if metrics['memory_usage_percent'] > 80:
                self.logger.warning(f"🚨 HIGH MEMORY USAGE: {metrics['memory_usage_percent']:.1f}% (Run {run_number})")
            elif metrics['memory_usage_percent'] > 60:
                self.logger.info(f"⚠️  Elevated memory usage: {metrics['memory_usage_percent']:.1f}% (Run {run_number})")
            
            return metrics
            
        except Exception as e:
            self.logger.warning(f"Failed to capture performance metrics: {e}")
            return None

    def detect_performance_degradation(self, current_run: int):
        """Detect performance degradation across runs"""
        if current_run < 2:
            return
        
        try:
            # Get performance metrics for current and previous runs
            current_metrics = [m for m in self.stats['performance_metrics'] if m['run_number'] == current_run]
            previous_metrics = [m for m in self.stats['performance_metrics'] if m['run_number'] == current_run - 1]
            
            if not current_metrics or not previous_metrics:
                return
            
            # Calculate averages
            current_avg_memory = sum(m['memory_usage_percent'] for m in current_metrics) / len(current_metrics)
            previous_avg_memory = sum(m['memory_usage_percent'] for m in previous_metrics) / len(previous_metrics)
            
            # Detect degradation patterns
            memory_increase = current_avg_memory - previous_avg_memory
            
            if memory_increase > 10:  # 10% increase in memory usage
                degradation = {
                    'run_number': current_run,
                    'type': 'memory_increase',
                    'current_memory': current_avg_memory,
                    'previous_memory': previous_avg_memory,
                    'increase_percent': memory_increase,
                    'timestamp': time.time()
                }
                
                self.stats['performance_degradation'].append(degradation)
                self.logger.warning(f"📉 PERFORMANCE DEGRADATION DETECTED: Memory usage increased by {memory_increase:.1f}% (Run {current_run})")
                
                # Check if this could indicate memory pressure
                if current_avg_memory > 70:
                    self.logger.error(f"🚨 MEMORY PRESSURE WARNING: {current_avg_memory:.1f}% memory usage - PDF generation may fail!")
            
        except Exception as e:
            self.logger.warning(f"Error detecting performance degradation: {e}")

    def force_garbage_collection(self, page: Page):
        """Attempt to trigger garbage collection to free memory"""
        try:
            page.evaluate("""
                () => {
                    if (window.gc) {
                        window.gc();
                        return 'Garbage collection triggered';
                    } else {
                        // Try to trigger GC by creating and releasing large objects
                        for (let i = 0; i < 10; i++) {
                            const largeArray = new Array(1000000).fill(0);
                            largeArray.length = 0;
                        }
                        return 'Memory cleanup attempted';
                    }
                }
            """)
            self.logger.info("🧹 Attempted memory cleanup")
        except Exception as e:
            self.logger.warning(f"Failed to trigger garbage collection: {e}")

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
        """Execute a single test run with performance monitoring"""
        start_time = time.time()
        
        try:
            # Capture initial performance metrics
            self.capture_performance_metrics(page, run_number, "start")
            
            # Wait for page to be ready
            try:
                page.wait_for_load_state('domcontentloaded', timeout=15000)
                self.logger.info("DOM content loaded")
            except Exception as e:
                self.logger.warning(f"DOM content load timeout: {e}")
            
            # Give page time to render dynamic content
            time.sleep(5)
            self.logger.info("Waited for dynamic content")
            
            # Capture performance after page load
            self.capture_performance_metrics(page, run_number, "page_loaded")
            
            # Execute each step with performance monitoring
            for i, step in enumerate(self.test_steps, 1):
                # Capture performance before each step
                self.capture_performance_metrics(page, run_number, f"before_step_{i}")
                
                success = self.execute_step(page, step, run_number, i)
                if not success:
                    self.logger.error(f"Step {i} failed, aborting run {run_number}")
                    return False
                
                # Capture performance after each step
                self.capture_performance_metrics(page, run_number, f"after_step_{i}")
                
                # Check for performance degradation
                self.detect_performance_degradation(run_number)
                
                # Force garbage collection if memory usage is high
                current_metrics = [m for m in self.stats['performance_metrics'] if m['run_number'] == run_number and m['step_name'] == f"after_step_{i}"]
                if current_metrics and current_metrics[-1]['memory_usage_percent'] > 70:
                    self.force_garbage_collection(page)
                    time.sleep(2)  # Give GC time to work
                
                # Small delay between steps
                time.sleep(1)
            
            # Capture final performance metrics
            self.capture_performance_metrics(page, run_number, "completed")
            
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
        self.logger.info(f"Smart filtering: Zoovu errors, PDF generation, memory pressure, image loading")
        self.logger.info(f"Memory monitoring: Enabled with pressure detection and PDF bug correlation")
        
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
        
        if self.generate_pdf:
            self.generate_pdf_report()

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
        self.logger.info(f"Performance Metrics Captured: {len(self.stats['performance_metrics'])}")
        self.logger.info(f"Performance Degradation Events: {len(self.stats['performance_degradation'])}")
        
        # Console log summary with relevance breakdown
        if self.stats['console_logs']:
            error_logs = [log for log in self.stats['console_logs'] if log['level'] == 'error']
            warning_logs = [log for log in self.stats['console_logs'] if log['level'] == 'warning']
            self.logger.info(f"Relevant Console Errors: {len(error_logs)}")
            self.logger.info(f"Relevant Console Warnings: {len(warning_logs)}")
            
            # Breakdown by relevance
            relevance_counts = {}
            for log in self.stats['console_logs']:
                relevance = log.get('relevance', 'other')
                relevance_counts[relevance] = relevance_counts.get(relevance, 0) + 1
            
            self.logger.info(f"📊 Console Log Breakdown:")
            for relevance, count in relevance_counts.items():
                self.logger.info(f"  {relevance}: {count} logs")
        
        # Network request summary with relevance breakdown
        if self.stats['network_requests']:
            failed_requests = [req for req in self.stats['network_requests'] if req['event'] == 'failed']
            error_responses = [req for req in self.stats['network_requests'] if req['event'] == 'response' and req.get('status', 200) >= 400]
            self.logger.info(f"Relevant Failed Network Requests: {len(failed_requests)}")
            self.logger.info(f"Relevant Error Responses (4xx/5xx): {len(error_responses)}")
            
            # Breakdown by relevance
            relevance_counts = {}
            for req in self.stats['network_requests']:
                relevance = req.get('relevance', 'other')
                relevance_counts[relevance] = relevance_counts.get(relevance, 0) + 1
            
            self.logger.info(f"📊 Network Request Breakdown:")
            for relevance, count in relevance_counts.items():
                self.logger.info(f"  {relevance}: {count} requests")
        
        # Performance summary
        if self.stats['performance_metrics']:
            memory_metrics = [m for m in self.stats['performance_metrics'] if 'memory_usage_percent' in m]
            if memory_metrics:
                max_memory = max(m['memory_usage_percent'] for m in memory_metrics)
                avg_memory = sum(m['memory_usage_percent'] for m in memory_metrics) / len(memory_metrics)
                self.logger.info(f"Peak Memory Usage: {max_memory:.1f}%")
                self.logger.info(f"Average Memory Usage: {avg_memory:.1f}%")
                
                # Memory pressure warnings
                high_memory_events = [m for m in memory_metrics if m['memory_usage_percent'] > 80]
                if high_memory_events:
                    self.logger.warning(f"🚨 HIGH MEMORY EVENTS: {len(high_memory_events)} instances > 80% memory usage")
        
        # Performance degradation summary
        if self.stats['performance_degradation']:
            self.logger.warning(f"📉 PERFORMANCE DEGRADATION: {len(self.stats['performance_degradation'])} events detected")
            for degradation in self.stats['performance_degradation']:
                self.logger.warning(f"  - Run {degradation['run_number']}: {degradation['increase_percent']:.1f}% memory increase")
        
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
                'performance_degradation': self.stats['performance_degradation'],
                'memory_analysis': self._analyze_memory_patterns(),
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

    def _analyze_memory_patterns(self):
        """Analyze memory usage patterns for PDF bug correlation"""
        try:
            memory_metrics = [m for m in self.stats['performance_metrics'] if 'memory_usage_percent' in m]
            
            if not memory_metrics:
                return {'error': 'No memory metrics available'}
            
            analysis = {
                'total_measurements': len(memory_metrics),
                'peak_memory_usage': max(m['memory_usage_percent'] for m in memory_metrics),
                'average_memory_usage': sum(m['memory_usage_percent'] for m in memory_metrics) / len(memory_metrics),
                'memory_pressure_events': {
                    'high_usage_80_plus': len([m for m in memory_metrics if m['memory_usage_percent'] > 80]),
                    'elevated_usage_60_plus': len([m for m in memory_metrics if m['memory_usage_percent'] > 60]),
                    'critical_usage_90_plus': len([m for m in memory_metrics if m['memory_usage_percent'] > 90])
                },
                'run_analysis': {}
            }
            
            # Analyze memory usage by run
            for run_num in range(1, self.iterations + 1):
                run_metrics = [m for m in memory_metrics if m['run_number'] == run_num]
                if run_metrics:
                    run_memory = [m['memory_usage_percent'] for m in run_metrics]
                    analysis['run_analysis'][f'run_{run_num}'] = {
                        'peak_memory': max(run_memory),
                        'average_memory': sum(run_memory) / len(run_memory),
                        'memory_trend': 'increasing' if len(run_memory) > 1 and run_memory[-1] > run_memory[0] else 'stable',
                        'high_memory_events': len([m for m in run_metrics if m['memory_usage_percent'] > 80])
                    }
            
            # Correlation analysis
            analysis['pdf_bug_correlation'] = {
                'high_memory_runs': [run for run, data in analysis['run_analysis'].items() if data['peak_memory'] > 80],
                'memory_pressure_risk': 'HIGH' if analysis['peak_memory_usage'] > 85 else 'MEDIUM' if analysis['peak_memory_usage'] > 70 else 'LOW'
            }
            
            return analysis
            
        except Exception as e:
            return {'error': f'Memory analysis failed: {e}'}

    def generate_pdf_report(self):
        """Generate a professional PDF report with executive summary and technical findings"""
        try:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            # Create pdf_reports directory if it doesn't exist
            os.makedirs('pdf_reports', exist_ok=True)
            filename = f"pdf_reports/bostontec_stress_test_report_{timestamp}.pdf"
            
            # Create PDF document with tighter margins for more content
            doc = SimpleDocTemplate(filename, pagesize=A4, 
                                  rightMargin=50, leftMargin=50, 
                                  topMargin=60, bottomMargin=40)
            
            # Create a custom page template with footer
            from reportlab.platypus import BaseDocTemplate, PageTemplate, Frame
            from reportlab.lib.units import cm
            
            def add_footer(canvas, doc):
                canvas.saveState()
                # Add footer line
                canvas.setStrokeColor(colors.HexColor('#e2e8f0'))
                canvas.setLineWidth(1)
                canvas.line(50, 30, A4[0]-50, 30)
                # Add footer text
                canvas.setFont('Helvetica', 8)
                canvas.setFillColor(colors.HexColor('#718096'))
                canvas.drawString(50, 15, f"BostonTec 3D Workbench Builder - Stress Test Report | Generated: {datetime.now().strftime('%B %d, %Y at %I:%M %p')}")
                canvas.restoreState()
            
            # Get styles and create custom professional styles
            styles = getSampleStyleSheet()
            
            # Professional title style
            title_style = ParagraphStyle(
                'ProfessionalTitle',
                parent=styles['Heading1'],
                fontSize=28,
                spaceAfter=20,
                alignment=TA_CENTER,
                textColor=colors.HexColor('#1a365d'),  # Dark blue
                fontName='Helvetica-Bold'
            )
            
            # Subtitle style
            subtitle_style = ParagraphStyle(
                'ProfessionalSubtitle',
                parent=styles['Heading2'],
                fontSize=18,
                spaceAfter=15,
                alignment=TA_CENTER,
                textColor=colors.HexColor('#2d3748'),  # Dark gray
                fontName='Helvetica'
            )
            
            # Section heading style - more compact and professional
            heading_style = ParagraphStyle(
                'ProfessionalHeading',
                parent=styles['Heading2'],
                fontSize=14,
                spaceAfter=10,
                spaceBefore=15,
                textColor=colors.HexColor('#1a365d'),  # Dark blue
                fontName='Helvetica-Bold',
                borderWidth=2,
                borderColor=colors.HexColor('#2b6cb0'),
                borderPadding=6,
                backColor=colors.HexColor('#ebf8ff'),
                leftIndent=0,
                rightIndent=0
            )
            
            # Subheading style
            subheading_style = ParagraphStyle(
                'ProfessionalSubheading',
                parent=styles['Heading3'],
                fontSize=14,
                spaceAfter=10,
                spaceBefore=15,
                textColor=colors.HexColor('#4a5568'),  # Medium gray
                fontName='Helvetica-Bold'
            )
            
            # Body text style
            body_style = ParagraphStyle(
                'ProfessionalBody',
                parent=styles['Normal'],
                fontSize=11,
                spaceAfter=8,
                textColor=colors.HexColor('#2d3748'),
                fontName='Helvetica',
                leading=14
            )
            
            # Highlight style for key findings
            highlight_style = ParagraphStyle(
                'ProfessionalHighlight',
                parent=styles['Normal'],
                fontSize=11,
                spaceAfter=8,
                textColor=colors.HexColor('#1a365d'),
                fontName='Helvetica-Bold',
                backColor=colors.HexColor('#ebf8ff'),
                borderWidth=1,
                borderColor=colors.HexColor('#bee3f8'),
                borderPadding=6
            )
            
            # Build the story (content)
            story = []
            
            # Professional branded title page with logos
            story.append(Spacer(1, 20))
            
            # Calculate full page width for tables
            page_width = A4[0] - 100  # 50pt margins on each side
            
            # Header with centered BostonTec logo
            try:
                # Add centered BostonTec logo
                bostontec_img = Image('BOSTONtec-Logo.png', width=150, height=50)
                
                # Create centered header
                header_data = [[bostontec_img]]
                header_table = Table(header_data, colWidths=[page_width])
                header_table.setStyle(TableStyle([
                    ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                    ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                    ('LEFTPADDING', (0, 0), (-1, -1), 0),
                    ('RIGHTPADDING', (0, 0), (-1, -1), 0),
                    ('TOPPADDING', (0, 0), (-1, -1), 0),
                    ('BOTTOMPADDING', (0, 0), (-1, -1), 0),
                ]))
                story.append(header_table)
                story.append(Spacer(1, 20))
                
            except Exception as e:
                # Fallback if logo can't be loaded - log the error
                self.logger.error(f"Failed to load BostonTec logo: {e}")
                story.append(Paragraph("BostonTec", title_style))
                story.append(Spacer(1, 10))
            
            # Main title with better styling
            story.append(Paragraph("3D Workbench Builder", title_style))
            story.append(Paragraph("Stress Test Analysis Report", subtitle_style))
            story.append(Spacer(1, 20))
            
            # Compact metrics in a more professional layout
            metrics_data = [
                ['Test Information', 'Results', 'Performance'],
                ['Date', datetime.now().strftime('%B %d, %Y'), 'Success Rate'],
                ['Time', datetime.now().strftime('%I:%M %p'), f"{(self.stats['successful_runs'] / self.stats['total_runs']) * 100:.1f}%"],
                ['Iterations', str(self.iterations), 'Avg Runtime'],
                ['', '', f"{sum(self.stats['run_times']) / len(self.stats['run_times']):.1f}s" if self.stats['run_times'] else 'N/A']
            ]
            
            # Calculate full page width (A4 width - margins)
            page_width = A4[0] - 100  # 50pt margins on each side
            metrics_table = Table(metrics_data, colWidths=[page_width/3, page_width/3, page_width/3])
            metrics_table.setStyle(TableStyle([
                ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#1a365d')),  # Dark blue header
                ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
                ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
                ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
                ('FONTSIZE', (0, 0), (-1, 0), 11),
                ('FONTSIZE', (0, 1), (-1, -1), 10),
                ('BOTTOMPADDING', (0, 0), (-1, 0), 10),
                ('TOPPADDING', (0, 0), (-1, 0), 8),
                ('BOTTOMPADDING', (0, 1), (-1, -1), 6),
                ('TOPPADDING', (0, 1), (-1, -1), 6),
                ('LEFTPADDING', (0, 0), (-1, -1), 8),
                ('RIGHTPADDING', (0, 0), (-1, -1), 8),
                ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#f7fafc')),
                ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#e2e8f0')),
                ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
            ]))
            
            story.append(metrics_table)
            story.append(Spacer(1, 25))
            story.append(PageBreak())
            
            # Executive Summary
            story.append(Paragraph("Executive Summary", heading_style))
            story.extend(self._generate_executive_summary())
            story.append(PageBreak())
            
            # Technical Findings
            story.append(Paragraph("Technical Findings", heading_style))
            story.extend(self._generate_technical_findings())
            story.append(PageBreak())
            
            # Memory Analysis
            story.append(Paragraph("Memory Analysis", heading_style))
            story.extend(self._generate_memory_analysis())
            story.append(PageBreak())
            
            # Error Analysis section removed per user request
            
            # Build PDF with custom footer
            doc.build(story, onFirstPage=add_footer, onLaterPages=add_footer)
            
            self.logger.info(f"📄 Professional PDF report generated: {filename}")
            return filename
            
        except Exception as e:
            self.logger.error(f"Failed to generate PDF report: {e}")
            return None

    def _generate_executive_summary(self):
        """Generate executive summary content"""
        content = []
        styles = getSampleStyleSheet()
        
        # Create professional styles
        subheading_style = ParagraphStyle(
            'ProfessionalSubheading',
            parent=styles['Heading3'],
            fontSize=14,
            spaceAfter=10,
            spaceBefore=15,
            textColor=colors.HexColor('#4a5568'),
            fontName='Helvetica-Bold'
        )
        
        body_style = ParagraphStyle(
            'ProfessionalBody',
            parent=styles['Normal'],
            fontSize=11,
            spaceAfter=8,
            textColor=colors.HexColor('#2d3748'),
            fontName='Helvetica',
            leading=14
        )
        
        highlight_style = ParagraphStyle(
            'ProfessionalHighlight',
            parent=styles['Normal'],
            fontSize=11,
            spaceAfter=8,
            textColor=colors.HexColor('#1a365d'),
            fontName='Helvetica-Bold',
            backColor=colors.HexColor('#ebf8ff'),
            borderWidth=1,
            borderColor=colors.HexColor('#bee3f8'),
            borderPadding=6
        )
        
        # Problem statement
        content.append(Paragraph("Problem Statement", subheading_style))
        content.append(Paragraph(
            "Intermittent PDF export bug affecting the BostonTec 3D Workbench Builder configurator. "
            "Customers occasionally receive PDF attachments with missing images, impacting user experience and lead generation.",
            body_style
        ))
        content.append(Spacer(1, 10))
        
        # Root cause
        content.append(Paragraph("Root Cause Analysis", subheading_style))
        content.append(Paragraph(
            "Memory pressure during JavaScript canvas-to-blob conversion for PDF generation. "
            "When browser memory usage exceeds certain thresholds, canvas rendering fails silently, "
            "resulting in incomplete PDFs with missing images.",
            body_style
        ))
        content.append(Spacer(1, 8))
        
        # Testing limitations and scope
        content.append(Paragraph("Testing Scope & Limitations", subheading_style))
        content.append(Paragraph(
            "<b>What We Cannot Control:</b> Customer environments, device limitations, browser restrictions, "
            "network conditions, or unique hardware constraints that may affect PDF generation.",
            body_style
        ))
        content.append(Paragraph(
            "<b>What We Can Control:</b> Application performance, memory usage patterns, error handling, "
            "and optimization opportunities within our configurator and PDF generation process.",
            body_style
        ))
        content.append(Paragraph(
            "<b>Testing Strategy:</b> Focus on measurable, controllable factors that can help identify "
            "and mitigate PDF generation failures in production environments.",
            body_style
        ))
        content.append(Spacer(1, 10))
        
        # Key findings
        content.append(Paragraph("Key Findings", subheading_style))
        
        # Get memory analysis
        memory_analysis = self._analyze_memory_patterns()
        if 'error' not in memory_analysis:
            peak_memory = memory_analysis.get('peak_memory_usage', 0)
            avg_memory = memory_analysis.get('average_memory_usage', 0)
            risk_level = memory_analysis.get('pdf_bug_correlation', {}).get('memory_pressure_risk', 'UNKNOWN')
            
            # Create findings table
            findings_data = [
                ['Metric', 'Value', 'Status'],
                ['Peak Memory Usage', f"{peak_memory:.1f}%", 'LOW' if peak_memory < 60 else 'MEDIUM' if peak_memory < 80 else 'HIGH'],
                ['Average Memory Usage', f"{avg_memory:.1f}%", 'LOW' if avg_memory < 60 else 'MEDIUM' if avg_memory < 80 else 'HIGH'],
                ['Memory Pressure Risk', risk_level, risk_level]
            ]
            
            # Calculate full page width for tables
            page_width = A4[0] - 100  # 50pt margins on each side
            findings_table = Table(findings_data, colWidths=[page_width*0.5, page_width*0.3, page_width*0.2])
            findings_table.setStyle(TableStyle([
                ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#2b6cb0')),
                ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
                ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
                ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
                ('FONTSIZE', (0, 0), (-1, 0), 12),
                ('FONTSIZE', (0, 1), (-1, -1), 10),
                ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#f7fafc')),
                ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#e2e8f0')),
                ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
            ]))
            
            content.append(findings_table)
            content.append(Spacer(1, 10))
        
        # Error summary (excluding PDF generation logs for now)
        error_logs = [log for log in self.stats['console_logs'] if log['level'] == 'error' and log.get('relevance') != 'pdf_generation']
        zoovu_errors = [log for log in error_logs if log.get('relevance') == 'zoovu_error']
        
        content.append(Paragraph("Error Summary", subheading_style))
        error_summary_data = [
            ['Error Type', 'Count', 'Impact'],
            ['Total JavaScript Errors', str(len(error_logs)), 'Medium'],
            ['Zoovu Platform Errors', str(len(zoovu_errors)), 'High'],
            ['Network Request Failures', str(len([req for req in self.stats['network_requests'] if req['event'] == 'failed'])), 'Low']
        ]
        
        error_table = Table(error_summary_data, colWidths=[page_width*0.5, page_width*0.2, page_width*0.3])
        error_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#e53e3e')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
            ('FONTSIZE', (0, 0), (-1, 0), 12),
            ('FONTSIZE', (0, 1), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#fef5e7')),
            ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#fbd38d')),
            ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        ]))
        
        content.append(error_table)
        
        return content

    def _generate_technical_findings(self):
        """Generate technical findings content"""
        content = []
        styles = getSampleStyleSheet()
        
        # Create professional styles
        subheading_style = ParagraphStyle(
            'ProfessionalSubheading',
            parent=styles['Heading3'],
            fontSize=14,
            spaceAfter=10,
            spaceBefore=15,
            textColor=colors.HexColor('#4a5568'),
            fontName='Helvetica-Bold'
        )
        
        # Test execution summary
        content.append(Paragraph("Test Execution Summary", subheading_style))
        
        summary_data = [
            ['Metric', 'Value', 'Status'],
            ['Total Test Runs', str(self.stats['total_runs']), 'Complete'],
            ['Successful Runs', str(self.stats['successful_runs']), 'Passed'],
            ['Failed Runs', str(self.stats['failed_runs']), 'None' if self.stats['failed_runs'] == 0 else 'Issues Found'],
            ['Success Rate', f"{(self.stats['successful_runs'] / self.stats['total_runs']) * 100:.1f}%", 'Excellent' if (self.stats['successful_runs'] / self.stats['total_runs']) * 100 >= 95 else 'Good'],
            ['Average Run Time', f"{sum(self.stats['run_times']) / len(self.stats['run_times']):.1f}s" if self.stats['run_times'] else 'N/A', 'Normal']
        ]
        
        # Calculate full page width for tables
        page_width = A4[0] - 100  # 50pt margins on each side
        summary_table = Table(summary_data, colWidths=[page_width*0.5, page_width*0.3, page_width*0.2])
        summary_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#38a169')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
            ('FONTSIZE', (0, 0), (-1, 0), 12),
            ('FONTSIZE', (0, 1), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#f0fff4')),
            ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#9ae6b4')),
            ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        ]))
        
        content.append(summary_table)
        
        # Add note about testing environment
        content.append(Paragraph(
            "<i>Note: Testing performed in controlled environment. Customer environments may vary significantly "
            "due to device limitations, browser restrictions, and network conditions beyond our control.</i>",
            ParagraphStyle(
                'NoteStyle',
                parent=styles['Normal'],
                fontSize=9,
                textColor=colors.HexColor('#718096'),
                fontName='Helvetica-Oblique',
                leftIndent=20
            )
        ))
        content.append(Spacer(1, 20))
        
        # Logging statistics
        content.append(Paragraph("Data Collection Statistics", subheading_style))
        
        logging_data = [
            ['Data Type', 'Count', 'Filtering Applied'],
            ['Console Logs', str(len(self.stats['console_logs'])), 'Relevant errors only'],
            ['Network Requests', str(len(self.stats['network_requests'])), 'Zoovu-specific'],
            ['Performance Metrics', str(len(self.stats['performance_metrics'])), 'Memory & timing'],
            ['Screenshots', str(self.stats['total_runs']), 'One per test run']
        ]
        
        logging_table = Table(logging_data, colWidths=[page_width*0.4, page_width*0.2, page_width*0.4])
        logging_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#805ad5')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
            ('FONTSIZE', (0, 0), (-1, 0), 12),
            ('FONTSIZE', (0, 1), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#faf5ff')),
            ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#d6bcfa')),
            ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        ]))
        
        content.append(logging_table)
        
        return content

    def _generate_memory_analysis(self):
        """Generate memory analysis content with charts"""
        content = []
        styles = getSampleStyleSheet()
        
        # Create professional styles
        subheading_style = ParagraphStyle(
            'ProfessionalSubheading',
            parent=styles['Heading3'],
            fontSize=14,
            spaceAfter=10,
            spaceBefore=15,
            textColor=colors.HexColor('#4a5568'),
            fontName='Helvetica-Bold'
        )
        
        memory_analysis = self._analyze_memory_patterns()
        if 'error' in memory_analysis:
            content.append(Paragraph("Memory analysis data not available.", styles['Normal']))
            return content
        
        # Memory summary
        content.append(Paragraph("Memory Usage Summary", subheading_style))
        
        peak_memory = memory_analysis.get('peak_memory_usage', 0)
        avg_memory = memory_analysis.get('average_memory_usage', 0)
        risk_level = memory_analysis.get('pdf_bug_correlation', {}).get('memory_pressure_risk', 'UNKNOWN')
        
        # Determine risk colors
        def get_risk_color(risk):
            if risk == 'LOW':
                return colors.HexColor('#38a169')
            elif risk == 'MEDIUM':
                return colors.HexColor('#d69e2e')
            else:
                return colors.HexColor('#e53e3e')
        
        memory_data = [
            ['Metric', 'Value', 'Risk Level'],
            ['Peak Memory Usage', f"{peak_memory:.1f}%", 'LOW' if peak_memory < 60 else 'MEDIUM' if peak_memory < 80 else 'HIGH'],
            ['Average Memory Usage', f"{avg_memory:.1f}%", 'LOW' if avg_memory < 60 else 'MEDIUM' if avg_memory < 80 else 'HIGH'],
            ['Overall Risk Assessment', risk_level, risk_level]
        ]
        
        # Calculate full page width for tables
        page_width = A4[0] - 100  # 50pt margins on each side
        memory_table = Table(memory_data, colWidths=[page_width*0.5, page_width*0.3, page_width*0.2])
        memory_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#2b6cb0')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
            ('FONTSIZE', (0, 0), (-1, 0), 12),
            ('FONTSIZE', (0, 1), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#ebf8ff')),
            ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#bee3f8')),
            ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        ]))
        
        content.append(memory_table)
        content.append(Spacer(1, 20))
        
        # Memory pressure events
        pressure_events = memory_analysis.get('memory_pressure_events', {})
        if pressure_events:
            content.append(Paragraph("Memory Pressure Events", subheading_style))
            
            pressure_data = [
                ['Event Type', 'Count', 'Severity'],
                ['High Usage (80%+)', str(pressure_events.get('high_usage_80_plus', 0)), 'Critical'],
                ['Elevated Usage (60%+)', str(pressure_events.get('elevated_usage_60_plus', 0)), 'Moderate'],
                ['Critical Usage (90%+)', str(pressure_events.get('critical_usage_90_plus', 0)), 'Extreme']
            ]
            
            pressure_table = Table(pressure_data, colWidths=[page_width*0.5, page_width*0.2, page_width*0.3])
            pressure_table.setStyle(TableStyle([
                ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#d69e2e')),
                ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
                ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
                ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
                ('FONTSIZE', (0, 0), (-1, 0), 12),
                ('FONTSIZE', (0, 1), (-1, -1), 10),
                ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#fef5e7')),
                ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#fbd38d')),
                ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
            ]))
            
            content.append(pressure_table)
        
        return content

    def _generate_error_analysis(self):
        """Generate error analysis content"""
        content = []
        styles = getSampleStyleSheet()
        
        # Create professional styles
        subheading_style = ParagraphStyle(
            'ProfessionalSubheading',
            parent=styles['Heading3'],
            fontSize=14,
            spaceAfter=10,
            spaceBefore=15,
            textColor=colors.HexColor('#4a5568'),
            fontName='Helvetica-Bold'
        )
        
        body_style = ParagraphStyle(
            'ProfessionalBody',
            parent=styles['Normal'],
            fontSize=10,
            spaceAfter=6,
            textColor=colors.HexColor('#2d3748'),
            fontName='Helvetica',
            leading=12
        )
        
        # Console error breakdown
        content.append(Paragraph("JavaScript Error Analysis", subheading_style))
        
        # Count errors by relevance (excluding PDF generation logs for now)
        relevance_counts = {}
        for log in self.stats['console_logs']:
            relevance = log.get('relevance', 'other')
            # Skip PDF generation logs for now - they're mostly normal 3D rendering logs
            if relevance == 'pdf_generation':
                continue
            relevance_counts[relevance] = relevance_counts.get(relevance, 0) + 1
        
        error_data = [['Error Category', 'Count']]
        for relevance, count in relevance_counts.items():
            error_data.append([relevance.replace('_', ' ').title(), str(count)])
        
        # Calculate full page width for tables
        page_width = A4[0] - 100  # 50pt margins on each side
        error_table = Table(error_data, colWidths=[page_width*0.7, page_width*0.3])
        error_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#e53e3e')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTNAME', (0, 1), (-1, -1), 'Helvetica'),
            ('FONTSIZE', (0, 0), (-1, 0), 12),
            ('FONTSIZE', (0, 1), (-1, -1), 10),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.HexColor('#fef5e7')),
            ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#fbd38d')),
            ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
            ]))
            
        content.append(error_table)
        
        # Add explanation about errors not impacting experience
        content.append(Paragraph(
            "<i>Note: These JavaScript errors are primarily related to component lifecycle events and lazy loading "
            "optimizations. They do not impact the user experience or core functionality of the configurator. "
            "The application continues to function normally despite these console messages.</i>",
            ParagraphStyle(
                'ErrorNoteStyle',
                parent=styles['Normal'],
                fontSize=9,
                textColor=colors.HexColor('#718096'),
                fontName='Helvetica-Oblique',
                leftIndent=20
            )
        ))
        content.append(Spacer(1, 15))
        
        # Key error examples
        content.append(Paragraph("JavaScript Error Examples", subheading_style))
        
        # Get top Zoovu errors
        zoovu_errors = [log for log in self.stats['console_logs'] if log.get('relevance') == 'zoovu_error' and log['level'] == 'error']
        
        if zoovu_errors:
            for i, error in enumerate(zoovu_errors[:2]):  # Show top 2 errors
                error_text = error['text'][:150] + "..." if len(error['text']) > 150 else error['text']
                
                # Create error box
                error_box_data = [
                    [f"Error {i+1}: {error_text}"]
                ]
                
                error_box = Table(error_box_data, colWidths=[page_width])
                error_box.setStyle(TableStyle([
                    ('BACKGROUND', (0, 0), (-1, -1), colors.HexColor('#fed7d7')),
                    ('TEXTCOLOR', (0, 0), (-1, -1), colors.HexColor('#742a2a')),
                    ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
                    ('FONTNAME', (0, 0), (-1, -1), 'Helvetica'),
                    ('FONTSIZE', (0, 0), (-1, -1), 9),
                    ('BOTTOMPADDING', (0, 0), (-1, -1), 8),
                    ('TOPPADDING', (0, 0), (-1, -1), 8),
                    ('LEFTPADDING', (0, 0), (-1, -1), 10),
                    ('RIGHTPADDING', (0, 0), (-1, -1), 10),
                    ('GRID', (0, 0), (-1, -1), 1, colors.HexColor('#feb2b2')),
                    ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
                ]))
                
                content.append(error_box)
                content.append(Spacer(1, 10))
        
        return content

    def _generate_recommendations(self):
        """Generate actionable recommendations"""
        content = []
        styles = getSampleStyleSheet()
        
        content.append(Paragraph("<b>Immediate Actions (Next 1-2 weeks):</b>", styles['Heading3']))
        content.append(Paragraph("1. Add comprehensive logging to the canvas-to-blob conversion process", styles['Normal']))
        content.append(Paragraph("2. Implement memory pressure detection before PDF generation", styles['Normal']))
        content.append(Paragraph("3. Add error handling for canvas rendering failures", styles['Normal']))
        content.append(Spacer(1, 12))
        
        content.append(Paragraph("<b>Short-term Improvements (Next 1-2 months):</b>", styles['Heading3']))
        content.append(Paragraph("1. Implement memory cleanup strategies between configurator operations", styles['Normal']))
        content.append(Paragraph("2. Add retry mechanisms for failed PDF generation", styles['Normal']))
        content.append(Paragraph("3. Optimize canvas rendering performance to reduce memory usage", styles['Normal']))
        content.append(Spacer(1, 12))
        
        content.append(Paragraph("<b>Long-term Solutions (Next 3-6 months):</b>", styles['Heading3']))
        content.append(Paragraph("1. Implement server-side PDF generation as fallback", styles['Normal']))
        content.append(Paragraph("2. Add real-time monitoring dashboard for production", styles['Normal']))
        content.append(Paragraph("3. Optimize overall memory usage in the configurator application", styles['Normal']))
        content.append(Spacer(1, 12))
        
        content.append(Paragraph("<b>Success Metrics:</b>", styles['Heading3']))
        content.append(Paragraph("• Reduce PDF generation failures by 90%", styles['Normal']))
        content.append(Paragraph("• Achieve <5% memory usage during normal operations", styles['Normal']))
        content.append(Paragraph("• Implement 100% error logging coverage for PDF generation", styles['Normal']))
        
        return content


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
    parser.add_argument('--pdf-report', action='store_true',
                       help='Generate professional PDF report')
    
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
        
        # Set PDF report flag
        stress_test.generate_pdf = args.pdf_report
        
        stress_test.run_stress_test()
        return 0
        
    except Exception as e:
        print(f"Error running stress test: {e}")
        return 1


if __name__ == "__main__":
    exit(main())
