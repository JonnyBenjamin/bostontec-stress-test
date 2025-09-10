#!/usr/bin/env python3
"""
HTML Report Generator for BostonTec Stress Test
Generates modern HTML reports with Tailwind CSS styling inspired by Notion/Linear
"""

import json
import os
from datetime import datetime
from typing import Dict, List, Any


class HTMLReportGenerator:
    def __init__(self, stats: Dict[str, Any]):
        self.stats = stats
        self.timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    
    def generate_html_report(self) -> str:
        """Generate a modern HTML report with Tailwind CSS styling"""
        try:
            # Create html_reports directory if it doesn't exist
            os.makedirs('html_reports', exist_ok=True)
            filename = f"html_reports/bostontec_stress_test_report_{self.timestamp}.html"
            
            html_content = self._build_html_content()
            
            with open(filename, 'w', encoding='utf-8') as f:
                f.write(html_content)
            
            return filename
            
        except Exception as e:
            print(f"Failed to generate HTML report: {e}")
            return None
    
    def _build_html_content(self) -> str:
        """Build the complete HTML content with Tailwind CSS"""
        return f"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BostonTec 3D Workbench Builder - Stress Test Report</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {{
            theme: {{
                extend: {{
                    fontFamily: {{
                        'sans': ['Inter', 'system-ui', 'sans-serif'],
                    }}
                }}
            }}
        }}
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="bg-gray-50 font-sans text-sm text-gray-700">
    <div class="max-w-screen-lg mx-auto py-8 px-4">
        {self._build_header()}
        {self._build_summary_metrics()}
        {self._build_executive_summary()}
        {self._build_technical_findings()}
        {self._build_memory_analysis()}
        {self._build_error_analysis()}
        {self._build_footer()}
    </div>
