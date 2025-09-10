
isue(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -t html_reports/*.html | head -1
html_reports/bostontec_stress_test_report_20250909_140850.html
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -lt html_reports/*.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140850.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140643.html
-rw-r--r--  1 jonnybenjamin  staff  13149 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140545.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_135515.html
-rw-r--r--  1 jonnybenjamin  staff  13149 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_135136.html
-rw-r--r--  1 jonnybenjamin  staff  16760 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_122536.html
-rw-r--r--  1 jonnybenjamin  staff  16760 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_122438.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_121905.html
-rw-r--r--  1 jonnybenjamin  staff  10640 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_121309.html
-rw-r--r--  1 jonnybenjamin  staff  10640 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_121148.html
-rw-r--r--  1 jonnybenjamin  staff  13907 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_120917.html
-rw-r--r--  1 jonnybenjamin  staff  16775 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_170512.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:37 html_reports/bostontec_stress_test_report_20250909_153718.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:25 html_reports/bostontec_stress_test_report_20250909_152558.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:22 html_reports/bostontec_stress_test_report_20250909_152217.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:10 html_reports/bostontec_stress_test_report_20250909_151002.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:05 html_reports/bostontec_stress_test_report_20250909_150520.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:52 html_reports/bostontec_stress_test_report_20250909_145211.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:43 html_reports/bostontec_stress_test_report_20250909_144304.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:39 html_reports/bostontec_stress_test_report_20250909_143941.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:35 html_reports/bostontec_stress_test_report_20250909_143516.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:29 html_reports/bostontec_stress_test_report_20250909_142941.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:23 html_reports/bostontec_stress_test_report_20250909_142358.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 14:21 html_reports/bostontec_stress_test_report_20250909_142111.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 14:18 html_reports/bostontec_stress_test_report_20250909_141841.html
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % tail -50 bostontec_stress_test.log
tail: bostontec_stress_test.log: No such file or directory
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -la *.log
-rw-r--r--  1 jonnybenjamin  staff  0 Sep  3 16:17 stress_test.log
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % grep -A 10 -B 10 "failed\|error\|exception" bostontec_stress_test_data_1757451912.json
grep: bostontec_stress_test_data_1757451912.json: No such file or directory
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -la
total 4320
drwxr-xr-x@ 41 jonnybenjamin  staff    1312 Sep  9 17:05 .
drwx------+ 53 jonnybenjamin  staff    1696 Sep  3 16:02 ..
-rw-r--r--   1 jonnybenjamin  staff   10244 Sep  9 15:33 .DS_Store
drwxr-xr-x  14 jonnybenjamin  staff     448 Sep  9 17:05 .git
-rw-r--r--   1 jonnybenjamin  staff     421 Sep  9 17:05 .gitignore
-rw-r--r--   1 jonnybenjamin  staff   13365 Sep  9 12:00 BOSTONtec-Logo.png
-rw-r--r--   1 jonnybenjamin  staff    8143 Sep  9 15:33 PROJECT_HANDOFF.md
-rw-r--r--   1 jonnybenjamin  staff    4990 Sep  3 16:43 README.md
drwxr-xr-x   5 jonnybenjamin  staff     160 Sep  9 15:37 __pycache__
-rw-r--r--   1 jonnybenjamin  staff   75103 Sep  9 15:33 bostontec_stress_test.py
-rw-r--r--   1 jonnybenjamin  staff  189755 Sep  9 15:33 bostontec_stress_test_data_1757433476.json
-rw-r--r--   1 jonnybenjamin  staff  190755 Sep  9 15:33 bostontec_stress_test_data_1757434308.json
-rw-r--r--   1 jonnybenjamin  staff  189278 Sep  9 15:33 bostontec_stress_test_data_1757434389.json
-rw-r--r--   1 jonnybenjamin  staff  189313 Sep  9 15:33 bostontec_stress_test_data_1757434745.json
-rw-r--r--   1 jonnybenjamin  staff  188708 Sep  9 15:33 bostontec_stress_test_data_1757435078.json
-rw-r--r--   1 jonnybenjamin  staff  188785 Sep  9 15:33 bostontec_stress_test_data_1757435136.json
-rw-r--r--   1 jonnybenjamin  staff  188589 Sep  9 15:33 bostontec_stress_test_data_1757440515.json
-rw-r--r--   1 jonnybenjamin  staff  188288 Sep  9 15:33 bostontec_stress_test_data_1757441203.json
-rw-r--r--   1 jonnybenjamin  staff  189165 Sep  9 15:33 bostontec_stress_test_data_1757441330.json
-rw-r--r--   1 jonnybenjamin  staff   13907 Sep  9 15:33 bostontec_stress_test_report_20250909_120917.html
-rw-r--r--   1 jonnybenjamin  staff   10640 Sep  9 15:33 bostontec_stress_test_report_20250909_121148.html
-rw-r--r--   1 jonnybenjamin  staff   10640 Sep  9 15:33 bostontec_stress_test_report_20250909_121309.html
-rw-r--r--   1 jonnybenjamin  staff   16763 Sep  9 15:33 bostontec_stress_test_report_20250909_121905.html
-rw-r--r--   1 jonnybenjamin  staff   16760 Sep  9 15:33 bostontec_stress_test_report_20250909_122438.html
-rw-r--r--   1 jonnybenjamin  staff   16760 Sep  9 15:33 bostontec_stress_test_report_20250909_122536.html
-rw-r--r--   1 jonnybenjamin  staff   13149 Sep  9 15:33 bostontec_stress_test_report_20250909_135136.html
-rw-r--r--   1 jonnybenjamin  staff   16761 Sep  9 15:33 bostontec_stress_test_report_20250909_135515.html
-rw-r--r--   1 jonnybenjamin  staff    9371 Sep  3 16:15 debug_page_structure.py
-rw-r--r--   1 jonnybenjamin  staff    7739 Sep  9 15:33 deploy_reports.py
-rw-r--r--   1 jonnybenjamin  staff   23791 Sep  9 15:33 html_report_generator.py
drwxr-xr-x  27 jonnybenjamin  staff     864 Sep  9 17:05 html_reports
-rw-r--r--   1 jonnybenjamin  staff    6857 Sep  9 17:05 index.html
drwxr-xr-x   5 jonnybenjamin  staff     160 Sep  9 12:13 pdf_reports
drwxr-xr-x  13 jonnybenjamin  staff     416 Sep  9 17:05 reports
-rw-r--r--   1 jonnybenjamin  staff     108 Sep  9 12:00 requirements.txt
-rw-r--r--   1 jonnybenjamin  staff   69929 Sep  9 17:05 run_2_final_state.png
-rw-r--r--   1 jonnybenjamin  staff   69941 Sep  9 17:05 run_3_final_state.png
-rw-r--r--   1 jonnybenjamin  staff       0 Sep  3 16:17 stress_test.log
-rw-r--r--   1 jonnybenjamin  staff    2029 Sep  3 16:30 test_path.json
drwxr-xr-x   8 jonnybenjamin  staff     256 Sep  9 10:41 venv
-rw-r--r--   1 jonnybenjamin  staff    6204 Sep  9 15:33 zoovu_logo.webp
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -lt html_reports/*.html | head -1
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140850.html
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -lt html_reports/*.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140850.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140643.html
-rw-r--r--  1 jonnybenjamin  staff  13149 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140545.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_135515.html
-rw-r--r--  1 jonnybenjamin  staff  13149 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_135136.html
-rw-r--r--  1 jonnybenjamin  staff  16760 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_122536.html
-rw-r--r--  1 jonnybenjamin  staff  16760 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_122438.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_121905.html
-rw-r--r--  1 jonnybenjamin  staff  10640 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_121309.html
-rw-r--r--  1 jonnybenjamin  staff  10640 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_121148.html
-rw-r--r--  1 jonnybenjamin  staff  13907 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_120917.html
-rw-r--r--  1 jonnybenjamin  staff  16775 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_170512.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:37 html_reports/bostontec_stress_test_report_20250909_153718.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:25 html_reports/bostontec_stress_test_report_20250909_152558.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:22 html_reports/bostontec_stress_test_report_20250909_152217.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:10 html_reports/bostontec_stress_test_report_20250909_151002.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 15:05 html_reports/bostontec_stress_test_report_20250909_150520.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:52 html_reports/bostontec_stress_test_report_20250909_145211.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:43 html_reports/bostontec_stress_test_report_20250909_144304.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:39 html_reports/bostontec_stress_test_report_20250909_143941.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:35 html_reports/bostontec_stress_test_report_20250909_143516.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:29 html_reports/bostontec_stress_test_report_20250909_142941.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 14:23 html_reports/bostontec_stress_test_report_20250909_142358.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 14:21 html_reports/bostontec_stress_test_report_20250909_142111.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 14:18 html_reports/bostontec_stress_test_report_20250909_141841.html
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -lt html_reports/ | grep "17:05"
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 bostontec_stress_test_report_20250909_140850.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 17:05 bostontec_stress_test_report_20250909_140643.html
-rw-r--r--  1 jonnybenjamin  staff  13149 Sep  9 17:05 bostontec_stress_test_report_20250909_140545.html
-rw-r--r--  1 jonnybenjamin  staff  16761 Sep  9 17:05 bostontec_stress_test_report_20250909_135515.html
-rw-r--r--  1 jonnybenjamin  staff  13149 Sep  9 17:05 bostontec_stress_test_report_20250909_135136.html
-rw-r--r--  1 jonnybenjamin  staff  16760 Sep  9 17:05 bostontec_stress_test_report_20250909_122536.html
-rw-r--r--  1 jonnybenjamin  staff  16760 Sep  9 17:05 bostontec_stress_test_report_20250909_122438.html
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 bostontec_stress_test_report_20250909_121905.html
-rw-r--r--  1 jonnybenjamin  staff  10640 Sep  9 17:05 bostontec_stress_test_report_20250909_121309.html
-rw-r--r--  1 jonnybenjamin  staff  10640 Sep  9 17:05 bostontec_stress_test_report_20250909_121148.html
-rw-r--r--  1 jonnybenjamin  staff  13907 Sep  9 17:05 bostontec_stress_test_report_20250909_120917.html
-rw-r--r--  1 jonnybenjamin  staff  16775 Sep  9 17:05 bostontec_stress_test_report_20250909_170512.html
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % grep -A 10 -B 10 "failed\|error\|exception" html_reports/bostontec_stress_test_report_20250909_170512.html
        
        
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">Executive Summary</h3>
            
            <div class="space-y-4">
                <p class="text-gray-700">
                    The BostonTec 3D Workbench Builder stress test was conducted to identify potential 
                    performance issues and memory pressure patterns that could contribute to intermittent 
                    PDF export failures. The test executed 10 complete configuration 
                    cycles with comprehensive monitoring of browser performance, memory usage, and error patterns.
                </p>
                
                <div class="bg-gray-50 rounded-lg p-4">
                    <h4 class="font-semibold text-gray-800 mb-2">Key Findings</h4>
                    <ul class="space-y-1 text-sm text-gray-700">
                        <li>• <strong>Success Rate:</strong> 90.0% - All test runs completed successfully</li>
                        <li>• <strong>Performance:</strong> Average runtime of 26.5 seconds per cycle</li>
                        <li>• <strong>Memory Usage:</strong> Peak usage of 24.4% with 260 performance measurements</li>
                        <li>• <strong>Error Monitoring:</strong> 440 relevant console logs captured</li>
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
        
        
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
--
                                <tr class="text-xs uppercase text-gray-500 font-medium border-b border-gray-200">
                                    <th class="pb-2">Data Type</th>
                                    <th class="pb-2">Count</th>
                                    <th class="pb-2">Filtering Applied</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Console Logs</td>
                                    <td class="py-2">440</td>
                                    <td class="py-2">Relevant errors only</td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Network Requests</td>
                                    <td class="py-2">3945</td>
                                    <td class="py-2">Zoovu-specific</td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Performance Metrics</td>
                                    <td class="py-2">260</td>
                                    <td class="py-2">Memory & timing</td>
--
                                    <td class="py-2">0</td>
                                </tr>
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
        
        
        <div class="text-xs text-gray-400 text-center mt-12 pt-4 border-t border-gray-200">
            BostonTec 3D Workbench Builder - Stress Test Report | Generated: September 09, 2025 at 05:05 PM
        </div>
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % grep -A 5 -B 5 "Failed Runs" html_reports/bostontec_stress_test_report_20250909_170512.html
                                    <td class="py-2">Successful Runs</td>
                                    <td class="py-2">9</td>
                                    <td class="py-2"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">Excellent</span></td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Failed Runs</td>
                                    <td class="py-2">1</td>
                                    <td class="py-2"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">None</span></td>
                                </tr>
                                <tr class="even:bg-gray-50">
                                    <td class="py-2">Success Rate</td>
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % grep -A 20 "run.*failed" bostontec_stress_test_data_1757441330.json
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % grep -A 10 -B 10 "failed\|error\|exception" bostontec_stress_test_data_1757441330.json
{
  "test_summary": {
    "total_runs": 1,
    "successful_runs": 1,
    "failed_runs": 0,
    "success_rate": 100.0,
    "run_times": [
      28.5051748752594
    ],
    "average_run_time": 28.5051748752594
  },
  "console_logs": [
    {
      "timestamp": 1757441287.021312,
      "type": "error",
      "text": "Failed to load resource: the server responded with a status of 404 ()",
      "level": "error",
      "relevance": "image_loading"
    },
    {
      "timestamp": 1757441287.1289768,
      "type": "error",
      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
      "level": "error",
      "relevance": "zoovu_error"
    },
    {
      "timestamp": 1757441287.130443,
      "type": "error",
      "text": "Failed to load resource: net::ERR_FAILED",
      "level": "error",
      "relevance": "image_loading"
    },
    {
      "timestamp": 1757441288.5085921,
      "type": "log",
      "text": "## content on default summary update ActionEvent",
      "level": "info",
      "relevance": "configurator_error"
    },
    {
      "timestamp": 1757441293.807081,
      "type": "log",
      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
      "level": "info",
      "relevance": "pdf_generation"
    },
    {
      "timestamp": 1757441293.8076632,
--
    },
    {
      "timestamp": 1757441293.812617,
      "type": "warning",
      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
      "level": "warning",
      "relevance": "pdf_generation"
    },
    {
      "timestamp": 1757441302.6989381,
      "type": "error",
      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
      "level": "error",
      "relevance": "zoovu_error"
    },
    {
      "timestamp": 1757441315.4497721,
      "type": "error",
      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
      "level": "error",
      "relevance": "zoovu_error"
    }
  ],
  "network_requests": [
    {
      "timestamp": 1757441285.621161,
      "event": "request",
      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
      "method": "GET",
      "resource_type": "script",
      "relevance": "zoovu_request"
--
      "timestamp": 1757441285.983268,
      "event": "response",
      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.css",
      "status": 200,
      "status_text": "",
      "response_time": 1757441285.983271,
      "relevance": "zoovu_request"
    },
    {
      "timestamp": 1757441286.0322502,
      "event": "failed",
      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=823443501.1757441286&auid=1492179438.1757441286&navt=n&npa=0&gtm=45He5980v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527907~104528501~104684208~104684211~104948813~105426769~105426771~115480709~115596673&tft=1757441285836&tfd=559&apve=1&apvf=f",
      "failure_text": "net::ERR_ABORTED",
      "relevance": "other"
    },
    {
      "timestamp": 1757441286.032853,
      "event": "response",
      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-manifest.json",
      "status": 200,
      "status_text": "",
--
      "timestamp": 1757441286.10858,
      "event": "response",
      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/mm9Q7f9M/load-advisor?locale=en-US&refererAdvisorCode=H9Fn48Zn&launcherId=137",
      "status": 200,
      "status_text": "",
      "response_time": 1757441286.108584,
      "relevance": "zoovu_request"
    },
    {
      "timestamp": 1757441286.109091,
      "event": "failed",
      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757441285645&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=434861100.1757441286&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527907~104528500~104684208~104684211~104948813~105330666~105426769~105426771~115596674&sid=1757441285&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=3&tfd=732",
      "failure_text": "net::ERR_ABORTED",
      "relevance": "other"
    },
    {
      "timestamp": 1757441286.109316,
      "event": "failed",
      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757441285645&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=434861100.1757441286&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527907~104528500~104684208~104684211~104948813~105330666~105426769~105426771~115596674&sid=1757441285&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=709",
      "failure_text": "net::ERR_ABORTED",
      "relevance": "other"
    },
    {
      "timestamp": 1757441286.144269,
      "event": "response",
      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js",
      "status": 200,
      "status_text": "",
--
    {
      "timestamp": 1757441287.129919,
      "event": "request",
      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
      "method": "GET",
      "resource_type": "font",
      "relevance": "zoovu_request"
    },
    {
      "timestamp": 1757441287.130197,
      "event": "failed",
      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
      "failure_text": "net::ERR_FAILED",
      "relevance": "zoovu_request"
    },
    {
      "timestamp": 1757441287.130841,
      "event": "response",
      "url": "https://ev-co.zoovu.com/v1/CollectAdvisorEvent",
      "status": 200,
      "status_text": "",
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % 
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % git add PROJECT_HANDOFF.md NEXT_STEPS.md
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -lt *data*.json | head -1 
-rw-r--r--  1 jonnybenjamin  staff  189165 Sep  9 15:33 bostontec_stress_test_data_1757441330.json
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % grep "total_runs.*10" *data*.json
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % ls -lt html_reports/*.html | head -1
-rw-r--r--  1 jonnybenjamin  staff  16763 Sep  9 17:05 html_reports/bostontec_stress_test_report_20250909_140850.html
(venv) jonnybenjamin@Jonnys-MBP bostontec_testing % grep -A 10 -B 10 "failed\|error\|exception" *data*.json
bostontec_stress_test_data_1757433476.json-{
bostontec_stress_test_data_1757433476.json-  "test_summary": {
bostontec_stress_test_data_1757433476.json-    "total_runs": 1,
bostontec_stress_test_data_1757433476.json-    "successful_runs": 1,
bostontec_stress_test_data_1757433476.json:    "failed_runs": 0,
bostontec_stress_test_data_1757433476.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757433476.json-    "run_times": [
bostontec_stress_test_data_1757433476.json-      26.103577136993408
bostontec_stress_test_data_1757433476.json-    ],
bostontec_stress_test_data_1757433476.json-    "average_run_time": 26.103577136993408
bostontec_stress_test_data_1757433476.json-  },
bostontec_stress_test_data_1757433476.json-  "console_logs": [
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433441.5585039,
bostontec_stress_test_data_1757433476.json:      "type": "error",
bostontec_stress_test_data_1757433476.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757433476.json:      "level": "error",
bostontec_stress_test_data_1757433476.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433441.559284,
bostontec_stress_test_data_1757433476.json:      "type": "error",
bostontec_stress_test_data_1757433476.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757433476.json:      "level": "error",
bostontec_stress_test_data_1757433476.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433441.560459,
bostontec_stress_test_data_1757433476.json:      "type": "error",
bostontec_stress_test_data_1757433476.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757433476.json:      "level": "error",
bostontec_stress_test_data_1757433476.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433441.921935,
bostontec_stress_test_data_1757433476.json-      "type": "log",
bostontec_stress_test_data_1757433476.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757433476.json-      "level": "info",
bostontec_stress_test_data_1757433476.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433447.815295,
bostontec_stress_test_data_1757433476.json-      "type": "log",
bostontec_stress_test_data_1757433476.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757433476.json-      "level": "info",
bostontec_stress_test_data_1757433476.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433447.816042,
--
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433447.825227,
bostontec_stress_test_data_1757433476.json-      "type": "warning",
bostontec_stress_test_data_1757433476.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757433476.json-      "level": "warning",
bostontec_stress_test_data_1757433476.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433455.60344,
bostontec_stress_test_data_1757433476.json:      "type": "error",
bostontec_stress_test_data_1757433476.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757433476.json:      "level": "error",
bostontec_stress_test_data_1757433476.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433467.180249,
bostontec_stress_test_data_1757433476.json:      "type": "error",
bostontec_stress_test_data_1757433476.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757433476.json:      "level": "error",
bostontec_stress_test_data_1757433476.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757433476.json-    }
bostontec_stress_test_data_1757433476.json-  ],
bostontec_stress_test_data_1757433476.json-  "network_requests": [
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433439.3545759,
bostontec_stress_test_data_1757433476.json-      "event": "request",
bostontec_stress_test_data_1757433476.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757433476.json-      "method": "GET",
bostontec_stress_test_data_1757433476.json-      "resource_type": "script",
bostontec_stress_test_data_1757433476.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433440.5198169,
bostontec_stress_test_data_1757433476.json-      "event": "request",
bostontec_stress_test_data_1757433476.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/mm9Q7f9M/load-advisor?locale=en-US&refererAdvisorCode=H9Fn48Zn&launcherId=137",
bostontec_stress_test_data_1757433476.json-      "method": "GET",
bostontec_stress_test_data_1757433476.json-      "resource_type": "script",
bostontec_stress_test_data_1757433476.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433440.530533,
bostontec_stress_test_data_1757433476.json:      "event": "failed",
bostontec_stress_test_data_1757433476.json-      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=1897044706.1757433440&auid=1351243812.1757433440&navt=n&npa=0&gtm=45He5951v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527907~104528501~104684208~104684211~104948813~105426769~105426771&tft=1757433439597&tfd=985&apve=1&apvf=f",
bostontec_stress_test_data_1757433476.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757433476.json-      "relevance": "other"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433440.561537,
bostontec_stress_test_data_1757433476.json-      "event": "response",
bostontec_stress_test_data_1757433476.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/mm9Q7f9M/load-advisor?locale=en-US&refererAdvisorCode=H9Fn48Zn&launcherId=137",
bostontec_stress_test_data_1757433476.json-      "status": 200,
bostontec_stress_test_data_1757433476.json-      "status_text": "",
bostontec_stress_test_data_1757433476.json-      "response_time": 1757433440.5615392,
bostontec_stress_test_data_1757433476.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433440.593021,
bostontec_stress_test_data_1757433476.json:      "event": "failed",
bostontec_stress_test_data_1757433476.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5951v874323709z8812273033za200zb812273033zd812273033&_p=1757433439357&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1071764944.1757433440&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527907~104528501~104684208~104684211~104948813~105426769~105426771&sid=1757433440&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=2&tfd=1906",
bostontec_stress_test_data_1757433476.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757433476.json-      "relevance": "other"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433440.593451,
bostontec_stress_test_data_1757433476.json:      "event": "failed",
bostontec_stress_test_data_1757433476.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5951v874323709z8812273033za200zb812273033zd812273033&_p=1757433439357&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1071764944.1757433440&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527907~104528501~104684208~104684211~104948813~105426769~105426771&sid=1757433440&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=1889",
bostontec_stress_test_data_1757433476.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757433476.json-      "relevance": "other"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433440.634331,
bostontec_stress_test_data_1757433476.json-      "event": "response",
bostontec_stress_test_data_1757433476.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js",
bostontec_stress_test_data_1757433476.json-      "status": 200,
bostontec_stress_test_data_1757433476.json-      "status_text": "",
--
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433441.559956,
bostontec_stress_test_data_1757433476.json-      "event": "request",
bostontec_stress_test_data_1757433476.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757433476.json-      "method": "GET",
bostontec_stress_test_data_1757433476.json-      "resource_type": "font",
bostontec_stress_test_data_1757433476.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433441.5601358,
bostontec_stress_test_data_1757433476.json:      "event": "failed",
bostontec_stress_test_data_1757433476.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757433476.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757433476.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757433476.json-    },
bostontec_stress_test_data_1757433476.json-    {
bostontec_stress_test_data_1757433476.json-      "timestamp": 1757433441.5606642,
bostontec_stress_test_data_1757433476.json-      "event": "response",
bostontec_stress_test_data_1757433476.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757433476.json-      "status": 200,
bostontec_stress_test_data_1757433476.json-      "status_text": "",
--
bostontec_stress_test_data_1757434308.json-{
bostontec_stress_test_data_1757434308.json-  "test_summary": {
bostontec_stress_test_data_1757434308.json-    "total_runs": 1,
bostontec_stress_test_data_1757434308.json-    "successful_runs": 1,
bostontec_stress_test_data_1757434308.json:    "failed_runs": 0,
bostontec_stress_test_data_1757434308.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757434308.json-    "run_times": [
bostontec_stress_test_data_1757434308.json-      30.30963683128357
bostontec_stress_test_data_1757434308.json-    ],
bostontec_stress_test_data_1757434308.json-    "average_run_time": 30.30963683128357
bostontec_stress_test_data_1757434308.json-  },
bostontec_stress_test_data_1757434308.json-  "console_logs": [
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434246.803433,
bostontec_stress_test_data_1757434308.json:      "type": "error",
bostontec_stress_test_data_1757434308.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757434308.json:      "level": "error",
bostontec_stress_test_data_1757434308.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434247.039026,
bostontec_stress_test_data_1757434308.json:      "type": "error",
bostontec_stress_test_data_1757434308.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757434308.json:      "level": "error",
bostontec_stress_test_data_1757434308.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434247.0433002,
bostontec_stress_test_data_1757434308.json:      "type": "error",
bostontec_stress_test_data_1757434308.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757434308.json:      "level": "error",
bostontec_stress_test_data_1757434308.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434252.215851,
bostontec_stress_test_data_1757434308.json-      "type": "log",
bostontec_stress_test_data_1757434308.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757434308.json-      "level": "info",
bostontec_stress_test_data_1757434308.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434252.269438,
bostontec_stress_test_data_1757434308.json-      "type": "log",
bostontec_stress_test_data_1757434308.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757434308.json-      "level": "info",
bostontec_stress_test_data_1757434308.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434252.2704709,
--
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434252.3481631,
bostontec_stress_test_data_1757434308.json-      "type": "warning",
bostontec_stress_test_data_1757434308.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757434308.json-      "level": "warning",
bostontec_stress_test_data_1757434308.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434262.464727,
bostontec_stress_test_data_1757434308.json:      "type": "error",
bostontec_stress_test_data_1757434308.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757434308.json:      "level": "error",
bostontec_stress_test_data_1757434308.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434274.5602481,
bostontec_stress_test_data_1757434308.json:      "type": "error",
bostontec_stress_test_data_1757434308.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757434308.json:      "level": "error",
bostontec_stress_test_data_1757434308.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434308.json-    }
bostontec_stress_test_data_1757434308.json-  ],
bostontec_stress_test_data_1757434308.json-  "network_requests": [
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434243.942969,
bostontec_stress_test_data_1757434308.json-      "event": "request",
bostontec_stress_test_data_1757434308.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757434308.json-      "method": "GET",
bostontec_stress_test_data_1757434308.json-      "resource_type": "script",
bostontec_stress_test_data_1757434308.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434245.7102258,
bostontec_stress_test_data_1757434308.json-      "event": "request",
bostontec_stress_test_data_1757434308.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/mm9Q7f9M/load-advisor?locale=en-US&refererAdvisorCode=H9Fn48Zn&launcherId=137",
bostontec_stress_test_data_1757434308.json-      "method": "GET",
bostontec_stress_test_data_1757434308.json-      "resource_type": "script",
bostontec_stress_test_data_1757434308.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434245.720445,
bostontec_stress_test_data_1757434308.json:      "event": "failed",
bostontec_stress_test_data_1757434308.json-      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=1863772428.1757434244&auid=2030614144.1757434244&navt=n&npa=0&gtm=45He5980v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771&tft=1757434244263&tfd=848&apve=1&apvf=f",
bostontec_stress_test_data_1757434308.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434308.json-      "relevance": "other"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434245.7266948,
bostontec_stress_test_data_1757434308.json:      "event": "failed",
bostontec_stress_test_data_1757434308.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757434243939&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1289178132.1757434244&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527906~104528500~104684208~104684211~104948813~105426769~105426771&sid=1757434244&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=6&tfd=1081",
bostontec_stress_test_data_1757434308.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434308.json-      "relevance": "other"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434245.727235,
bostontec_stress_test_data_1757434308.json:      "event": "failed",
bostontec_stress_test_data_1757434308.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757434243939&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1289178132.1757434244&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527906~104528500~104684208~104684211~104948813~105426769~105426771&sid=1757434244&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=1053",
bostontec_stress_test_data_1757434308.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434308.json-      "relevance": "other"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434245.7789109,
bostontec_stress_test_data_1757434308.json-      "event": "response",
bostontec_stress_test_data_1757434308.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/mm9Q7f9M/load-advisor?locale=en-US&refererAdvisorCode=H9Fn48Zn&launcherId=137",
bostontec_stress_test_data_1757434308.json-      "status": 200,
bostontec_stress_test_data_1757434308.json-      "status_text": "",
--
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434247.0410419,
bostontec_stress_test_data_1757434308.json-      "event": "request",
bostontec_stress_test_data_1757434308.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757434308.json-      "method": "GET",
bostontec_stress_test_data_1757434308.json-      "resource_type": "font",
bostontec_stress_test_data_1757434308.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434247.0418172,
bostontec_stress_test_data_1757434308.json:      "event": "failed",
bostontec_stress_test_data_1757434308.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757434308.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757434308.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434308.json-    },
bostontec_stress_test_data_1757434308.json-    {
bostontec_stress_test_data_1757434308.json-      "timestamp": 1757434247.044138,
bostontec_stress_test_data_1757434308.json-      "event": "response",
bostontec_stress_test_data_1757434308.json-      "url": "https://orca-experience.zoovu.com/public-assets/icons/refresh.svg",
bostontec_stress_test_data_1757434308.json-      "status": 200,
bostontec_stress_test_data_1757434308.json-      "status_text": "",
--
bostontec_stress_test_data_1757434389.json-{
bostontec_stress_test_data_1757434389.json-  "test_summary": {
bostontec_stress_test_data_1757434389.json-    "total_runs": 1,
bostontec_stress_test_data_1757434389.json-    "successful_runs": 1,
bostontec_stress_test_data_1757434389.json:    "failed_runs": 0,
bostontec_stress_test_data_1757434389.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757434389.json-    "run_times": [
bostontec_stress_test_data_1757434389.json-      31.446430921554565
bostontec_stress_test_data_1757434389.json-    ],
bostontec_stress_test_data_1757434389.json-    "average_run_time": 31.446430921554565
bostontec_stress_test_data_1757434389.json-  },
bostontec_stress_test_data_1757434389.json-  "console_logs": [
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.9324439,
bostontec_stress_test_data_1757434389.json:      "type": "error",
bostontec_stress_test_data_1757434389.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757434389.json:      "level": "error",
bostontec_stress_test_data_1757434389.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.933564,
bostontec_stress_test_data_1757434389.json:      "type": "error",
bostontec_stress_test_data_1757434389.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757434389.json:      "level": "error",
bostontec_stress_test_data_1757434389.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.9385128,
bostontec_stress_test_data_1757434389.json-      "type": "log",
bostontec_stress_test_data_1757434389.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757434389.json-      "level": "info",
bostontec_stress_test_data_1757434389.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.940256,
bostontec_stress_test_data_1757434389.json:      "type": "error",
bostontec_stress_test_data_1757434389.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757434389.json:      "level": "error",
bostontec_stress_test_data_1757434389.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.9427059,
bostontec_stress_test_data_1757434389.json-      "type": "log",
bostontec_stress_test_data_1757434389.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757434389.json-      "level": "info",
bostontec_stress_test_data_1757434389.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
--
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.951308,
bostontec_stress_test_data_1757434389.json-      "type": "warning",
bostontec_stress_test_data_1757434389.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757434389.json-      "level": "warning",
bostontec_stress_test_data_1757434389.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434361.6174731,
bostontec_stress_test_data_1757434389.json:      "type": "error",
bostontec_stress_test_data_1757434389.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757434389.json:      "level": "error",
bostontec_stress_test_data_1757434389.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434374.2530959,
bostontec_stress_test_data_1757434389.json:      "type": "error",
bostontec_stress_test_data_1757434389.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757434389.json:      "level": "error",
bostontec_stress_test_data_1757434389.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434389.json-    }
bostontec_stress_test_data_1757434389.json-  ],
bostontec_stress_test_data_1757434389.json-  "network_requests": [
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434343.3838878,
bostontec_stress_test_data_1757434389.json-      "event": "request",
bostontec_stress_test_data_1757434389.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757434389.json-      "method": "GET",
bostontec_stress_test_data_1757434389.json-      "resource_type": "script",
bostontec_stress_test_data_1757434389.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434343.712697,
bostontec_stress_test_data_1757434389.json-      "event": "response",
bostontec_stress_test_data_1757434389.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.css",
bostontec_stress_test_data_1757434389.json-      "status": 200,
bostontec_stress_test_data_1757434389.json-      "status_text": "",
bostontec_stress_test_data_1757434389.json-      "response_time": 1757434343.7127008,
bostontec_stress_test_data_1757434389.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434343.71421,
bostontec_stress_test_data_1757434389.json:      "event": "failed",
bostontec_stress_test_data_1757434389.json-      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=107549797.1757434344&auid=991166693.1757434344&navt=n&npa=0&gtm=45He5980v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527907~104528500~104684208~104684211~104948813~105426769~105426771~115489982&tft=1757434343514&tfd=933&apve=1&apvf=f",
bostontec_stress_test_data_1757434389.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434389.json-      "relevance": "other"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434343.725673,
bostontec_stress_test_data_1757434389.json:      "event": "failed",
bostontec_stress_test_data_1757434389.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757434343387&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=708077404.1757434344&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527907~104528500~104684208~104684211~104948813~105426769~105426771&sid=1757434343&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=1053",
bostontec_stress_test_data_1757434389.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434389.json-      "relevance": "other"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434343.7259688,
bostontec_stress_test_data_1757434389.json:      "event": "failed",
bostontec_stress_test_data_1757434389.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757434343387&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=708077404.1757434344&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527907~104528500~104684208~104684211~104948813~105426769~105426771&sid=1757434343&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=3&tfd=1070",
bostontec_stress_test_data_1757434389.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434389.json-      "relevance": "other"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434343.781402,
bostontec_stress_test_data_1757434389.json-      "event": "response",
bostontec_stress_test_data_1757434389.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-manifest.json",
bostontec_stress_test_data_1757434389.json-      "status": 200,
bostontec_stress_test_data_1757434389.json-      "status_text": "",
--
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.933171,
bostontec_stress_test_data_1757434389.json-      "event": "request",
bostontec_stress_test_data_1757434389.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757434389.json-      "method": "GET",
bostontec_stress_test_data_1757434389.json-      "resource_type": "font",
bostontec_stress_test_data_1757434389.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.9333172,
bostontec_stress_test_data_1757434389.json:      "event": "failed",
bostontec_stress_test_data_1757434389.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757434389.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757434389.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434389.json-    },
bostontec_stress_test_data_1757434389.json-    {
bostontec_stress_test_data_1757434389.json-      "timestamp": 1757434349.933888,
bostontec_stress_test_data_1757434389.json-      "event": "response",
bostontec_stress_test_data_1757434389.json-      "url": "https://orca-experience.zoovu.com/public-assets/icons/arrow-left-1b.svg",
bostontec_stress_test_data_1757434389.json-      "status": 200,
bostontec_stress_test_data_1757434389.json-      "status_text": "",
--
bostontec_stress_test_data_1757434745.json-{
bostontec_stress_test_data_1757434745.json-  "test_summary": {
bostontec_stress_test_data_1757434745.json-    "total_runs": 1,
bostontec_stress_test_data_1757434745.json-    "successful_runs": 1,
bostontec_stress_test_data_1757434745.json:    "failed_runs": 0,
bostontec_stress_test_data_1757434745.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757434745.json-    "run_times": [
bostontec_stress_test_data_1757434745.json-      28.707292079925537
bostontec_stress_test_data_1757434745.json-    ],
bostontec_stress_test_data_1757434745.json-    "average_run_time": 28.707292079925537
bostontec_stress_test_data_1757434745.json-  },
bostontec_stress_test_data_1757434745.json-  "console_logs": [
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.078346,
bostontec_stress_test_data_1757434745.json:      "type": "error",
bostontec_stress_test_data_1757434745.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757434745.json:      "level": "error",
bostontec_stress_test_data_1757434745.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.079417,
bostontec_stress_test_data_1757434745.json:      "type": "error",
bostontec_stress_test_data_1757434745.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757434745.json:      "level": "error",
bostontec_stress_test_data_1757434745.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.0841851,
bostontec_stress_test_data_1757434745.json:      "type": "error",
bostontec_stress_test_data_1757434745.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757434745.json:      "level": "error",
bostontec_stress_test_data_1757434745.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.10345,
bostontec_stress_test_data_1757434745.json-      "type": "log",
bostontec_stress_test_data_1757434745.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757434745.json-      "level": "info",
bostontec_stress_test_data_1757434745.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.105546,
bostontec_stress_test_data_1757434745.json-      "type": "log",
bostontec_stress_test_data_1757434745.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757434745.json-      "level": "info",
bostontec_stress_test_data_1757434745.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.105767,
--
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.1179352,
bostontec_stress_test_data_1757434745.json-      "type": "warning",
bostontec_stress_test_data_1757434745.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757434745.json-      "level": "warning",
bostontec_stress_test_data_1757434745.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434723.720311,
bostontec_stress_test_data_1757434745.json:      "type": "error",
bostontec_stress_test_data_1757434745.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757434745.json:      "level": "error",
bostontec_stress_test_data_1757434745.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434735.627807,
bostontec_stress_test_data_1757434745.json:      "type": "error",
bostontec_stress_test_data_1757434745.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757434745.json:      "level": "error",
bostontec_stress_test_data_1757434745.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757434745.json-    }
bostontec_stress_test_data_1757434745.json-  ],
bostontec_stress_test_data_1757434745.json-  "network_requests": [
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434707.067957,
bostontec_stress_test_data_1757434745.json-      "event": "request",
bostontec_stress_test_data_1757434745.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757434745.json-      "method": "GET",
bostontec_stress_test_data_1757434745.json-      "resource_type": "script",
bostontec_stress_test_data_1757434745.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434707.4350789,
bostontec_stress_test_data_1757434745.json-      "event": "request",
bostontec_stress_test_data_1757434745.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/H9Fn48Zn/js-loader?locale=en-US&launcherId=137",
bostontec_stress_test_data_1757434745.json-      "method": "GET",
bostontec_stress_test_data_1757434745.json-      "resource_type": "script",
bostontec_stress_test_data_1757434745.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434707.474018,
bostontec_stress_test_data_1757434745.json:      "event": "failed",
bostontec_stress_test_data_1757434745.json-      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=55079672.1757434707&auid=1799518656.1757434707&navt=n&npa=0&gtm=45He5951v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527906~104528500~104684208~104684211~104948813~105426769~105426771&tft=1757434707273&tfd=538&apve=1&apvf=f",
bostontec_stress_test_data_1757434745.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434745.json-      "relevance": "other"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434707.521248,
bostontec_stress_test_data_1757434745.json-      "event": "response",
bostontec_stress_test_data_1757434745.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/H9Fn48Zn/js-loader?locale=en-US&launcherId=137",
bostontec_stress_test_data_1757434745.json-      "status": 200,
bostontec_stress_test_data_1757434745.json-      "status_text": "",
bostontec_stress_test_data_1757434745.json-      "response_time": 1757434707.5212522,
bostontec_stress_test_data_1757434745.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434707.521368,
bostontec_stress_test_data_1757434745.json:      "event": "failed",
bostontec_stress_test_data_1757434745.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5951v874323709z8812273033za200zb812273033zd812273033&_p=1757434707069&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=441413792.1757434707&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771&sid=1757434707&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=672",
bostontec_stress_test_data_1757434745.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434745.json-      "relevance": "other"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434707.5218549,
bostontec_stress_test_data_1757434745.json:      "event": "failed",
bostontec_stress_test_data_1757434745.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5951v874323709z8812273033za200zb812273033zd812273033&_p=1757434707069&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=441413792.1757434707&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771&sid=1757434707&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=3&tfd=687",
bostontec_stress_test_data_1757434745.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757434745.json-      "relevance": "other"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434707.522463,
bostontec_stress_test_data_1757434745.json-      "event": "request",
bostontec_stress_test_data_1757434745.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.css",
bostontec_stress_test_data_1757434745.json-      "method": "GET",
bostontec_stress_test_data_1757434745.json-      "resource_type": "stylesheet",
--
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.079006,
bostontec_stress_test_data_1757434745.json-      "event": "request",
bostontec_stress_test_data_1757434745.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757434745.json-      "method": "GET",
bostontec_stress_test_data_1757434745.json-      "resource_type": "font",
bostontec_stress_test_data_1757434745.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.079224,
bostontec_stress_test_data_1757434745.json:      "event": "failed",
bostontec_stress_test_data_1757434745.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757434745.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757434745.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757434745.json-    },
bostontec_stress_test_data_1757434745.json-    {
bostontec_stress_test_data_1757434745.json-      "timestamp": 1757434714.079628,
bostontec_stress_test_data_1757434745.json-      "event": "response",
bostontec_stress_test_data_1757434745.json-      "url": "https://orca-experience.zoovu.com/public-assets/icons/arrow-right-1a.svg",
bostontec_stress_test_data_1757434745.json-      "status": 200,
bostontec_stress_test_data_1757434745.json-      "status_text": "",
--
bostontec_stress_test_data_1757435078.json-{
bostontec_stress_test_data_1757435078.json-  "test_summary": {
bostontec_stress_test_data_1757435078.json-    "total_runs": 1,
bostontec_stress_test_data_1757435078.json-    "successful_runs": 1,
bostontec_stress_test_data_1757435078.json:    "failed_runs": 0,
bostontec_stress_test_data_1757435078.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757435078.json-    "run_times": [
bostontec_stress_test_data_1757435078.json-      27.275713205337524
bostontec_stress_test_data_1757435078.json-    ],
bostontec_stress_test_data_1757435078.json-    "average_run_time": 27.275713205337524
bostontec_stress_test_data_1757435078.json-  },
bostontec_stress_test_data_1757435078.json-  "console_logs": [
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.736352,
bostontec_stress_test_data_1757435078.json:      "type": "error",
bostontec_stress_test_data_1757435078.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757435078.json:      "level": "error",
bostontec_stress_test_data_1757435078.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.739559,
bostontec_stress_test_data_1757435078.json:      "type": "error",
bostontec_stress_test_data_1757435078.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757435078.json:      "level": "error",
bostontec_stress_test_data_1757435078.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.75011,
bostontec_stress_test_data_1757435078.json:      "type": "error",
bostontec_stress_test_data_1757435078.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757435078.json:      "level": "error",
bostontec_stress_test_data_1757435078.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.752264,
bostontec_stress_test_data_1757435078.json-      "type": "log",
bostontec_stress_test_data_1757435078.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757435078.json-      "level": "info",
bostontec_stress_test_data_1757435078.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.759466,
bostontec_stress_test_data_1757435078.json-      "type": "log",
bostontec_stress_test_data_1757435078.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757435078.json-      "level": "info",
bostontec_stress_test_data_1757435078.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.759802,
--
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.78334,
bostontec_stress_test_data_1757435078.json-      "type": "warning",
bostontec_stress_test_data_1757435078.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757435078.json-      "level": "warning",
bostontec_stress_test_data_1757435078.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435060.359641,
bostontec_stress_test_data_1757435078.json:      "type": "error",
bostontec_stress_test_data_1757435078.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757435078.json:      "level": "error",
bostontec_stress_test_data_1757435078.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435072.0700579,
bostontec_stress_test_data_1757435078.json:      "type": "error",
bostontec_stress_test_data_1757435078.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757435078.json:      "level": "error",
bostontec_stress_test_data_1757435078.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757435078.json-    }
bostontec_stress_test_data_1757435078.json-  ],
bostontec_stress_test_data_1757435078.json-  "network_requests": [
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435045.173087,
bostontec_stress_test_data_1757435078.json-      "event": "request",
bostontec_stress_test_data_1757435078.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757435078.json-      "method": "GET",
bostontec_stress_test_data_1757435078.json-      "resource_type": "script",
bostontec_stress_test_data_1757435078.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435045.44748,
bostontec_stress_test_data_1757435078.json-      "event": "request",
bostontec_stress_test_data_1757435078.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-manifest.json",
bostontec_stress_test_data_1757435078.json-      "method": "GET",
bostontec_stress_test_data_1757435078.json-      "resource_type": "xhr",
bostontec_stress_test_data_1757435078.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435045.5102851,
bostontec_stress_test_data_1757435078.json:      "event": "failed",
bostontec_stress_test_data_1757435078.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5951v874323709z8812273033za200zb812273033zd812273033&_p=1757435045176&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1371661608.1757435045&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771&sid=1757435045&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=2&tfd=554",
bostontec_stress_test_data_1757435078.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757435078.json-      "relevance": "other"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435045.511046,
bostontec_stress_test_data_1757435078.json:      "event": "failed",
bostontec_stress_test_data_1757435078.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5951v874323709z8812273033za200zb812273033zd812273033&_p=1757435045176&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1371661608.1757435045&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771&sid=1757435045&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=539",
bostontec_stress_test_data_1757435078.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757435078.json-      "relevance": "other"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435045.532188,
bostontec_stress_test_data_1757435078.json-      "event": "response",
bostontec_stress_test_data_1757435078.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.css",
bostontec_stress_test_data_1757435078.json-      "status": 200,
bostontec_stress_test_data_1757435078.json-      "status_text": "",
--
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.738553,
bostontec_stress_test_data_1757435078.json-      "event": "request",
bostontec_stress_test_data_1757435078.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757435078.json-      "method": "GET",
bostontec_stress_test_data_1757435078.json-      "resource_type": "font",
bostontec_stress_test_data_1757435078.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.7389781,
bostontec_stress_test_data_1757435078.json:      "event": "failed",
bostontec_stress_test_data_1757435078.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757435078.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757435078.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757435078.json-    },
bostontec_stress_test_data_1757435078.json-    {
bostontec_stress_test_data_1757435078.json-      "timestamp": 1757435051.740216,
bostontec_stress_test_data_1757435078.json-      "event": "response",
bostontec_stress_test_data_1757435078.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757435078.json-      "status": 200,
bostontec_stress_test_data_1757435078.json-      "status_text": "",
--
bostontec_stress_test_data_1757435136.json-{
bostontec_stress_test_data_1757435136.json-  "test_summary": {
bostontec_stress_test_data_1757435136.json-    "total_runs": 1,
bostontec_stress_test_data_1757435136.json-    "successful_runs": 1,
bostontec_stress_test_data_1757435136.json:    "failed_runs": 0,
bostontec_stress_test_data_1757435136.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757435136.json-    "run_times": [
bostontec_stress_test_data_1757435136.json-      27.874616861343384
bostontec_stress_test_data_1757435136.json-    ],
bostontec_stress_test_data_1757435136.json-    "average_run_time": 27.874616861343384
bostontec_stress_test_data_1757435136.json-  },
bostontec_stress_test_data_1757435136.json-  "console_logs": [
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435095.844992,
bostontec_stress_test_data_1757435136.json:      "type": "error",
bostontec_stress_test_data_1757435136.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757435136.json:      "level": "error",
bostontec_stress_test_data_1757435136.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435095.9730282,
bostontec_stress_test_data_1757435136.json:      "type": "error",
bostontec_stress_test_data_1757435136.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757435136.json:      "level": "error",
bostontec_stress_test_data_1757435136.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435095.974103,
bostontec_stress_test_data_1757435136.json:      "type": "error",
bostontec_stress_test_data_1757435136.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757435136.json:      "level": "error",
bostontec_stress_test_data_1757435136.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435096.312371,
bostontec_stress_test_data_1757435136.json-      "type": "log",
bostontec_stress_test_data_1757435136.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757435136.json-      "level": "info",
bostontec_stress_test_data_1757435136.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435101.608135,
bostontec_stress_test_data_1757435136.json-      "type": "log",
bostontec_stress_test_data_1757435136.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757435136.json-      "level": "info",
bostontec_stress_test_data_1757435136.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435101.60862,
--
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435101.627538,
bostontec_stress_test_data_1757435136.json-      "type": "warning",
bostontec_stress_test_data_1757435136.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757435136.json-      "level": "warning",
bostontec_stress_test_data_1757435136.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435110.1415198,
bostontec_stress_test_data_1757435136.json:      "type": "error",
bostontec_stress_test_data_1757435136.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757435136.json:      "level": "error",
bostontec_stress_test_data_1757435136.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435122.674628,
bostontec_stress_test_data_1757435136.json:      "type": "error",
bostontec_stress_test_data_1757435136.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757435136.json:      "level": "error",
bostontec_stress_test_data_1757435136.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757435136.json-    }
bostontec_stress_test_data_1757435136.json-  ],
bostontec_stress_test_data_1757435136.json-  "network_requests": [
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435094.53855,
bostontec_stress_test_data_1757435136.json-      "event": "request",
bostontec_stress_test_data_1757435136.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757435136.json-      "method": "GET",
bostontec_stress_test_data_1757435136.json-      "resource_type": "script",
bostontec_stress_test_data_1757435136.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435094.8439949,
bostontec_stress_test_data_1757435136.json-      "event": "response",
bostontec_stress_test_data_1757435136.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/mm9Q7f9M/load-advisor?locale=en-US&refererAdvisorCode=H9Fn48Zn&launcherId=137",
bostontec_stress_test_data_1757435136.json-      "status": 200,
bostontec_stress_test_data_1757435136.json-      "status_text": "",
bostontec_stress_test_data_1757435136.json-      "response_time": 1757435094.843998,
bostontec_stress_test_data_1757435136.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435094.8583198,
bostontec_stress_test_data_1757435136.json:      "event": "failed",
bostontec_stress_test_data_1757435136.json-      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=1655692789.1757435095&auid=1573001749.1757435095&navt=n&npa=0&gtm=45He5980v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771&tft=1757435094706&tfd=362&apve=1&apvf=f",
bostontec_stress_test_data_1757435136.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757435136.json-      "relevance": "other"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435094.9306371,
bostontec_stress_test_data_1757435136.json-      "event": "response",
bostontec_stress_test_data_1757435136.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js",
bostontec_stress_test_data_1757435136.json-      "status": 200,
bostontec_stress_test_data_1757435136.json-      "status_text": "",
bostontec_stress_test_data_1757435136.json-      "response_time": 1757435094.930642,
bostontec_stress_test_data_1757435136.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435094.932011,
bostontec_stress_test_data_1757435136.json:      "event": "failed",
bostontec_stress_test_data_1757435136.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757435094540&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1435288391.1757435095&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527906~104528500~104684208~104684211~104948813~105359937~105426769~105426771&sid=1757435094&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=3&tfd=497",
bostontec_stress_test_data_1757435136.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757435136.json-      "relevance": "other"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435094.9324381,
bostontec_stress_test_data_1757435136.json:      "event": "failed",
bostontec_stress_test_data_1757435136.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757435094540&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=1435288391.1757435095&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527906~104528500~104684208~104684211~104948813~105359937~105426769~105426771&sid=1757435094&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=480",
bostontec_stress_test_data_1757435136.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757435136.json-      "relevance": "other"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435094.974721,
bostontec_stress_test_data_1757435136.json-      "event": "response",
bostontec_stress_test_data_1757435136.json-      "url": "https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js",
bostontec_stress_test_data_1757435136.json-      "status": 200,
bostontec_stress_test_data_1757435136.json-      "status_text": "",
--
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435095.973609,
bostontec_stress_test_data_1757435136.json-      "event": "request",
bostontec_stress_test_data_1757435136.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757435136.json-      "method": "GET",
bostontec_stress_test_data_1757435136.json-      "resource_type": "font",
bostontec_stress_test_data_1757435136.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435095.9737349,
bostontec_stress_test_data_1757435136.json:      "event": "failed",
bostontec_stress_test_data_1757435136.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757435136.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757435136.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757435136.json-    },
bostontec_stress_test_data_1757435136.json-    {
bostontec_stress_test_data_1757435136.json-      "timestamp": 1757435095.9745102,
bostontec_stress_test_data_1757435136.json-      "event": "response",
bostontec_stress_test_data_1757435136.json-      "url": "https://barracuda-experience.zoovu.com/public-assets/fonts/gf/lato/lato-700-normal-latin.woff2",
bostontec_stress_test_data_1757435136.json-      "status": 200,
bostontec_stress_test_data_1757435136.json-      "status_text": "",
--
bostontec_stress_test_data_1757440515.json-{
bostontec_stress_test_data_1757440515.json-  "test_summary": {
bostontec_stress_test_data_1757440515.json-    "total_runs": 1,
bostontec_stress_test_data_1757440515.json-    "successful_runs": 1,
bostontec_stress_test_data_1757440515.json:    "failed_runs": 0,
bostontec_stress_test_data_1757440515.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757440515.json-    "run_times": [
bostontec_stress_test_data_1757440515.json-      36.17020916938782
bostontec_stress_test_data_1757440515.json-    ],
bostontec_stress_test_data_1757440515.json-    "average_run_time": 36.17020916938782
bostontec_stress_test_data_1757440515.json-  },
bostontec_stress_test_data_1757440515.json-  "console_logs": [
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.014782,
bostontec_stress_test_data_1757440515.json:      "type": "error",
bostontec_stress_test_data_1757440515.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757440515.json:      "level": "error",
bostontec_stress_test_data_1757440515.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.01596,
bostontec_stress_test_data_1757440515.json:      "type": "error",
bostontec_stress_test_data_1757440515.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757440515.json:      "level": "error",
bostontec_stress_test_data_1757440515.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.017291,
bostontec_stress_test_data_1757440515.json:      "type": "error",
bostontec_stress_test_data_1757440515.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757440515.json:      "level": "error",
bostontec_stress_test_data_1757440515.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.0186062,
bostontec_stress_test_data_1757440515.json-      "type": "log",
bostontec_stress_test_data_1757440515.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757440515.json-      "level": "info",
bostontec_stress_test_data_1757440515.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.934203,
bostontec_stress_test_data_1757440515.json-      "type": "log",
bostontec_stress_test_data_1757440515.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757440515.json-      "level": "info",
bostontec_stress_test_data_1757440515.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.934943,
--
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440478.071326,
bostontec_stress_test_data_1757440515.json-      "type": "warning",
bostontec_stress_test_data_1757440515.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757440515.json-      "level": "warning",
bostontec_stress_test_data_1757440515.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440491.852698,
bostontec_stress_test_data_1757440515.json:      "type": "error",
bostontec_stress_test_data_1757440515.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757440515.json:      "level": "error",
bostontec_stress_test_data_1757440515.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440505.042212,
bostontec_stress_test_data_1757440515.json:      "type": "error",
bostontec_stress_test_data_1757440515.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757440515.json:      "level": "error",
bostontec_stress_test_data_1757440515.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757440515.json-    }
bostontec_stress_test_data_1757440515.json-  ],
bostontec_stress_test_data_1757440515.json-  "network_requests": [
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440471.133122,
bostontec_stress_test_data_1757440515.json-      "event": "request",
bostontec_stress_test_data_1757440515.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757440515.json-      "method": "GET",
bostontec_stress_test_data_1757440515.json-      "resource_type": "script",
bostontec_stress_test_data_1757440515.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440471.411464,
bostontec_stress_test_data_1757440515.json-      "event": "response",
bostontec_stress_test_data_1757440515.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.css",
bostontec_stress_test_data_1757440515.json-      "status": 200,
bostontec_stress_test_data_1757440515.json-      "status_text": "",
bostontec_stress_test_data_1757440515.json-      "response_time": 1757440471.411468,
bostontec_stress_test_data_1757440515.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440471.495569,
bostontec_stress_test_data_1757440515.json:      "event": "failed",
bostontec_stress_test_data_1757440515.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980h1v874323709z8812273033za200zb812273033zd812273033&_p=1757440471134&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=191033986.1757440471&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105359937~105426769~105426771&sid=1757440471&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=605",
bostontec_stress_test_data_1757440515.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757440515.json-      "relevance": "other"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440471.4959092,
bostontec_stress_test_data_1757440515.json:      "event": "failed",
bostontec_stress_test_data_1757440515.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980h1v874323709z8812273033za200zb812273033zd812273033&_p=1757440471134&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=191033986.1757440471&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105359937~105426769~105426771&sid=1757440471&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=2&tfd=622",
bostontec_stress_test_data_1757440515.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757440515.json-      "relevance": "other"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.000146,
bostontec_stress_test_data_1757440515.json-      "event": "response",
bostontec_stress_test_data_1757440515.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-manifest.json",
bostontec_stress_test_data_1757440515.json-      "status": 200,
bostontec_stress_test_data_1757440515.json-      "status_text": "",
--
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.0157151,
bostontec_stress_test_data_1757440515.json-      "event": "request",
bostontec_stress_test_data_1757440515.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757440515.json-      "method": "GET",
bostontec_stress_test_data_1757440515.json-      "resource_type": "font",
bostontec_stress_test_data_1757440515.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.015794,
bostontec_stress_test_data_1757440515.json:      "event": "failed",
bostontec_stress_test_data_1757440515.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757440515.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757440515.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757440515.json-    },
bostontec_stress_test_data_1757440515.json-    {
bostontec_stress_test_data_1757440515.json-      "timestamp": 1757440477.016314,
bostontec_stress_test_data_1757440515.json-      "event": "response",
bostontec_stress_test_data_1757440515.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757440515.json-      "status": 200,
bostontec_stress_test_data_1757440515.json-      "status_text": "",
--
bostontec_stress_test_data_1757441203.json-{
bostontec_stress_test_data_1757441203.json-  "test_summary": {
bostontec_stress_test_data_1757441203.json-    "total_runs": 1,
bostontec_stress_test_data_1757441203.json-    "successful_runs": 1,
bostontec_stress_test_data_1757441203.json:    "failed_runs": 0,
bostontec_stress_test_data_1757441203.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757441203.json-    "run_times": [
bostontec_stress_test_data_1757441203.json-      27.798663854599
bostontec_stress_test_data_1757441203.json-    ],
bostontec_stress_test_data_1757441203.json-    "average_run_time": 27.798663854599
bostontec_stress_test_data_1757441203.json-  },
bostontec_stress_test_data_1757441203.json-  "console_logs": [
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.942653,
bostontec_stress_test_data_1757441203.json:      "type": "error",
bostontec_stress_test_data_1757441203.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757441203.json:      "level": "error",
bostontec_stress_test_data_1757441203.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.9438741,
bostontec_stress_test_data_1757441203.json:      "type": "error",
bostontec_stress_test_data_1757441203.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757441203.json:      "level": "error",
bostontec_stress_test_data_1757441203.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.945548,
bostontec_stress_test_data_1757441203.json:      "type": "error",
bostontec_stress_test_data_1757441203.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757441203.json:      "level": "error",
bostontec_stress_test_data_1757441203.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.9463491,
bostontec_stress_test_data_1757441203.json-      "type": "log",
bostontec_stress_test_data_1757441203.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757441203.json-      "level": "info",
bostontec_stress_test_data_1757441203.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.954762,
bostontec_stress_test_data_1757441203.json-      "type": "log",
bostontec_stress_test_data_1757441203.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757441203.json-      "level": "info",
bostontec_stress_test_data_1757441203.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.956237,
--
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.963619,
bostontec_stress_test_data_1757441203.json-      "type": "warning",
bostontec_stress_test_data_1757441203.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757441203.json-      "level": "warning",
bostontec_stress_test_data_1757441203.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441174.8454669,
bostontec_stress_test_data_1757441203.json:      "type": "error",
bostontec_stress_test_data_1757441203.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757441203.json:      "level": "error",
bostontec_stress_test_data_1757441203.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441186.8149629,
bostontec_stress_test_data_1757441203.json:      "type": "error",
bostontec_stress_test_data_1757441203.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757441203.json:      "level": "error",
bostontec_stress_test_data_1757441203.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757441203.json-    }
bostontec_stress_test_data_1757441203.json-  ],
bostontec_stress_test_data_1757441203.json-  "network_requests": [
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441159.468948,
bostontec_stress_test_data_1757441203.json-      "event": "request",
bostontec_stress_test_data_1757441203.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757441203.json-      "method": "GET",
bostontec_stress_test_data_1757441203.json-      "resource_type": "script",
bostontec_stress_test_data_1757441203.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441159.739242,
bostontec_stress_test_data_1757441203.json-      "event": "request",
bostontec_stress_test_data_1757441203.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-manifest.json",
bostontec_stress_test_data_1757441203.json-      "method": "GET",
bostontec_stress_test_data_1757441203.json-      "resource_type": "xhr",
bostontec_stress_test_data_1757441203.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441159.768765,
bostontec_stress_test_data_1757441203.json:      "event": "failed",
bostontec_stress_test_data_1757441203.json-      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=101164357.1757441160&auid=2086940535.1757441160&navt=n&npa=0&gtm=45He5980v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527906~104528500~104684208~104684211~104948813~105426769~105426771~115480710&tft=1757441159615&tfd=579&apve=1&apvf=f",
bostontec_stress_test_data_1757441203.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757441203.json-      "relevance": "other"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441159.827507,
bostontec_stress_test_data_1757441203.json-      "event": "response",
bostontec_stress_test_data_1757441203.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.css",
bostontec_stress_test_data_1757441203.json-      "status": 200,
bostontec_stress_test_data_1757441203.json-      "status_text": "",
bostontec_stress_test_data_1757441203.json-      "response_time": 1757441159.82751,
bostontec_stress_test_data_1757441203.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441159.830501,
bostontec_stress_test_data_1757441203.json:      "event": "failed",
bostontec_stress_test_data_1757441203.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757441159470&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=861586545.1757441160&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771~115596673&sid=1757441159&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=685",
bostontec_stress_test_data_1757441203.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757441203.json-      "relevance": "other"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441159.831184,
bostontec_stress_test_data_1757441203.json:      "event": "failed",
bostontec_stress_test_data_1757441203.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757441159470&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=861586545.1757441160&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527906~104528501~104684208~104684211~104948813~105426769~105426771~115596673&sid=1757441159&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=2&tfd=699",
bostontec_stress_test_data_1757441203.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757441203.json-      "relevance": "other"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441159.982471,
bostontec_stress_test_data_1757441203.json-      "event": "response",
bostontec_stress_test_data_1757441203.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-manifest.json",
bostontec_stress_test_data_1757441203.json-      "status": 200,
bostontec_stress_test_data_1757441203.json-      "status_text": "",
--
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.9436522,
bostontec_stress_test_data_1757441203.json-      "event": "request",
bostontec_stress_test_data_1757441203.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757441203.json-      "method": "GET",
bostontec_stress_test_data_1757441203.json-      "resource_type": "font",
bostontec_stress_test_data_1757441203.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.943744,
bostontec_stress_test_data_1757441203.json:      "event": "failed",
bostontec_stress_test_data_1757441203.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757441203.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757441203.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441203.json-    },
bostontec_stress_test_data_1757441203.json-    {
bostontec_stress_test_data_1757441203.json-      "timestamp": 1757441165.944132,
bostontec_stress_test_data_1757441203.json-      "event": "response",
bostontec_stress_test_data_1757441203.json-      "url": "https://orca-experience.zoovu.com/public-assets/icons/refresh.svg",
bostontec_stress_test_data_1757441203.json-      "status": 200,
bostontec_stress_test_data_1757441203.json-      "status_text": "",
--
bostontec_stress_test_data_1757441330.json-{
bostontec_stress_test_data_1757441330.json-  "test_summary": {
bostontec_stress_test_data_1757441330.json-    "total_runs": 1,
bostontec_stress_test_data_1757441330.json-    "successful_runs": 1,
bostontec_stress_test_data_1757441330.json:    "failed_runs": 0,
bostontec_stress_test_data_1757441330.json-    "success_rate": 100.0,
bostontec_stress_test_data_1757441330.json-    "run_times": [
bostontec_stress_test_data_1757441330.json-      28.5051748752594
bostontec_stress_test_data_1757441330.json-    ],
bostontec_stress_test_data_1757441330.json-    "average_run_time": 28.5051748752594
bostontec_stress_test_data_1757441330.json-  },
bostontec_stress_test_data_1757441330.json-  "console_logs": [
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441287.021312,
bostontec_stress_test_data_1757441330.json:      "type": "error",
bostontec_stress_test_data_1757441330.json-      "text": "Failed to load resource: the server responded with a status of 404 ()",
bostontec_stress_test_data_1757441330.json:      "level": "error",
bostontec_stress_test_data_1757441330.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441287.1289768,
bostontec_stress_test_data_1757441330.json:      "type": "error",
bostontec_stress_test_data_1757441330.json-      "text": "Access to font at 'https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2' from origin 'https://www.bostontec.com' has been blocked by CORS policy: No 'Access-Control-Allow-Origin' header is present on the requested resource.",
bostontec_stress_test_data_1757441330.json:      "level": "error",
bostontec_stress_test_data_1757441330.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441287.130443,
bostontec_stress_test_data_1757441330.json:      "type": "error",
bostontec_stress_test_data_1757441330.json-      "text": "Failed to load resource: net::ERR_FAILED",
bostontec_stress_test_data_1757441330.json:      "level": "error",
bostontec_stress_test_data_1757441330.json-      "relevance": "image_loading"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441288.5085921,
bostontec_stress_test_data_1757441330.json-      "type": "log",
bostontec_stress_test_data_1757441330.json-      "text": "## content on default summary update ActionEvent",
bostontec_stress_test_data_1757441330.json-      "level": "info",
bostontec_stress_test_data_1757441330.json:      "relevance": "configurator_error"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441293.807081,
bostontec_stress_test_data_1757441330.json-      "type": "log",
bostontec_stress_test_data_1757441330.json-      "text": "[UnityMemory] Configuration Parameters - Can be set up in boot.config\n",
bostontec_stress_test_data_1757441330.json-      "level": "info",
bostontec_stress_test_data_1757441330.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441293.8076632,
--
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441293.812617,
bostontec_stress_test_data_1757441330.json-      "type": "warning",
bostontec_stress_test_data_1757441330.json-      "text": "WebGL: INVALID_ENUM: getInternalformatParameter: invalid internalformat",
bostontec_stress_test_data_1757441330.json-      "level": "warning",
bostontec_stress_test_data_1757441330.json-      "relevance": "pdf_generation"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441302.6989381,
bostontec_stress_test_data_1757441330.json:      "type": "error",
bostontec_stress_test_data_1757441330.json-      "text": "TypeError: Cannot read properties of null (reading 'useLazyLoading')\n    at ProductListComponent.loadMoreProducts (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1160115)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at c.$emit (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2075638)\n    at SectionPanelComponent.onScroll (https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js:2:1133808)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLDivElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLDivElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757441330.json:      "level": "error",
bostontec_stress_test_data_1757441330.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441315.4497721,
bostontec_stress_test_data_1757441330.json:      "type": "error",
bostontec_stress_test_data_1757441330.json-      "text": "TypeError: Cannot read properties of undefined (reading 'parameters')\n    at ConfiguratorTriggerModel.eval (eval at CodeContextActionExecutor.execute (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:810185), <anonymous>:181:53)\n    at EventBus.executeCallback (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569790)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569489)\n    at EventBus.triggerEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1569562)\n    at BaseModel.triggerActionEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1584578)\n    at triggerGlobalEvent (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560188)\n    at afterActionExecuted (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560836)\n    at actionInvocation (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1560885)\n    at C.value [as select] (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1561538)\n    at target.<computed> (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:1610088)\n    at t.handleButtonClick (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:66931)\n    at click (https://barracuda-components-library.zoovu.com/component-library/1427/SectionNavigationComponent/0.1.47/section-navigation-component.remote-component.v0-1.min.js:2:68564)\n    at invokeWithErrorHandling (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2048125)\n    at HTMLButtonElement.invoker (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2050141)\n    at S._wrapper (https://barracuda-cdn.zoovu.com/core-js/runner-browser-api-5.176-latest.min.js:1:2087889)\n    at HTMLButtonElement.r (https://barracuda-components-library.zoovu.com/component-library/1427/LeadgenComponent/1.3.18/leadgen-component.remote-component.v1-3.min.js:58:136555)",
bostontec_stress_test_data_1757441330.json:      "level": "error",
bostontec_stress_test_data_1757441330.json:      "relevance": "zoovu_error"
bostontec_stress_test_data_1757441330.json-    }
bostontec_stress_test_data_1757441330.json-  ],
bostontec_stress_test_data_1757441330.json-  "network_requests": [
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441285.621161,
bostontec_stress_test_data_1757441330.json-      "event": "request",
bostontec_stress_test_data_1757441330.json-      "url": "https://api-barracuda.zoovu.com/api/v1/launchers/PxvQZl/production-configurator",
bostontec_stress_test_data_1757441330.json-      "method": "GET",
bostontec_stress_test_data_1757441330.json-      "resource_type": "script",
bostontec_stress_test_data_1757441330.json-      "relevance": "zoovu_request"
--
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441285.983268,
bostontec_stress_test_data_1757441330.json-      "event": "response",
bostontec_stress_test_data_1757441330.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.css",
bostontec_stress_test_data_1757441330.json-      "status": 200,
bostontec_stress_test_data_1757441330.json-      "status_text": "",
bostontec_stress_test_data_1757441330.json-      "response_time": 1757441285.983271,
bostontec_stress_test_data_1757441330.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441286.0322502,
bostontec_stress_test_data_1757441330.json:      "event": "failed",
bostontec_stress_test_data_1757441330.json-      "url": "https://www.google.com/ccm/collect?en=page_view&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&scrsrc=www.googletagmanager.com&frm=0&rnd=823443501.1757441286&auid=1492179438.1757441286&navt=n&npa=0&gtm=45He5980v812273033za200zd812273033xea&gcd=13l3l3l3l1l1&dma=0&tag_exp=101509157~103116026~103200004~103233427~104527907~104528501~104684208~104684211~104948813~105426769~105426771~115480709~115596673&tft=1757441285836&tfd=559&apve=1&apvf=f",
bostontec_stress_test_data_1757441330.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757441330.json-      "relevance": "other"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441286.032853,
bostontec_stress_test_data_1757441330.json-      "event": "response",
bostontec_stress_test_data_1757441330.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-manifest.json",
bostontec_stress_test_data_1757441330.json-      "status": 200,
bostontec_stress_test_data_1757441330.json-      "status_text": "",
--
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441286.10858,
bostontec_stress_test_data_1757441330.json-      "event": "response",
bostontec_stress_test_data_1757441330.json-      "url": "https://api-barracuda.zoovu.com/api/v1/advisors/mm9Q7f9M/load-advisor?locale=en-US&refererAdvisorCode=H9Fn48Zn&launcherId=137",
bostontec_stress_test_data_1757441330.json-      "status": 200,
bostontec_stress_test_data_1757441330.json-      "status_text": "",
bostontec_stress_test_data_1757441330.json-      "response_time": 1757441286.108584,
bostontec_stress_test_data_1757441330.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441286.109091,
bostontec_stress_test_data_1757441330.json:      "event": "failed",
bostontec_stress_test_data_1757441330.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757441285645&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=434861100.1757441286&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_eu=AAACAAQ&_s=2&tag_exp=101509157~103116026~103200004~103233427~104527907~104528500~104684208~104684211~104948813~105330666~105426769~105426771~115596674&sid=1757441285&sct=1&seg=1&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_et=3&tfd=732",
bostontec_stress_test_data_1757441330.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757441330.json-      "relevance": "other"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441286.109316,
bostontec_stress_test_data_1757441330.json:      "event": "failed",
bostontec_stress_test_data_1757441330.json-      "url": "https://analytics.google.com/g/collect?v=2&tid=G-7FV9HY1DMB&gtm=45je5980v874323709z8812273033za200zb812273033zd812273033&_p=1757441285645&_gaz=1&gcd=13l3l3l3l1l1&npa=0&dma=0&cid=434861100.1757441286&ul=en-us&sr=1280x720&uaa=arm&uab=64&uafvl=Not%253DA%253FBrand%3B24.0.0.0%7CChromium%3B140.0.7339.16&uamb=0&uam=&uap=macOS&uapv=14.1.1&uaw=0&are=1&frm=0&pscdl=noapi&_s=1&tag_exp=101509157~103116026~103200004~103233427~104527907~104528500~104684208~104684211~104948813~105330666~105426769~105426771~115596674&sid=1757441285&sct=1&seg=0&dl=https%3A%2F%2Fwww.bostontec.com%2F3d-workbench-builder%2F&dt=&en=page_view&_fv=1&_nsi=1&_ss=1&tfd=709",
bostontec_stress_test_data_1757441330.json-      "failure_text": "net::ERR_ABORTED",
bostontec_stress_test_data_1757441330.json-      "relevance": "other"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441286.144269,
bostontec_stress_test_data_1757441330.json-      "event": "response",
bostontec_stress_test_data_1757441330.json-      "url": "https://orca-exd-global-components.zoovu.com/versions/5.36.0/web-design/webdesign-bundle.min.js",
bostontec_stress_test_data_1757441330.json-      "status": 200,
bostontec_stress_test_data_1757441330.json-      "status_text": "",
--
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441287.129919,
bostontec_stress_test_data_1757441330.json-      "event": "request",
bostontec_stress_test_data_1757441330.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal.woff",
bostontec_stress_test_data_1757441330.json-      "method": "GET",
bostontec_stress_test_data_1757441330.json-      "resource_type": "font",
bostontec_stress_test_data_1757441330.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441287.130197,
bostontec_stress_test_data_1757441330.json:      "event": "failed",
bostontec_stress_test_data_1757441330.json-      "url": "https://tiger-experience.zoovu.com/public-assets/fonts/gf/montserrat/montserrat-400-normal-latin.woff2",
bostontec_stress_test_data_1757441330.json-      "failure_text": "net::ERR_FAILED",
bostontec_stress_test_data_1757441330.json-      "relevance": "zoovu_request"
bostontec_stress_test_data_1757441330.json-    },
bostontec_stress_test_data_1757441330.json-    {
bostontec_stress_test_data_1757441330.json-      "timestamp": 1757441287.130841,
bostontec_stress_test_data_1757441330.json-      "event": "response",
bostontec_stress_test_data_1757441330.json-      "url": "https://ev-co.zoovu.com/v1/CollectAdvisorEvent",
bostontec_stress_test_data_1757441330.json-      "status": 200,
bostontec_stress_test_data_1757441330.json-      "status_text":