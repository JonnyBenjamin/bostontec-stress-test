"""
Base collector class for data collection
"""

from abc import ABC, abstractmethod
from typing import Dict, Any
from playwright.sync_api import Page


class BaseCollector(ABC):
    """Abstract base class for data collectors"""
    
    @abstractmethod
    def collect(self, page: Page, context: Dict[str, Any]) -> Dict[str, Any]:
        """Collect data from the page"""
        pass
    
    @abstractmethod
    def get_name(self) -> str:
        """Get collector name"""
        pass
