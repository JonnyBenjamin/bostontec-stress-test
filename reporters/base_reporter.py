"""
Base reporter class for report generation
"""

from abc import ABC, abstractmethod
from typing import Dict, Any


class BaseReporter(ABC):
    """Abstract base class for report generators"""
    
    @abstractmethod
    def generate_report(self, data: Dict[str, Any], output_path: str) -> str:
        """Generate report from data"""
        pass
    
    @abstractmethod
    def get_name(self) -> str:
        """Get reporter name"""
        pass
    
    @abstractmethod
    def get_file_extension(self) -> str:
        """Get file extension for this reporter"""
        pass
