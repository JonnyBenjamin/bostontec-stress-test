#!/usr/bin/env python3
"""
Command-line interface for the scalable testing system
"""

import argparse
import logging
import sys
from pathlib import Path

from core.test_engine import TestEngine
from core.config_loader import ConfigLoader


def setup_logging(level: str = "INFO"):
    """Setup logging configuration"""
    logging.basicConfig(
        level=getattr(logging, level.upper()),
        format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        handlers=[
            logging.StreamHandler(sys.stdout),
            logging.FileHandler('test_execution.log')
        ]
    )


def list_customers():
    """List all available customers"""
    config_loader = ConfigLoader()
    customers = config_loader.list_customers()
    
    if not customers:
        print("No customers found. Add customer configurations to configs/customers/")
        return
    
    print("Available customers:")
    for customer in customers:
        print(f"  - {customer}")


def list_test_paths(customer_name: str):
    """List all available test paths for a customer"""
    config_loader = ConfigLoader()
    test_paths = config_loader.list_test_paths(customer_name)
    
    if not test_paths:
        print(f"No test paths found for customer: {customer_name}")
        return
    
    print(f"Available test paths for {customer_name}:")
    for test_path in test_paths:
        print(f"  - {test_path}")


def run_test(customer_name: str, bug_type: str, iterations: int, headless: bool = False):
    """Run a test for a specific customer and bug type"""
    try:
        # Setup logging
        setup_logging()
        logger = logging.getLogger(__name__)
        
        # Initialize test engine
        test_engine = TestEngine()
        
        # Setup test
        actual_iterations = test_engine.setup_test(customer_name, bug_type, iterations)
        
        # Override headless setting if specified
        if headless:
            test_engine.customer_config.browser_config['headless'] = True
        
        logger.info(f"Running test: {customer_name} - {bug_type} ({actual_iterations} iterations)")
        
        # Run test
        summary = test_engine.run_test(actual_iterations)
        
        # Save results
        results_file = test_engine.save_results()
        
        # Print summary
        print("\n" + "="*50)
        print("TEST EXECUTION SUMMARY")
        print("="*50)
        print(f"Customer: {summary['customer']}")
        print(f"Bug Type: {summary['bug_type']}")
        print(f"Total Runs: {summary['total_runs']}")
        print(f"Successful: {summary['successful_runs']}")
        print(f"Failed: {summary['failed_runs']}")
        print(f"Success Rate: {summary['success_rate']:.1f}%")
        print(f"Average Run Time: {summary['average_run_time']:.1f}s")
        print(f"Results saved to: {results_file}")
        print("="*50)
        
        return summary
        
    except Exception as e:
        logger.error(f"Test execution failed: {e}")
        print(f"Error: {e}")
        return None


def main():
    """Main CLI entry point"""
    parser = argparse.ArgumentParser(
        description="Scalable Testing System - Multi-customer, multi-bug testing platform"
    )
    
    subparsers = parser.add_subparsers(dest='command', help='Available commands')
    
    # List customers command
    list_customers_parser = subparsers.add_parser('list-customers', help='List all available customers')
    
    # List test paths command
    list_paths_parser = subparsers.add_parser('list-paths', help='List test paths for a customer')
    list_paths_parser.add_argument('customer', help='Customer name')
    
    # Run test command
    run_parser = subparsers.add_parser('run', help='Run a test')
    run_parser.add_argument('customer', help='Customer name')
    run_parser.add_argument('bug_type', help='Bug type/test path name')
    run_parser.add_argument('-i', '--iterations', type=int, default=5, help='Number of iterations (default: 5)')
    run_parser.add_argument('--headless', action='store_true', help='Run browser in headless mode')
    run_parser.add_argument('--log-level', default='INFO', choices=['DEBUG', 'INFO', 'WARNING', 'ERROR'], help='Log level')
    
    args = parser.parse_args()
    
    if args.command == 'list-customers':
        list_customers()
    
    elif args.command == 'list-paths':
        list_test_paths(args.customer)
    
    elif args.command == 'run':
        setup_logging(args.log_level)
        run_test(args.customer, args.bug_type, args.iterations, args.headless)
    
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
