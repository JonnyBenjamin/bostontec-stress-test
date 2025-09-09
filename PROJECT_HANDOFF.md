# BostonTec 3D Workbench Builder - Stress Testing Project Handoff

## Project Overview
Automated stress testing system for the BostonTec 3D Workbench Builder web configurator to identify intermittent PDF export bugs (missing images). The system uses Playwright for browser automation and generates comprehensive reports for analysis.

**Target URL:** https://www.bostontec.com/3d-workbench-builder/?

## Current Status: ✅ FULLY FUNCTIONAL
- ✅ Core stress testing automation working
- ✅ PDF report generation working
- ✅ HTML report generation working
- ✅ GitHub Pages deployment working
- ✅ Performance monitoring implemented
- ✅ Smart filtering for relevant logs
- ✅ Professional report styling

## Key Files & Structure

### Core Scripts
- **`bostontec_stress_test.py`** - Main automation script (single consolidated script)
- **`test_path.json`** - Test configuration with 12 steps
- **`html_report_generator.py`** - HTML report generator with Tailwind CSS
- **`deploy_reports.py`** - GitHub Pages deployment automation
- **`index.html`** - GitHub Pages landing page

### Report Directories
- **`pdf_reports/`** - Generated PDF reports
- **`html_reports/`** - Generated HTML reports
- **`.gitignore`** - Excludes report directories from git

### Assets
- **`BOSTONtec-Logo.png`** - Company logo for reports
- **`zoovu_logo.webp`** - Partner logo (currently not used)

## Test Configuration (test_path.json)
The test follows a 12-step path:
1. **Choose Product** - Selects "Steel Shelf (12"d x 30"w)"
2. **Add to Summary** - Adds product to configuration
3. **Next** - Proceeds to next step
4. **Choose Color** - Selects a color option
5. **Next** - Proceeds to final screen
6. **Final Next** - Completes configuration

## Current Workflow

### Running Tests
```bash
# Basic test (5 iterations, PDF report)
python bostontec_stress_test.py

# With HTML report and deployment
python bostontec_stress_test.py --html-report --deploy-reports --iterations 5

# Headless mode for faster execution
python bostontec_stress_test.py --headless --iterations 10
```

### Report Generation
- **PDF Reports:** Professional styling with BostonTec branding, comprehensive analysis
- **HTML Reports:** Modern Tailwind CSS design, accessible via GitHub Pages
- **GitHub Pages:** Live at https://jonnybenjamin.github.io/bostontec-stress-test/

## Technical Implementation

### Browser Automation
- **Playwright Python (sync API)**
- **Single browser window** for all iterations (not multiple Chromium instances)
- **Comprehensive element selection** using multiple selector types:
  - `text` - Text-based selection
  - `testid` - Data-testid attributes
  - `aria_labelledby` - Accessibility attributes
  - `composite` - CSS selectors
  - `section_product` - Custom product section selectors

### Performance Monitoring
- **Memory Usage Tracking:** JavaScript heap size monitoring
- **Performance Degradation Detection:** Trend analysis for memory pressure
- **Garbage Collection Attempts:** Browser-level memory management
- **Console Log Capture:** Smart filtering for relevant errors
- **Network Request Monitoring:** Zoovu-specific request tracking

### Smart Filtering
The system filters logs to focus on relevant issues:
- **Console Logs:** Zoovu errors, canvas/WebGL memory errors, image loading failures
- **Network Requests:** Zoovu-specific requests only
- **Excluded:** PDF generation logs (normal 3D rendering, not actual errors)

## Root Cause Analysis

### Identified Issue
**Memory pressure during JavaScript canvas-to-blob conversion** is the likely cause of intermittent PDF export failures.

### Evidence
- Canvas-to-blob conversion is memory-intensive
- Missing images in PDFs suggest memory allocation failures
- Customer environments cannot be controlled (device limitations, browser restrictions)

### Testing Strategy
Focus on measurable, controllable factors:
- Application performance optimization
- Memory usage pattern analysis
- Error handling improvements
- PDF generation process optimization

