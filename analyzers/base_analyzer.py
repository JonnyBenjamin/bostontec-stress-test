"""
Base analyzer class for data analysis
"""

from abc import ABC, abstractmethod
from typing import Dict, Any, List


class BaseAnalyzer(ABC):
    """Abstract base class for data analyzers"""
    
    @abstractmethod
    def analyze(self, data: List[Dict[str, Any]]) -> Dict[str, Any]:
        """Analyze collected data"""
        pass
    
    @abstractmethod
    def get_name(self) -> str:
        """Get analyzer name"""
        pass
