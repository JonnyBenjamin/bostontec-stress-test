# Scalable Testing System - New Architecture

## Overview

This is the new scalable architecture for multi-customer, multi-bug testing. It's designed to support testing different customers and different types of bugs with a clean, modular structure.

## Architecture

```
bostontec_testing/
├── configs/
│   ├── customers/
│   │   ├── bostontec/
│   │   │   ├── config.yaml              # Customer-specific settings
│   │   │   ├── test_paths/
│   │   │   │   └── pdf_export_bug.json  # Specific bug test path
│   │   │   └── selectors/
│   │   │       ├── elements.yaml        # Customer-specific selectors
│   │   │       └── validation.yaml      # Success/failure criteria
│   │   └── microsoft/                   # Future customer
│   └── global/
│       ├── default_config.yaml         # Global defaults
│       └── success_criteria.yaml       # Standardized success criteria
├── core/
│   ├── test_engine.py                  # Main test orchestration
│   ├── browser_manager.py              # Browser automation
│   ├── data_collector.py               # Data collection
│   ├── config_loader.py                # Configuration management
│   └── test_executor.py                # Test execution
├── collectors/                         # Pluggable data collectors
├── analyzers/                          # Data analysis modules
├── reporters/                          # Report generation
├── utils/                              # Utility functions
└── cli.py                              # Command-line interface
```

## Quick Start

### 1. Install Dependencies
```bash
pip install -r requirements_new.txt
playwright install chromium
```

### 2. Run Existing BostonTec Test
```bash
# List available customers
python cli.py list-customers

# List test paths for BostonTec
python cli.py list-paths bostontec

# Run PDF export bug test
python cli.py run bostontec pdf_export_bug --iterations 5
```

### 3. Add New Customer (Microsoft Example)

#### Create Customer Directory
```bash
mkdir -p configs/customers/microsoft/test_paths
mkdir -p configs/customers/microsoft/selectors
```

#### Create Customer Config
```yaml
# configs/customers/microsoft/config.yaml
customer:
  name: "Microsoft"
  domain: "microsoft.com"
  target_url: "https://www.microsoft.com/en-us/windows/laptops"

data_collection:
  memory_monitoring: true
  performance_tracking: true
  error_capture: true
  network_monitoring: true

reporting:
  customer_branding:
    logo: "assets/microsoft_logo.png"
    primary_color: "#0078d4"
```

#### Create Test Path
```json
// configs/customers/microsoft/test_paths/windows11_performance.json
{
  "bug_type": "windows11_performance",
  "description": "Test Windows 11 laptop browsing performance",
  "expected_behavior": "Smooth navigation and fast page loads",
  "steps": [
    {
      "step": "Navigate to laptops page",
      "action": "navigate",
      "url": "https://www.microsoft.com/en-us/windows/laptops"
    },
    {
      "step": "Click on first laptop",
      "action": "click",
      "selector_type": "css",
      "selector_value": ".product-card:first-child"
    }
  ]
}
```

#### Run Test
```bash
python cli.py run microsoft windows11_performance --iterations 10
```

## Key Features

### 1. **Configuration-Driven**
- No code changes needed for new customers
- Just add config files and test paths
- Easy to customize what gets tested

### 2. **Standardized Success Criteria**
- Global benchmarks apply to all customers
- Consistent reporting across different sites
- Industry-standard Web Vitals

### 3. **Modular Architecture**
- Pluggable data collectors
- Extensible analyzers
- Multiple report formats

### 4. **CLI Interface**
- Easy command-line usage
- List customers and test paths
- Flexible test execution

## Migration from Old System

The new architecture is designed to be backward compatible. The existing BostonTec test has been migrated to the new structure:

- **Old**: `bostontec_stress_test.py` (1591 lines)
- **New**: Modular structure with clear separation of concerns

### Benefits of Migration

1. **Maintainability**: Each component has a single responsibility
2. **Scalability**: Easy to add new customers and bug types
3. **Testability**: Individual components can be tested in isolation
4. **Reusability**: Components can be reused across different customers

## Next Steps

1. **Test the new architecture** with existing BostonTec tests
2. **Add new customers** using the configuration system
3. **Extend collectors and analyzers** as needed
4. **Add new report formats** for different stakeholders

## CLI Commands

```bash
# List all customers
python cli.py list-customers

# List test paths for a customer
python cli.py list-paths bostontec

# Run a test
python cli.py run bostontec pdf_export_bug --iterations 10 --headless

# Run with custom log level
python cli.py run bostontec pdf_export_bug --log-level DEBUG
```

This new architecture provides a solid foundation for scaling the testing system to support multiple customers and bug types while maintaining clean, maintainable code.
