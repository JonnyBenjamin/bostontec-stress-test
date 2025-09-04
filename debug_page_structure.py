#!/usr/bin/env python3
"""
Debug Page Structure Script for BostonTec Configurator
This script explores the actual page structure to find correct selectors.
"""

import json
import time
from playwright.sync_api import sync_playwright, Page
import logging

def setup_logging():
    """Setup basic logging"""
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s'
    )
    return logging.getLogger(__name__)

def explore_page_structure(page: Page, logger):
    """Explore the page structure to understand what's available"""
    logger.info("\n🔍 EXPLORING PAGE STRUCTURE")
    logger.info("="*60)
    
    # Get page title
    page_title = page.title()
    logger.info(f"📄 Page Title: {page_title}")
    
    # Look for common UI elements
    logger.info("\n🔍 Looking for common UI elements...")
    
    # Check for buttons
    buttons = page.locator('button')
    button_count = buttons.count()
    logger.info(f"📊 Total buttons found: {button_count}")
    
    if button_count > 0:
        logger.info("📝 First 10 button texts:")
        for i in range(min(10, button_count)):
            try:
                text = buttons.nth(i).text_content().strip()
                if text:
                    logger.info(f"   {i+1}. '{text}'")
            except:
                pass
    
    # Check for data-testid attributes
    testid_elements = page.locator('[data-testid]')
    testid_count = testid_elements.count()
    logger.info(f"\n🏷️  Elements with data-testid: {testid_count}")
    
    if testid_count > 0:
        logger.info("📝 First 15 data-testid values:")
        for i in range(min(15, testid_count)):
            try:
                testid = testid_elements.nth(i).get_attribute('data-testid')
                text = testid_elements.nth(i).text_content().strip()
                logger.info(f"   {i+1}. data-testid='{testid}' text='{text}'")
            except:
                pass
    
    # Check for aria-labelledby attributes
    aria_elements = page.locator('[aria-labelledby]')
    aria_count = aria_elements.count()
    logger.info(f"\n🎯 Elements with aria-labelledby: {aria_count}")
    
    if aria_count > 0:
        logger.info("📝 First 10 aria-labelledby values:")
        for i in range(min(10, aria_count)):
            try:
                aria_value = aria_elements.nth(i).get_attribute('aria-labelledby')
                text = aria_elements.nth(i).text_content().strip()
                logger.info(f"   {i+1}. aria-labelledby='{aria_value}' text='{text}'")
            except:
                pass
    
    # Look for specific text content from our test path
    logger.info("\n🔍 Looking for specific text content from test path...")
    test_path = load_test_path('test_path.json')
    
    for step in test_path:
        if step['selector_type'] == 'text':
            search_text = step['selector_value']
            logger.info(f"\n🔍 Searching for text: '{search_text}'")
            
            # Try different approaches to find this text
            # 1. Direct text search
            text_elements = page.locator(f"text='{search_text}'")
            count = text_elements.count()
            logger.info(f"   Direct text search: {count} elements")
            
            # 2. Contains text search
            contains_elements = page.locator(f"text*='{search_text}'")
            count = contains_elements.count()
            logger.info(f"   Contains text search: {count} elements")
            
            # 3. Look for partial matches
            if count == 0 and len(search_text) > 10:
                # Try with first few words
                partial_text = ' '.join(search_text.split()[:3])
                partial_elements = page.locator(f"text*='{partial_text}'")
                partial_count = partial_elements.count()
                logger.info(f"   Partial text search ('{partial_text}'): {partial_count} elements")
                
                if partial_count > 0:
                    logger.info("   📝 Partial matches found:")
                    for i in range(min(3, partial_count)):
                        try:
                            text = partial_elements.nth(i).text_content().strip()
                            logger.info(f"      {i+1}. '{text}'")
                        except:
                            pass

