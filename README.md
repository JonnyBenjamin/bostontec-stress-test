# BostonTec Configurator Stress Test

A comprehensive Playwright-based automation script designed to stress test the BostonTec 3D Workbench Builder web configurator and help identify intermittent PDF export bugs.

## Overview

This script executes a predefined test path multiple times to simulate real user behavior at scale. It's designed to help surface intermittent rendering or export bugs that may occur during production-like flows.

## Features

- **Single Script**: One consolidated script that does everything
- **Multiple Test Iterations**: Configurable number of test runs (default: 5)
- **Single Browser Window**: Efficient execution in one Chromium instance
- **Enhanced Logging**: Console logs, network requests, performance metrics, element state
- **Screenshot Capture**: Automatic screenshots after each test run
- **Flexible Element Selection**: Supports text, testid, composite, and section_product selectors
- **Action Types**: Click and quantity increment operations
- **Comprehensive Data Export**: JSON export with all captured data

## Prerequisites

- Python 3.7+
- Playwright browser binaries

## Installation

1. **Clone or download the project files**

2. **Install Python dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Install Playwright browsers**:
   ```bash
   playwright install chromium
   ```

## Configuration

### Test Path JSON Structure

The script reads test steps from a JSON file. Each step contains:

```json
{
  "step": "Human-readable step name",
  "action": "click|increment_quantity",
  "selector_type": "text|testid|composite|section_product",
  "selector_value": "Value to locate the element",
  "base": "Optional base selector for text-based selection"
}
```

### Action Types

- **`click`**: Locate and click the element
- **`increment_quantity`**: Find section and click increment button

### Selector Types

- **`text`**: Find element by text content within a base selector
- **`testid`**: Find element by `data-testid` attribute
- **`composite`**: Use complex CSS selectors
- **`section_product`**: Target product sections by class

## Usage

### Basic Usage

Run the stress test with default settings (5 iterations):

```bash
python bostontec_stress_test.py
```

### Command Line Options

```bash
python bostontec_stress_test.py [OPTIONS]

Options:
  -i, --iterations INT    Number of test iterations (default: 5)
  -t, --test-path PATH   Path to test path JSON file (default: test_path.json)
  --headless             Run browser in headless mode
  -v, --verbose          Enable verbose logging
  -h, --help            Show help message
```

### Examples

**Run 10 iterations**:
```bash
python bostontec_stress_test.py --iterations 10
```

**Run 25 iterations for extended stress testing**:
```bash
python bostontec_stress_test.py -i 25
```

**Run in headless mode**:
```bash
python bostontec_stress_test.py --headless
```

## Output

### Logs

- **Console Output**: Real-time progress and results
- **Log File**: `bostontec_stress_test.log` with detailed execution history
- **Screenshots**: `run_X_final_state.png` after each test run
- **Data Export**: `bostontec_stress_test_data_TIMESTAMP.json` with comprehensive data

### Enhanced Logging

The script captures:
- **Console Logs**: JavaScript errors, warnings, and logs
- **Network Requests**: API calls, failures, response times
- **Element State**: Before/after interaction states
- **Performance Metrics**: Execution timing and browser performance

### Statistics

The script provides a comprehensive summary including:
- Total runs attempted
- Successful vs. failed runs
- Success rate percentage
- Average, fastest, and slowest run times
- Console error/warning counts
- Network failure statistics

## Troubleshooting

### Common Issues

1. **Element Not Found**: Check if selectors in your JSON file match the current page structure
2. **Timeout Errors**: The target application may be slow to load; consider increasing wait times
3. **Browser Launch Issues**: Ensure Playwright browsers are properly installed

### Debug Mode

Enable verbose logging to see detailed execution information:

```bash
python bostontec_stress_test.py --verbose
```

### Manual Verification

Run with `--headless false` to see the browser in action:

```bash
python bostontec_stress_test.py --headless false
```

## Safety Features

- **Automatic Cleanup**: Browser is properly closed after completion
- **Error Handling**: Individual step failures don't crash the entire test
- **Resource Management**: Single browser instance for efficiency
- **Data Preservation**: All logs and screenshots are saved

## Contributing

When modifying the test path or script:

1. Test with a small number of iterations first
2. Verify selectors still work with the current application version
3. Update documentation for any new features or changes

## License

This script is provided as-is for testing purposes. Please ensure you have permission to test the target application.
