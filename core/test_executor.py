"""
Test execution logic
"""

from playwright.sync_api import Page
from typing import Dict, List, Any, Optional, Tuple
import logging
import time


class TestExecutor:
    """Executes test steps and manages test flow"""
    
    def __init__(self):
        self.logger = logging.getLogger(__name__)
    
    def execute_step(self, page: Page, step: Dict[str, Any], run_number: int, step_number: int) -> bool:
        """Execute a single test step"""
        try:
            self.logger.info(f"Run {run_number}, Step {step_number}: {step['step']}")
            
            if step['action'] == 'click':
                return self._execute_click(page, step)
            elif step['action'] == 'increment_quantity':
                return self._execute_increment_quantity(page, step)
            elif step['action'] == 'navigate':
                return self._execute_navigate(page, step)
            elif step['action'] == 'wait':
                return self._execute_wait(page, step)
            elif step['action'] == 'type':
                return self._execute_type(page, step)
            elif step['action'] == 'scroll':
                return self._execute_scroll(page, step)
            else:
                self.logger.error(f"Unknown action: {step['action']}")
                return False
                
        except Exception as e:
            self.logger.error(f"Step execution failed: {e}")
            return False
    
    def _execute_click(self, page: Page, step: Dict[str, Any]) -> bool:
        """Execute click action"""
        element = self._locate_element(page, step)
        if element:
            element.click()
            time.sleep(1)  # Brief pause after click
            return True
        return False
    
    def _execute_increment_quantity(self, page: Page, step: Dict[str, Any]) -> bool:
        """Execute quantity increment action"""
        selector_type = step['selector_type']
        selector_value = step['selector_value']
        
        if selector_type == 'section_product':
            # Wait a bit for the page to load
            time.sleep(2)
            
            # Try multiple selector approaches
            selectors_to_try = [
                f"[data-product-id='{selector_value}']",
                f"[data-testid='{selector_value}']",
                f"#{selector_value}",
                f".{selector_value}",
                f"[id*='{selector_value}']",
                f"[class*='{selector_value}']"
            ]
            
            for selector in selectors_to_try:
                self.logger.info(f"Trying selector: {selector}")
                section = page.locator(selector)
                
                if section.count() > 0:
                    self.logger.info(f"Found section with selector: {selector}")
                    
                    # Look for increment button within the section
                    increment_button = section.locator('[data-testid="increment-button"]')
                    if increment_button.count() > 0:
                        increment_button.click()
                        time.sleep(1)
                        self.logger.info(f"Incremented quantity in section: {selector_value}")
                        return True
                    else:
                        self.logger.error(f"Increment button not found in section {selector_value}")
                        # Try alternative increment button selectors
                        alt_selectors = [
                            'button[data-testid="increment"]',
                            'button[aria-label*="increment"]',
                            'button[title*="increment"]',
                            '.increment-button',
                            'button:has-text("+")'
                        ]
                        
                        for alt_selector in alt_selectors:
                            alt_button = section.locator(alt_selector)
                            if alt_button.count() > 0:
                                alt_button.click()
                                time.sleep(1)
                                self.logger.info(f"Incremented quantity using alternative selector: {alt_selector}")
                                return True
                else:
                    self.logger.info(f"No elements found with selector: {selector}")
            
            self.logger.error(f"Section not found for product ID: {selector_value} with any selector")
        
        self.logger.error(f"Could not find increment button for {selector_value}")
        return False
    
    def _execute_navigate(self, page: Page, step: Dict[str, Any]) -> bool:
        """Execute navigation action"""
        url = step.get('url')
        if url:
            page.goto(url)
            time.sleep(2)  # Wait for navigation
            return True
        return False
    
    def _execute_wait(self, page: Page, step: Dict[str, Any]) -> bool:
        """Execute wait action"""
        duration = step.get('duration', 1000) / 1000  # Convert ms to seconds
        time.sleep(duration)
        return True
    
    def _execute_type(self, page: Page, step: Dict[str, Any]) -> bool:
        """Execute type action"""
        element = self._locate_element(page, step)
        if element:
            text = step.get('text', '')
            element.fill(text)
            time.sleep(0.5)
            return True
        return False
    
    def _execute_scroll(self, page: Page, step: Dict[str, Any]) -> bool:
        """Execute scroll action"""
        direction = step.get('direction', 'down')
        pixels = step.get('pixels', 500)
        
        if direction == 'down':
            page.evaluate(f"window.scrollBy(0, {pixels})")
        elif direction == 'up':
            page.evaluate(f"window.scrollBy(0, -{pixels})")
        
        time.sleep(1)
        return True
    
    def _locate_element(self, page: Page, step: Dict[str, Any]) -> Optional[Any]:
        """Locate element based on selector type"""
        selector_type = step['selector_type']
        selector_value = step['selector_value']
        base = step.get('base')
        
        try:
            if selector_type == 'text':
                if base:
                    # Find element by text within base selector
                    base_element = page.locator(base)
                    return base_element.locator(f"text={selector_value}").first
                else:
                    return page.locator(f"text={selector_value}").first
            
            elif selector_type == 'testid':
                return page.locator(f"[data-testid='{selector_value}']").first
            
            elif selector_type == 'composite':
                return page.locator(selector_value).first
            
            elif selector_type == 'css':
                return page.locator(selector_value).first
            
            elif selector_type == 'id':
                return page.locator(f"#{selector_value}").first
            
            elif selector_type == 'class':
                return page.locator(f".{selector_value}").first
            
            else:
                self.logger.error(f"Unknown selector type: {selector_type}")
                return None
                
        except Exception as e:
            self.logger.error(f"Element location failed: {e}")
            return None
    
    def execute_test_run(self, page: Page, steps: List[Dict[str, Any]], run_number: int) -> bool:
        """Execute a complete test run"""
        self.logger.info(f"Starting test run {run_number}")
        
        for step_number, step in enumerate(steps, 1):
            success = self.execute_step(page, step, run_number, step_number)
            if not success:
                self.logger.error(f"Test run {run_number} failed at step {step_number}")
                return False
        
        self.logger.info(f"Test run {run_number} completed successfully")
        return True