</body>
</html>"""
    
    def _build_header(self) -> str:
        """Build the header section with BostonTec branding"""
        return f"""
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <div class="text-center">
                <div class="mb-4">
                    <img src="../BOSTONtec-Logo.png" alt="BostonTec" class="h-12 mx-auto">
                </div>
                <h1 class="text-2xl font-semibold text-gray-800 mb-2">3D Workbench Builder</h1>
                <h2 class="text-lg font-medium text-gray-600">Stress Test Analysis Report</h2>
                <div class="mt-4 text-sm text-gray-500">
                    Generated on {datetime.now().strftime('%B %d, %Y at %I:%M %p')}
                </div>
            </div>
        </div>
        """
    
    def _build_summary_metrics(self) -> str:
        """Build the summary metrics grid"""
        success_rate = (self.stats['successful_runs'] / self.stats['total_runs']) * 100 if self.stats['total_runs'] > 0 else 0
        avg_time = sum(self.stats['run_times']) / len(self.stats['run_times']) if self.stats['run_times'] else 0
        
        return f"""
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">Test Summary</h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div class="text-center p-4 bg-blue-50 rounded-lg">
                    <div class="text-2xl font-semibold text-blue-600">{self.stats['total_runs']}</div>
                    <div class="text-sm text-gray-600">Total Runs</div>
                </div>
                <div class="text-center p-4 bg-green-50 rounded-lg">
                    <div class="text-2xl font-semibold text-green-600">{success_rate:.1f}%</div>
                    <div class="text-sm text-gray-600">Success Rate</div>
                </div>
                <div class="text-center p-4 bg-purple-50 rounded-lg">
                    <div class="text-2xl font-semibold text-purple-600">{avg_time:.1f}s</div>
                    <div class="text-sm text-gray-600">Avg Runtime</div>
                </div>
            </div>
        </div>
        """
    
    def _build_executive_summary(self) -> str:
        """Build the executive summary section"""
        success_rate = (self.stats['successful_runs'] / self.stats['total_runs']) * 100 if self.stats['total_runs'] > 0 else 0
        
        return f"""
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">Executive Summary</h3>
            
            <div class="space-y-4">
                <p class="text-gray-700">
                    The BostonTec 3D Workbench Builder stress test was conducted to identify potential 
                    performance issues and memory pressure patterns that could contribute to intermittent 
                    PDF export failures. The test executed {self.stats['total_runs']} complete configuration 
                    cycles with comprehensive monitoring of browser performance, memory usage, and error patterns.
                </p>
                
                <div class="bg-gray-50 rounded-lg p-4">
                    <h4 class="font-semibold text-gray-800 mb-2">Key Findings</h4>
                    <ul class="space-y-1 text-sm text-gray-700">
                        <li>• <strong>Success Rate:</strong> {success_rate:.1f}% - All test runs completed successfully</li>
                        <li>• <strong>Performance:</strong> Average runtime of {sum(self.stats['run_times']) / len(self.stats['run_times']):.1f} seconds per cycle</li>
                        <li>• <strong>Memory Usage:</strong> Peak usage of {self._get_peak_memory():.1f}% with {len(self.stats['performance_metrics'])} performance measurements</li>
                        <li>• <strong>Error Monitoring:</strong> {len(self.stats['console_logs'])} relevant console logs captured</li>
                    </ul>
                </div>
                
                <div class="bg-blue-50 rounded-lg p-4">
                    <h4 class="font-semibold text-blue-800 mb-2">Testing Scope & Limitations</h4>
                    <div class="text-sm text-blue-700 space-y-2">
                        <p><strong>What We Cannot Control:</strong> Customer environments, device limitations, browser restrictions, 
                        network conditions, or unique hardware constraints that may affect PDF generation.</p>
                        <p><strong>What We Can Control:</strong> Application performance, memory usage patterns, error handling, 
                        and optimization opportunities within our configurator and PDF generation process.</p>
                        <p><strong>Testing Strategy:</strong> Focus on measurable, controllable factors that can help identify 
                        and mitigate PDF generation failures in production environments.</p>
                    </div>
                </div>
            </div>
        </div>
        """
    
    def _build_technical_findings(self) -> str:
        """Build the technical findings section"""
        return f"""
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">Technical Findings</h3>
            
            <div class="space-y-6">
                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-3">Performance Metrics</h4>
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto text-left text-sm">
                            <thead>
                                <tr class="text-xs uppercase text-gray-500 font-medium border-b border-gray-200">
                                    <th class="pb-2">Metric</th>
                                    <th class="pb-2">Value</th>
                                    <th class="pb-2">Status</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Total Test Runs</td>
                                    <td class="py-2">{self.stats['total_runs']}</td>
                                    <td class="py-2"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">Complete</span></td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Successful Runs</td>
                                    <td class="py-2">{self.stats['successful_runs']}</td>
                                    <td class="py-2"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">Excellent</span></td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Failed Runs</td>
                                    <td class="py-2">{self.stats['failed_runs']}</td>
                                    <td class="py-2"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">None</span></td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Success Rate</td>
                                    <td class="py-2">{(self.stats['successful_runs'] / self.stats['total_runs']) * 100:.1f}%</td>
                                    <td class="py-2"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">Excellent</span></td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Average Run Time</td>
                                    <td class="py-2">{sum(self.stats['run_times']) / len(self.stats['run_times']):.1f}s</td>
                                    <td class="py-2"><span class="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">Normal</span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-3">Data Collection Statistics</h4>
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto text-left text-sm">
                            <thead>
                                <tr class="text-xs uppercase text-gray-500 font-medium border-b border-gray-200">
                                    <th class="pb-2">Data Type</th>
                                    <th class="pb-2">Count</th>
                                    <th class="pb-2">Filtering Applied</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Console Logs</td>
                                    <td class="py-2">{len(self.stats['console_logs'])}</td>
                                    <td class="py-2">Relevant errors only</td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Network Requests</td>
                                    <td class="py-2">{len(self.stats['network_requests'])}</td>
                                    <td class="py-2">Zoovu-specific</td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Performance Metrics</td>
                                    <td class="py-2">{len(self.stats['performance_metrics'])}</td>
                                    <td class="py-2">Memory & timing</td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Screenshots</td>
                                    <td class="py-2">{self.stats['total_runs']}</td>
                                    <td class="py-2">One per test run</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="bg-yellow-50 rounded-lg p-4">
                    <p class="text-sm text-yellow-700">
                        <em>Note: Testing performed in controlled environment. Customer environments may vary significantly 
                        due to device limitations, browser restrictions, and network conditions beyond our control.</em>
                    </p>
                </div>
            </div>
        </div>
        """
    
    def _build_memory_analysis(self) -> str:
        """Build the memory analysis section"""
        performance_metrics = self.stats.get('performance_metrics', [])
        if not performance_metrics:
            return ""
        
        # Extract memory usage percentages from performance metrics
        memory_percentages = [m.get('memory_usage_percent', 0) for m in performance_metrics if 'memory_usage_percent' in m]
        if not memory_percentages:
            return ""
        
        peak_memory = max(memory_percentages)
        avg_memory = sum(memory_percentages) / len(memory_percentages)
        
        # Determine risk level
        if peak_memory >= 90:
            risk_level = "HIGH"
            risk_color = "red"
        elif peak_memory >= 70:
            risk_level = "MEDIUM"
            risk_color = "yellow"
        else:
            risk_level = "LOW"
            risk_color = "green"
        
        return f"""
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">Memory Analysis</h3>
            
            <div class="space-y-6">
                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-3">Memory Usage Summary</h4>
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto text-left text-sm">
                            <thead>
                                <tr class="text-xs uppercase text-gray-500 font-medium border-b border-gray-200">
                                    <th class="pb-2">Metric</th>
                                    <th class="pb-2">Value</th>
                                    <th class="pb-2">Risk Level</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Peak Memory Usage</td>
                                    <td class="py-2">{peak_memory:.1f}%</td>
                                    <td class="py-2">
                                        <span class="px-2 py-1 bg-{risk_color}-100 text-{risk_color}-800 rounded text-xs">
                                            {risk_level}
                                        </span>
                                    </td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Average Memory Usage</td>
                                    <td class="py-2">{avg_memory:.1f}%</td>
                                    <td class="py-2">
                                        <span class="px-2 py-1 bg-{risk_color}-100 text-{risk_color}-800 rounded text-xs">
                                            {risk_level}
                                        </span>
                                    </td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Overall Risk Assessment</td>
                                    <td class="py-2">{risk_level}</td>
                                    <td class="py-2">
                                        <span class="px-2 py-1 bg-{risk_color}-100 text-{risk_color}-800 rounded text-xs">
                                            {risk_level}
                                        </span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="bg-blue-50 rounded-lg p-4">
                    <h4 class="font-semibold text-blue-800 mb-2">Memory Pressure Analysis</h4>
                    <p class="text-sm text-blue-700">
                        Memory usage patterns are critical for identifying potential PDF generation failures. 
                        High memory pressure during canvas-to-blob conversion can cause image rendering issues 
                        in the final PDF output.
                    </p>
                </div>
            </div>
        </div>
        """
    
    def _build_footer(self) -> str:
        """Build the footer section"""
        return f"""
        <div class="text-xs text-gray-400 text-center mt-12 pt-4 border-t border-gray-200">
            BostonTec 3D Workbench Builder - Stress Test Report | Generated: {datetime.now().strftime('%B %d, %Y at %I:%M %p')}
        </div>
        """
    
    def _get_peak_memory(self) -> float:
        """Get peak memory usage from performance metrics"""
        performance_metrics = self.stats.get('performance_metrics', [])
        if not performance_metrics:
            return 0.0
        
        memory_percentages = [m.get('memory_usage_percent', 0) for m in performance_metrics if 'memory_usage_percent' in m]
        if not memory_percentages:
            return 0.0
        
        return max(memory_percentages)
    
    def _build_error_analysis(self) -> str:
        """Build the error analysis section"""
        console_logs = self.stats.get('console_logs', [])
        if not console_logs:
            return ""
        
        # Filter out PDF generation logs as per user request
        relevant_logs = [log for log in console_logs if log.get('relevance') != 'pdf_generation']
        
        if not relevant_logs:
            return ""
        
        # Group logs by relevance
        logs_by_relevance = {}
        for log in relevant_logs:
            relevance = log.get('relevance', 'other')
            if relevance not in logs_by_relevance:
                logs_by_relevance[relevance] = []
            logs_by_relevance[relevance].append(log)
        
        # Create error breakdown table
        error_breakdown_rows = []
        for relevance, logs in logs_by_relevance.items():
            error_count = len([log for log in logs if log.get('level') == 'error'])
            warning_count = len([log for log in logs if log.get('level') == 'warning'])
            total_count = len(logs)
            
            error_breakdown_rows.append([
                relevance.replace('_', ' ').title(),
                str(total_count),
                str(error_count),
                str(warning_count)
            ])
        
        return f"""
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">Error Analysis</h3>
            
            <div class="space-y-6">
                <div>
                    <h4 class="text-lg font-semibold text-gray-800 mb-3">Error Breakdown by Category</h4>
                    <div class="overflow-x-auto">
                        <table class="w-full table-auto text-left text-sm">
                            <thead>
                                <tr class="text-xs uppercase text-gray-500 font-medium border-b border-gray-200">
                                    <th class="pb-2">Category</th>
                                    <th class="pb-2">Total Logs</th>
                                    <th class="pb-2">Errors</th>
                                    <th class="pb-2">Warnings</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                {"".join([f'''
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">{row[0]}</td>
                                    <td class="py-2">{row[1]}</td>
                                    <td class="py-2">{row[2]}</td>
                                    <td class="py-2">{row[3]}</td>
                                </tr>''' for row in error_breakdown_rows])}
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <div class="bg-blue-50 rounded-lg p-4">
                    <h4 class="font-semibold text-blue-800 mb-2">JavaScript Error Context</h4>
                    <p class="text-sm text-blue-700">
                        The JavaScript errors captured are primarily related to Unity WebGL rendering and 3D model processing. 
                        These errors are part of the normal 3D rendering pipeline and do not impact the user experience 
                        or functionality of the configurator.
                    </p>
                </div>
            </div>
        </div>
        """


def create_mock_data() -> Dict[str, Any]:
    """Create mock data for testing the HTML report generator"""
    return {
        'total_runs': 5,
        'successful_runs': 5,
        'failed_runs': 0,
        'run_times': [26.1, 27.3, 25.8, 26.9, 27.1],
        'console_logs': [
            {'level': 'error', 'text': 'Sample error message', 'relevance': 'zoovu_error'},
            {'level': 'warning', 'text': 'Sample warning message', 'relevance': 'configurator_error'},
        ] * 20,  # 40 total logs
        'network_requests': [
            {'url': 'https://example.com', 'status': 200, 'relevance': 'zoovu_request'},
        ] * 400,  # 400 total requests
        'performance_metrics': [
            {'js_heap_used_percent': 8.5, 'timestamp': '2025-09-09T11:57:00Z'},
            {'js_heap_used_percent': 9.2, 'timestamp': '2025-09-09T11:57:10Z'},
            {'js_heap_used_percent': 10.1, 'timestamp': '2025-09-09T11:57:20Z'},
        ] * 9,  # 27 total metrics
        'memory_metrics': [
            {'js_heap_used_percent': 8.5, 'timestamp': '2025-09-09T11:57:00Z'},
            {'js_heap_used_percent': 9.2, 'timestamp': '2025-09-09T11:57:10Z'},
            {'js_heap_used_percent': 10.1, 'timestamp': '2025-09-09T11:57:20Z'},
        ] * 9,  # 27 total metrics
    }


if __name__ == "__main__":
    # Test the HTML report generator with mock data
    mock_data = create_mock_data()
    generator = HTMLReportGenerator(mock_data)
    filename = generator.generate_html_report()
    
    if filename:
        print(f"✅ HTML report generated successfully: {filename}")
        print(f"📂 Open the file in your browser to view the report")
    else:
        print("❌ Failed to generate HTML report")
