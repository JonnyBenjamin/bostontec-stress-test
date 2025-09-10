"""
Browser management and automation
"""

from playwright.sync_api import sync_playwright, Page, Browser, BrowserContext
from typing import Dict, Any, Optional
import logging


class BrowserManager:
    """Manages browser instances and page automation"""
    
    def __init__(self, config: Dict[str, Any]):
        self.config = config
        self.browser: Optional[Browser] = None
        self.context: Optional[BrowserContext] = None
        self.page: Optional[Page] = None
        self.playwright = None
        self.logger = logging.getLogger(__name__)
    
    def start_browser(self):
        """Start browser instance"""
        self.playwright = sync_playwright().start()
        
        # Launch browser with configuration
        self.browser = self.playwright.chromium.launch(
            headless=self.config.get('headless', False),
            args=[
                '--no-sandbox',
                '--disable-dev-shm-usage',
                '--disable-gpu',
                '--disable-web-security',
                '--disable-features=VizDisplayCompositor'
            ]
        )
        
        # Create context with viewport settings
        viewport = self.config.get('viewport', {'width': 1920, 'height': 1080})
        self.context = self.browser.new_context(
            viewport=viewport,
            user_agent=self.config.get('user_agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36')
        )
        
        # Create new page
        self.page = self.context.new_page()
        
        # Set default timeout
        self.page.set_default_timeout(self.config.get('timeout', 30000))
        
        self.logger.info("Browser started successfully")
    
    def close_browser(self):
        """Close browser instance"""
        if self.browser:
            self.browser.close()
        if self.playwright:
            self.playwright.stop()
        self.logger.info("Browser closed")
    
    def navigate_to(self, url: str) -> bool:
        """Navigate to URL"""
        try:
            self.page.goto(url)
            self.logger.info(f"Navigated to: {url}")
            return True
        except Exception as e:
            self.logger.error(f"Failed to navigate to {url}: {e}")
            return False
    
    def wait_for_page_load(self, timeout: int = 30000) -> bool:
        """Wait for page to fully load"""
        try:
            self.page.wait_for_load_state('networkidle', timeout=timeout)
            return True
        except Exception as e:
            self.logger.error(f"Page load timeout: {e}")
            return False
    
    def take_screenshot(self, filename: str) -> bool:
        """Take screenshot of current page"""
        try:
            self.page.screenshot(path=filename, full_page=True)
            self.logger.info(f"Screenshot saved: {filename}")
            return True
        except Exception as e:
            self.logger.error(f"Failed to take screenshot: {e}")
            return False
    
    def get_page(self) -> Page:
        """Get current page instance"""
        return self.page
