"""
Data collection and monitoring
"""

from playwright.sync_api import Page
from typing import Dict, List, Any, Optional
import logging
import json
from datetime import datetime


class DataCollector:
    """Collects various types of data during test execution"""
    
    def __init__(self, config: Dict[str, bool]):
        self.config = config
        self.logger = logging.getLogger(__name__)
        self.console_logs: List[Dict[str, Any]] = []
        self.network_requests: List[Dict[str, Any]] = []
        self.performance_metrics: List[Dict[str, Any]] = []
        self.errors: List[Dict[str, Any]] = []
    
    def setup_page_listeners(self, page: Page):
        """Setup page event listeners based on configuration"""
        if self.config.get('error_capture', True):
            page.on('console', self._capture_console_log)
            page.on('pageerror', self._capture_page_error)
        
        if self.config.get('network_monitoring', True):
            page.on('request', lambda req: self._capture_network_request(req, 'request'))
            page.on('response', lambda resp: self._capture_network_request(resp, 'response'))
    
    def _capture_console_log(self, msg):
        """Capture console logs"""
        if not self._is_relevant_console_log(msg):
            return
        
        log_entry = {
            'timestamp': datetime.now().isoformat(),
            'type': msg.type,
            'text': msg.text,
            'location': str(msg.location) if msg.location else None,
            'relevance': self._get_console_log_relevance(msg)
        }
        
        self.console_logs.append(log_entry)
        self.logger.debug(f"Console {msg.type}: {msg.text}")
    
    def _capture_network_request(self, request_or_response, event_type: str):
        """Capture network requests and responses"""
        if not self._is_relevant_network_request(request_or_response, event_type):
            return
        
        if event_type == 'request':
            entry = {
                'timestamp': datetime.now().isoformat(),
                'type': 'request',
                'url': request_or_response.url,
                'method': request_or_response.method,
                'headers': dict(request_or_response.headers),
                'relevance': self._get_network_request_relevance(request_or_response.url)
            }
        else:  # response
            entry = {
                'timestamp': datetime.now().isoformat(),
                'type': 'response',
                'url': request_or_response.url,
                'status': request_or_response.status,
                'headers': dict(request_or_response.headers),
                'relevance': self._get_network_request_relevance(request_or_response.url)
            }
        
        self.network_requests.append(entry)
    
    def _capture_page_error(self, error):
        """Capture page errors"""
        error_entry = {
            'timestamp': datetime.now().isoformat(),
            'type': 'page_error',
            'message': str(error),
            'stack': error.stack if hasattr(error, 'stack') else None
        }
        
        self.errors.append(error_entry)
        self.logger.error(f"Page error: {error}")
    
    def capture_performance_metrics(self, page: Page, run_number: int, step_name: str = None):
        """Capture performance metrics"""
        if not self.config.get('performance_tracking', True):
            return
        
        try:
            # Get memory usage
            memory_info = page.evaluate("""
                () => {
                    if (performance.memory) {
                        return {
                            used: performance.memory.usedJSHeapSize,
                            total: performance.memory.totalJSHeapSize,
                            limit: performance.memory.jsHeapSizeLimit
                        };
                    }
                    return null;
                }
            """)
            
            # Get performance timing
            timing_info = page.evaluate("""
                () => {
                    const timing = performance.timing;
                    return {
                        load_time: timing.loadEventEnd - timing.navigationStart,
                        dom_ready: timing.domContentLoadedEventEnd - timing.navigationStart,
                        first_paint: performance.getEntriesByType('paint')[0]?.startTime || 0
                    };
                }
            """)
            
            metrics = {
                'timestamp': datetime.now().isoformat(),
                'run_number': run_number,
                'step_name': step_name,
                'memory': memory_info,
                'timing': timing_info
            }
            
            self.performance_metrics.append(metrics)
            
        except Exception as e:
            self.logger.error(f"Failed to capture performance metrics: {e}")
    
    def _is_relevant_console_log(self, msg) -> bool:
        """Determine if console log is relevant"""
        # Filter out irrelevant logs
        irrelevant_patterns = [
            'favicon.ico',
            'chrome-extension',
            'moz-extension',
            'safari-extension'
        ]
        
        text = msg.text.lower()
        return not any(pattern in text for pattern in irrelevant_patterns)
    
    def _get_console_log_relevance(self, msg) -> str:
        """Get relevance category for console log"""
        text = msg.text.lower()
        
        if any(keyword in text for keyword in ['error', 'exception', 'failed']):
            return 'error'
        elif any(keyword in text for keyword in ['warning', 'deprecated']):
            return 'warning'
        elif any(keyword in text for keyword in ['memory', 'leak', 'gc']):
            return 'memory'
        elif any(keyword in text for keyword in ['pdf', 'canvas', 'blob']):
            return 'pdf_generation'
        else:
            return 'other'
    
    def _is_relevant_network_request(self, request_or_response, event_type: str) -> bool:
        """Determine if network request is relevant"""
        url = request_or_response.url.lower()
        
        # Filter out irrelevant requests
        irrelevant_patterns = [
            'favicon.ico',
            'chrome-extension',
            'moz-extension',
            'safari-extension',
            'data:',
            'blob:'
        ]
        
        return not any(pattern in url for pattern in irrelevant_patterns)
    
    def _get_network_request_relevance(self, url: str) -> str:
        """Get relevance category for network request"""
        url_lower = url.lower()
        
        if 'api' in url_lower:
            return 'api_request'
        elif 'zoovu' in url_lower:
            return 'zoovu_request'
        elif any(ext in url_lower for ext in ['.js', '.css', '.png', '.jpg', '.gif']):
            return 'resource_request'
        else:
            return 'navigation_request'
    
    def get_collected_data(self) -> Dict[str, Any]:
        """Get all collected data"""
        return {
            'console_logs': self.console_logs,
            'network_requests': self.network_requests,
            'performance_metrics': self.performance_metrics,
            'errors': self.errors,
            'collection_timestamp': datetime.now().isoformat()
        }
    
    def clear_data(self):
        """Clear collected data"""
        self.console_logs.clear()
        self.network_requests.clear()
        self.performance_metrics.clear()
        self.errors.clear()
