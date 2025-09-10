"""
Main test engine that orchestrates the entire testing process
"""

import logging
import time
from datetime import datetime
from typing import Dict, List, Any, Optional
from pathlib import Path

from .browser_manager import BrowserManager
from .data_collector import DataCollector
from .test_executor import TestExecutor
from .config_loader import ConfigLoader, CustomerConfig, TestPath


class TestEngine:
    """Main test engine that orchestrates testing"""
    
    def __init__(self, config_dir: str = "configs"):
        self.config_loader = ConfigLoader(config_dir)
        self.logger = logging.getLogger(__name__)
        
        # Components
        self.browser_manager: Optional[BrowserManager] = None
        self.data_collector: Optional[DataCollector] = None
        self.test_executor: Optional[TestExecutor] = None
        
        # Configuration
        self.customer_config: Optional[CustomerConfig] = None
        self.test_path: Optional[TestPath] = None
        
        # Test results
        self.test_results: List[Dict[str, Any]] = []
        self.start_time: Optional[datetime] = None
        self.end_time: Optional[datetime] = None
    
    def setup_test(self, customer_name: str, bug_type: str, iterations: int = 5):
        """Setup test configuration"""
        self.logger.info(f"Setting up test for {customer_name} - {bug_type}")
        
        # Load configurations
        self.customer_config = self.config_loader.load_customer_config(customer_name)
        self.test_path = self.config_loader.load_test_path(customer_name, bug_type)
        
        # Validate iterations
        max_iterations = self.customer_config.max_iterations
        if iterations > max_iterations:
            self.logger.warning(f"Requested {iterations} iterations exceeds max {max_iterations}")
            iterations = max_iterations
        
        # Initialize components
        self.browser_manager = BrowserManager(self.customer_config.browser_config)
        self.data_collector = DataCollector(self.customer_config.data_collection)
        self.test_executor = TestExecutor()
        
        self.logger.info(f"Test setup complete: {iterations} iterations")
        return iterations
    
    def run_test(self, iterations: int = 5) -> Dict[str, Any]:
        """Run the complete test suite"""
        self.start_time = datetime.now()
        self.logger.info(f"Starting test execution: {iterations} iterations")
        
        # Start browser
        self.browser_manager.start_browser()
        page = self.browser_manager.get_page()
        
        # Setup data collection
        self.data_collector.setup_page_listeners(page)
        
        # Navigate to target URL
        if not self.browser_manager.navigate_to(self.customer_config.target_url):
            raise Exception(f"Failed to navigate to {self.customer_config.target_url}")
        
        # Wait for page load
        self.browser_manager.wait_for_page_load()
        
        # Execute test runs
        successful_runs = 0
        failed_runs = 0
        
        for run_number in range(1, iterations + 1):
            self.logger.info(f"Executing test run {run_number}/{iterations}")
            
            # Clear data collector for new run
            self.data_collector.clear_data()
            
            # Capture initial performance metrics
            self.data_collector.capture_performance_metrics(page, run_number, "start")
            
            # Execute test steps
            success = self.test_executor.execute_test_run(
                page, 
                self.test_path.steps, 
                run_number
            )
            
            # Capture final performance metrics
            self.data_collector.capture_performance_metrics(page, run_number, "end")
            
            # Take screenshot
            screenshot_path = f"run_{run_number}_final_state.png"
            self.browser_manager.take_screenshot(screenshot_path)
            
            # Collect run data
            run_data = {
                'run_number': run_number,
                'success': success,
                'timestamp': datetime.now().isoformat(),
                'screenshot': screenshot_path,
                'data': self.data_collector.get_collected_data()
            }
            
            self.test_results.append(run_data)
            
            if success:
                successful_runs += 1
                self.logger.info(f"Test run {run_number} completed successfully")
            else:
                failed_runs += 1
                self.logger.error(f"Test run {run_number} failed")
            
            # Brief pause between runs
            time.sleep(2)
        
        # Close browser
        self.browser_manager.close_browser()
        
        self.end_time = datetime.now()
        
        # Generate summary
        summary = self._generate_summary(successful_runs, failed_runs)
        
        self.logger.info(f"Test execution complete: {successful_runs} successful, {failed_runs} failed")
        
        return summary
    
    def _generate_summary(self, successful_runs: int, failed_runs: int) -> Dict[str, Any]:
        """Generate test summary"""
        total_runs = successful_runs + failed_runs
        success_rate = (successful_runs / total_runs * 100) if total_runs > 0 else 0
        
        # Calculate run times
        run_times = []
        for result in self.test_results:
            if result['success']:
                # Calculate run time (simplified)
                run_times.append(30.0)  # Placeholder - would calculate actual time
        
        return {
            'customer': self.customer_config.name,
            'bug_type': self.test_path.bug_type,
            'total_runs': total_runs,
            'successful_runs': successful_runs,
            'failed_runs': failed_runs,
            'success_rate': success_rate,
            'run_times': run_times,
            'average_run_time': sum(run_times) / len(run_times) if run_times else 0,
            'start_time': self.start_time.isoformat(),
            'end_time': self.end_time.isoformat(),
            'test_results': self.test_results
        }
    
    def save_results(self, output_dir: str = "results"):
        """Save test results to files"""
        output_path = Path(output_dir)
        output_path.mkdir(exist_ok=True)
        
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        
        # Save JSON data
        json_file = output_path / f"{self.customer_config.name}_{self.test_path.bug_type}_{timestamp}.json"
        import json
        with open(json_file, 'w') as f:
            json.dump(self.test_results, f, indent=2)
        
        self.logger.info(f"Results saved to {json_file}")
        return str(json_file)