def search_for_specific_elements(page: Page, logger):
    """Search for specific elements mentioned in our test path"""
    logger.info("\n🎯 SEARCHING FOR SPECIFIC TEST PATH ELEMENTS")
    logger.info("="*60)
    
    test_path = load_test_path('test_path.json')
    
    for i, step in enumerate(test_path, 1):
        logger.info(f"\n📋 Step {i}: {step['step']}")
        logger.info(f"   Action: {step['action']}")
        logger.info(f"   Selector: {step['selector_type']} = '{step['selector_value']}'")
        
        if step['selector_type'] == 'text':
            search_text = step['selector_value']
            base = step.get('base', 'button')
            
            # Try the exact selector we're using
            exact_selector = f"{base}:has-text('{search_text}')"
            exact_elements = page.locator(exact_selector)
            exact_count = exact_elements.count()
            logger.info(f"   Exact selector '{exact_selector}': {exact_count} elements")
            
            if exact_count == 0:
                # Try broader search
                broader_elements = page.locator(f"text*='{search_text}'")
                broader_count = broader_elements.count()
                logger.info(f"   Broader text search: {broader_count} elements")
                
                if broader_count > 0:
                    logger.info("   📝 Found elements with similar text:")
                    for j in range(min(3, broader_count)):
                        try:
                            text = broader_elements.nth(j).text_content().strip()
                            tag_name = broader_elements.nth(j).evaluate('el => el.tagName.toLowerCase()')
                            logger.info(f"      {j+1}. <{tag_name}> '{text}'")
                        except:
                            pass
        
        elif step['selector_type'] == 'testid':
            testid_value = step['selector_value']
            selector = f'[data-testid="{testid_value}"]'
            elements = page.locator(selector)
            count = elements.count()
            logger.info(f"   Selector '{selector}': {count} elements")
            
            if count == 0:
                logger.info(f"   ❌ No elements found with data-testid='{testid_value}'")
        
        elif step['selector_type'] == 'aria_labelledby':
            aria_value = step['selector_value']
            selector = f'[aria-labelledby="{aria_value}"]'
            elements = page.locator(selector)
            count = elements.count()
            logger.info(f"   Selector '{selector}': {count} elements")
            
            if count == 0:
                logger.info(f"   ❌ No elements found with aria-labelledby='{aria_value}'")

def load_test_path(test_path_file: str):
    """Load the test path from JSON"""
    with open(test_path_file, 'r') as f:
        return json.load(f)

def main():
    logger = setup_logging()
    target_url = "https://www.bostontec.com/3d-workbench-builder/?"
    
    logger.info("🚀 Starting Page Structure Debug")
    logger.info(f"Target URL: {target_url}")
    
    try:
        with sync_playwright() as p:
            # Launch browser in visible mode
            browser = p.chromium.launch(headless=False)
            logger.info("🌐 Launched Chromium browser (visible mode)")
            
            # Create context and page
            context = browser.new_context()
            page = context.new_page()
            
            try:
                # Navigate to the page
                logger.info(f"📡 Navigating to: {target_url}")
                page.goto(target_url)
                
                # Wait for page to load
                logger.info("⏳ Waiting for page to load...")
                page.wait_for_load_state('domcontentloaded', timeout=30000)
                logger.info("✅ DOM content loaded")
                
                # Give page time to render dynamic content
                logger.info("⏳ Waiting for dynamic content...")
                time.sleep(5)
                
                # Explore the page structure
                explore_page_structure(page, logger)
                
                # Search for specific elements
                search_for_specific_elements(page, logger)
                
                # Keep browser open for manual inspection
                logger.info("\n🔍 Browser will remain open for manual inspection.")
                logger.info("You can now manually explore the page to see what elements are available.")
                logger.info("Press Enter when you're done...")
                input()
                
            finally:
                context.close()
                browser.close()
                logger.info("🔒 Browser closed")
                
    except Exception as e:
        logger.error(f"❌ Error during debug: {e}")
        return 1
    
    return 0

if __name__ == "__main__":
    exit(main())
