"""
Configuration loader for multi-customer support
"""

import yaml
import json
from pathlib import Path
from typing import Dict, Any, List
from dataclasses import dataclass


@dataclass
class CustomerConfig:
    """Customer configuration data"""
    name: str
    domain: str
    target_url: str
    browser_config: Dict[str, Any]
    data_collection: Dict[str, bool]
    reporting: Dict[str, Any]
    test_environment: Dict[str, Any]
    max_iterations: int
    default_iterations: int


@dataclass
class TestPath:
    """Test path data"""
    bug_type: str
    description: str
    expected_behavior: str
    steps: List[Dict[str, Any]]


class ConfigLoader:
    """Loads and manages configuration for customers and test paths"""
    
    def __init__(self, config_dir: str = "configs"):
        self.config_dir = Path(config_dir)
        self.global_config = self._load_global_config()
        self.success_criteria = self._load_success_criteria()
    
    def _load_global_config(self) -> Dict[str, Any]:
        """Load global default configuration"""
        global_config_path = self.config_dir / "global" / "default_config.yaml"
        if global_config_path.exists():
            with open(global_config_path, 'r') as f:
                return yaml.safe_load(f)
        return {}
    
    def _load_success_criteria(self) -> Dict[str, Any]:
        """Load global success criteria"""
        criteria_path = self.config_dir / "global" / "success_criteria.yaml"
        if criteria_path.exists():
            with open(criteria_path, 'r') as f:
                return yaml.safe_load(f)
        return {}
    
    def load_customer_config(self, customer_name: str) -> CustomerConfig:
        """Load customer-specific configuration"""
        customer_dir = self.config_dir / "customers" / customer_name
        config_path = customer_dir / "config.yaml"
        
        if not config_path.exists():
            raise FileNotFoundError(f"Customer config not found: {config_path}")
        
        with open(config_path, 'r') as f:
            customer_config = yaml.safe_load(f)
        
        # Merge with global defaults
        merged_config = self._merge_configs(self.global_config, customer_config)
        
        return CustomerConfig(
            name=merged_config['customer']['name'],
            domain=merged_config['customer']['domain'],
            target_url=merged_config['customer']['target_url'],
            browser_config=merged_config['browser'],
            data_collection=merged_config['data_collection'],
            reporting=merged_config['reporting'],
            test_environment=merged_config['test_environment'],
            max_iterations=merged_config.get('max_iterations', 5),
            default_iterations=merged_config.get('default_iterations', 5)
        )
    
    def load_test_path(self, customer_name: str, bug_type: str) -> TestPath:
        """Load test path for specific customer and bug type"""
        test_path_file = self.config_dir / "customers" / customer_name / "test_paths" / f"{bug_type}.json"
        
        if not test_path_file.exists():
            raise FileNotFoundError(f"Test path not found: {test_path_file}")
        
        with open(test_path_file, 'r') as f:
            test_data = json.load(f)
        
        return TestPath(
            bug_type=test_data['bug_type'],
            description=test_data['description'],
            expected_behavior=test_data['expected_behavior'],
            steps=test_data['steps']
        )
    
    def list_customers(self) -> List[str]:
        """List all available customers"""
        customers_dir = self.config_dir / "customers"
        if not customers_dir.exists():
            return []
        
        return [d.name for d in customers_dir.iterdir() if d.is_dir()]
    
    def list_test_paths(self, customer_name: str) -> List[str]:
        """List all available test paths for a customer"""
        test_paths_dir = self.config_dir / "customers" / customer_name / "test_paths"
        if not test_paths_dir.exists():
            return []
        
        return [f.stem for f in test_paths_dir.glob("*.json")]
    
    def _merge_configs(self, global_config: Dict[str, Any], customer_config: Dict[str, Any]) -> Dict[str, Any]:
        """Merge global and customer configurations"""
        merged = global_config.copy()
        
        for key, value in customer_config.items():
            if key in merged and isinstance(merged[key], dict) and isinstance(value, dict):
                merged[key] = self._merge_configs(merged[key], value)
            else:
                merged[key] = value
        
        return merged