## GitHub Repository Structure

### Branches
- **`main`** - Production-ready code
- **`dev`** - Development branch for new features
- **`gh-pages`** - GitHub Pages deployment branch

### Repository
- **URL:** https://github.com/JonnyBenjamin/bostontec_testing
- **GitHub Pages:** https://jonnybenjamin.github.io/bostontec-stress-test/

## Recent Issues & Solutions

### Terminal Problems
- **Issue:** Cursor terminal becoming unresponsive
- **Workaround:** Using Hyper terminal for commands
- **Status:** Needs investigation for future sessions

### Logo Loading Issues
- **Issue:** BostonTec logo not loading in HTML reports
- **Solution:** Fixed path from `BOSTONtec-Logo.png` to `../BOSTONtec-Logo.png`
- **Status:** ✅ Resolved

### Deployment Workflow
- **Issue:** Manual branch switching required for GitHub Pages
- **Current:** Manual deployment working
- **Improvement Needed:** Automated deployment from dev branch

## Pending Tasks (Priority Order)

### 1. Canvas to Blob Log Creation ⏳
**Status:** Waiting for developer implementation
**Description:** Add logging for canvas-to-blob conversion actions and success/failure states
**Dependencies:** Requires changes to the configurator application
**Impact:** Critical for identifying PDF generation failures

### 2. Auto Fill Lead Generation Form ⏳
**Status:** Not started
**Description:** Automate filling out the lead generation form at the end of configuration
**Implementation:** Add form filling logic to test path
**Priority:** Medium

### 3. Submit Form Without Creating Lead ⏳
**Status:** Not started
**Description:** Submit the lead generation form without actually creating a lead for BostonTec
**Implementation:** Form submission with test data
**Priority:** Medium

## Command Reference

### Git Operations
```bash
# Switch branches
git checkout dev
git checkout gh-pages

# Deploy reports manually
git checkout gh-pages
cp html_reports/*.html .
git add .
git commit -m "Add new reports"
git push origin gh-pages
git checkout dev
```

### Testing Commands
```bash
# Activate virtual environment
source venv/bin/activate

# Run stress test
python bostontec_stress_test.py --html-report --deploy-reports --iterations 5

# Generate HTML report only
python html_report_generator.py

# Deploy to GitHub Pages
python deploy_reports.py
```

## Dependencies
- **playwright** - Browser automation
- **reportlab** - PDF generation
- **matplotlib** - Charts and graphs
- **pandas** - Data analysis
- **tailwindcss** - HTML styling (via CDN)

## Environment Setup
```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate

# Install dependencies
pip install playwright reportlab matplotlib pandas
playwright install chromium
```

## Known Limitations
1. **Customer Environment Control:** Cannot control customer devices, browsers, or network conditions
2. **Canvas Memory Monitoring:** Cannot directly monitor canvas/blob memory usage from Playwright
3. **PDF Generation Logs:** Currently no internal logs for JavaScript canvas-to-blob conversion
4. **Terminal Issues:** Cursor terminal occasionally becomes unresponsive

## Success Metrics
- **Test Success Rate:** 100% (all test runs complete successfully)
- **Performance:** ~26-27 seconds average runtime per cycle
- **Memory Usage:** Peak usage typically under 15% (low risk)
- **Report Generation:** Both PDF and HTML reports working
- **Deployment:** GitHub Pages live and accessible

## Next Session Priorities
1. **Fix Cursor terminal issues** for smoother development
2. **Improve deployment automation** to work seamlessly from dev branch
3. **Implement lead generation form automation** (pending tasks)
4. **Monitor for canvas-to-blob logging** when developer implements it

## Contact & Context
- **Project:** BostonTec 3D Workbench Builder stress testing
- **Goal:** Identify intermittent PDF export bug (missing images)
- **Approach:** Memory pressure monitoring and performance analysis
- **Status:** Core system complete, awaiting developer-side logging improvements

---
*Last Updated: September 9, 2025*
*Project Status: Fully Functional - Ready for Next Phase*
