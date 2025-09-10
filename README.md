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
- **Modern HTML Reports**: Professional reports with Tailwind CSS styling
- **Memory Visualization**: 100-run scatter plot with color-coded risk assessment
- **GitHub Pages Integration**: Automated deployment of reports
- **Organized File Structure**: Clean archive system for historical data

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

### Generated Files

- **Console Output**: Real-time progress and results
- **Log File**: `bostontec_stress_test.log` with detailed execution history
- **Screenshots**: `run_X_final_state.png` after each test run
- **Data Export**: `bostontec_stress_test_data_TIMESTAMP.json` with comprehensive data
- **HTML Reports**: Professional reports in `html_reports/` directory
- **PDF Reports**: PDF versions in `pdf_reports/` directory

### Enhanced Logging

The script captures:
- **Console Logs**: JavaScript errors, warnings, and logs
- **Network Requests**: API calls, failures, response times
- **Element State**: Before/after interaction states
- **Performance Metrics**: Execution timing and browser performance
- **Memory Usage**: Browser memory consumption patterns

### Report Features

- **Executive Summary**: High-level findings and recommendations
- **Memory Analysis**: 100-run scatter plot with risk assessment
- **Technical Findings**: Detailed performance metrics and statistics
- **Error Analysis**: Categorized error breakdown and context
- **Professional Styling**: Modern Tailwind CSS design

### Statistics

The script provides a comprehensive summary including:
- Total runs attempted
- Successful vs. failed runs
- Success rate percentage
- Average, fastest, and slowest run times
- Console error/warning counts
- Network failure statistics
- Memory usage patterns and risk levels

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

## Project Structure

### Core Files
- `bostontec_stress_test.py` - Main testing script
- `test_path.json` - Test configuration
- `html_report_generator.py` - HTML report generator
- `mock_memory_data.py` - Mock data generator for development
- `deploy_reports.py` - GitHub Pages deployment
- `cleanup_files.py` - File organization utility

### Generated Content
- `html_reports/` - Current HTML reports
- `pdf_reports/` - PDF report versions
- `archive/` - Organized historical data
  - `old_test_data/` - Historical JSON test data
  - `old_reports/` - Historical HTML reports
  - `old_mock_data/` - Historical mock data
  - `debug_files/` - Debug images and logs

### Documentation
- `README.md` - This file (user guide)
- `PROJECT_HANDOFF.md` - Project handoff guide
- `ARCHITECTURE.md` - System architecture documentation
- `NEXT_STEPS.md` - Current status and tasks

## Report Generation

### HTML Reports
Generate professional HTML reports with visualizations:
```bash
python html_report_generator.py
```

### Mock Data
Generate realistic test data for development:
```bash
python mock_memory_data.py
```

### Deployment
Deploy reports to GitHub Pages:
```bash
python deploy_reports.py
```

### File Cleanup
Organize historical files:
```bash
python cleanup_files.py
```

## Contributing

When modifying the test path or script:

1. Test with a small number of iterations first
2. Verify selectors still work with the current application version
3. Update documentation for any new features or changes
4. Run the cleanup script to maintain organized file structure

## License

This script is provided as-is for testing purposes. Please ensure you have permission to test the target application.
