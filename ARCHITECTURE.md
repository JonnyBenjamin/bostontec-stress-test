# BostonTec Stress Testing - System Architecture

## Overview
This document outlines the architecture of the BostonTec 3D Workbench Builder stress testing system. The system is designed to identify intermittent PDF export bugs through automated browser testing and comprehensive reporting.

## System Components

### 1. Core Testing Engine
**File:** `bostontec_stress_test.py`
- **Purpose:** Main automation script using Playwright
- **Responsibilities:**
  - Browser automation and test execution
  - Data collection (console logs, network requests, performance metrics)
  - Screenshot capture
  - JSON data export
- **Key Features:**
  - Configurable iterations (default: 5)
  - Multiple selector types (text, testid, composite, section_product)
  - Action types (click, increment_quantity)
  - Comprehensive error handling

### 2. Test Configuration
**File:** `test_path.json`
- **Purpose:** Defines the test sequence and selectors
- **Structure:** JSON array of test steps
- **Each Step Contains:**
  - `step`: Human-readable description
  - `action`: Type of action to perform
  - `selector_type`: How to locate elements
  - `selector_value`: Specific selector value
  - `base`: Optional base selector for text-based selection

### 3. Report Generation System

#### HTML Report Generator
**File:** `html_report_generator.py`
- **Purpose:** Creates modern HTML reports with visualizations
- **Features:**
  - Tailwind CSS styling (Notion/Linear inspired)
  - Memory usage scatter plot visualization
  - Individual risk level assessment
  - Professional executive summary
  - Technical findings tables
- **Visualizations:**
  - 100-run memory scatter plot with color-coded risk levels
  - Performance metrics tables
  - Error analysis breakdown

#### Mock Data Generator
**File:** `mock_memory_data.py`
- **Purpose:** Generates realistic test data for visualization development
- **Features:**
  - 100 varied test runs with realistic memory patterns
  - 70% green (normal), 20% yellow (caution), 10% red (high risk)
  - Performance metrics with run numbers and timestamps

### 4. Deployment System
**File:** `deploy_reports.py`
- **Purpose:** Automated GitHub Pages deployment
- **Features:**
  - Copies latest HTML report to GitHub Pages
  - Updates index.html with latest report link
  - Git commit and push automation

### 5. File Organization

#### Main Directory
```
bostontec_testing/
├── bostontec_stress_test.py      # Main testing script
├── test_path.json               # Test configuration
├── html_report_generator.py     # HTML report generator
├── mock_memory_data.py          # Mock data generator
├── deploy_reports.py            # Deployment script
├── cleanup_files.py             # File organization utility
├── requirements.txt             # Python dependencies
├── README.md                    # User documentation
├── PROJECT_HANDOFF.md           # Project handoff guide
├── ARCHITECTURE.md              # This file
└── NEXT_STEPS.md                # Current status and tasks
```

#### Generated Content
```
├── html_reports/                # Current HTML reports
├── pdf_reports/                 # PDF report versions
├── archive/                     # Organized historical data
│   ├── old_test_data/          # Historical JSON test data
│   ├── old_reports/            # Historical HTML reports
│   ├── old_mock_data/          # Historical mock data
│   └── debug_files/            # Debug images and logs
└── venv/                       # Python virtual environment
```

## Data Flow

### 1. Test Execution Flow
```
User Command → bostontec_stress_test.py → Playwright Browser → Target Application
     ↓
Data Collection (logs, metrics, screenshots) → JSON Export
     ↓
HTML Report Generation → GitHub Pages Deployment
```

### 2. Report Generation Flow
```
JSON Test Data → HTMLReportGenerator → Tailwind CSS Report
     ↓
Memory Analysis → Risk Assessment → Visualization
     ↓
GitHub Pages Deployment → Public Access
```

## Key Design Decisions

### 1. Single Script Architecture
- **Decision:** Consolidated all functionality into one main script
- **Rationale:** Simplicity, easier maintenance, single point of entry
- **Trade-off:** Larger file size, but better for this use case

### 2. HTML/CSS Visualizations
- **Decision:** Pure HTML/CSS instead of Chart.js
- **Rationale:** CDN loading issues, better control, no external dependencies
- **Implementation:** Scatter plots, tables, and progress bars using Tailwind CSS

### 3. Individual Risk Assessment
- **Decision:** Each metric gets its own risk level
- **Rationale:** More accurate and meaningful than blanket risk levels
- **Thresholds:** HIGH (≥50%), MEDIUM (35-49%), LOW (<35%)

### 4. Archive Organization
- **Decision:** Organized archive structure instead of deletion
- **Rationale:** Preserve historical data for analysis and debugging
- **Structure:** Categorized by file type and purpose

## Memory Analysis Architecture

### Risk Level Calculation
```python
def get_risk_level(value):
    if value >= 50:
        return "HIGH", "red"
    elif value >= 35:
        return "MEDIUM", "yellow"
    else:
        return "LOW", "green"
```

### Visualization Data Structure
```python
run_peaks = [
    {'run': 1, 'peak': 20.4},
    {'run': 2, 'peak': 45.2},
    # ... 100 runs total
]
```

## Error Handling Strategy

### 1. Test Execution
- Individual step failures don't crash the entire test
- Comprehensive logging of all errors and warnings
- Screenshot capture on failures for debugging

### 2. Report Generation
- Graceful handling of missing data
- Fallback values for incomplete metrics
- Error logging for debugging report generation issues

### 3. Deployment
- Git error handling with rollback capability
- File existence checks before operations
- Comprehensive logging of deployment steps

## Performance Considerations

### 1. Browser Efficiency
- Single browser instance for all iterations
- Proper resource cleanup after completion
- Configurable headless mode for faster execution

### 2. Data Collection
- Smart filtering of relevant logs only
- Efficient JSON serialization
- Organized file structure to prevent clutter

### 3. Report Generation
- Pure HTML/CSS for fast rendering
- No external CDN dependencies
- Optimized Tailwind CSS classes

## Security Considerations

### 1. Data Handling
- No sensitive data collection
- Public GitHub repository with appropriate .gitignore
- Local file storage only

### 2. Target Application
- Respectful testing with reasonable iteration limits
- No aggressive or malicious automation
- Proper error handling to avoid application stress

## Future Architecture Considerations

### 1. Scalability
- Current design supports up to 100+ iterations
- Archive system can handle large amounts of historical data
- Modular report generation allows for easy extension

### 2. Extensibility
- Plugin architecture for new report types
- Configurable visualization options
- Easy addition of new data collection types

### 3. Monitoring
- Real-time dashboard potential
- Integration with monitoring systems
- Automated alerting for high-risk patterns

## Dependencies

### Python Packages
- `playwright`: Browser automation
- `json`: Data serialization
- `datetime`: Timestamp handling
- `os`, `shutil`: File operations
- `glob`: File pattern matching

### External Services
- **GitHub Pages:** Report hosting
- **Target Application:** BostonTec 3D Workbench Builder

## Maintenance Guidelines

### 1. Regular Updates
- Update selectors when target application changes
- Review and update test path as needed
- Keep dependencies up to date

### 2. Data Management
- Run cleanup script periodically
- Archive old reports to maintain organization
- Monitor disk usage for generated files

### 3. Documentation
- Update architecture document for significant changes
- Keep README current with new features
- Document any new configuration options

---

*This architecture document should be updated whenever significant changes are made to the system structure or design decisions.*
