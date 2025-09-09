#!/usr/bin/env python3
"""
Deploy HTML reports to GitHub Pages
This script copies HTML reports to the gh-pages branch and pushes them to GitHub
"""

import os
import shutil
import subprocess
import json
from datetime import datetime
from pathlib import Path


def run_command(cmd, cwd=None):
    """Run a shell command and return the result"""
    try:
        result = subprocess.run(cmd, shell=True, cwd=cwd, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Error running command: {cmd}")
            print(f"Error: {result.stderr}")
            return False
        return True
    except Exception as e:
        print(f"Exception running command {cmd}: {e}")
        return False


def deploy_reports():
    """Deploy HTML reports to GitHub Pages"""
    print("🚀 Deploying HTML reports to GitHub Pages...")
    
    # Check if we're in a git repository
    if not os.path.exists('.git'):
        print("❌ Not in a git repository")
        return False
    
    # Get current branch
    result = subprocess.run(['git', 'branch', '--show-current'], capture_output=True, text=True)
    current_branch = result.stdout.strip()
    print(f"📍 Current branch: {current_branch}")
    
    # Switch to gh-pages branch
    print("🔄 Switching to gh-pages branch...")
    if not run_command('git checkout gh-pages'):
        print("❌ Failed to switch to gh-pages branch")
        return False
    
    # Copy HTML reports to root directory
    html_reports_dir = 'html_reports'
    if os.path.exists(html_reports_dir):
        print("📁 Copying HTML reports...")
        
        # Create reports directory in gh-pages
        reports_dir = 'reports'
        os.makedirs(reports_dir, exist_ok=True)
        
        # Copy all HTML files
        for html_file in Path(html_reports_dir).glob('*.html'):
            dest_path = Path(reports_dir) / html_file.name
            shutil.copy2(html_file, dest_path)
            print(f"  ✅ Copied {html_file.name}")
        
        # Clean up old reports - keep only the 5 most recent
        cleanup_old_reports(reports_dir)
        
        # Update index.html with latest reports
        update_index_html(reports_dir)
        
    else:
        print("⚠️  No HTML reports directory found")
    
    # Add and commit changes
    print("💾 Committing changes...")
    if not run_command('git add .'):
        print("❌ Failed to add files")
        return False
    
    if not run_command('git commit -m "Update HTML reports - ' + datetime.now().strftime('%Y-%m-%d %H:%M:%S') + '"'):
        print("❌ Failed to commit changes")
        return False
    
    # Push to GitHub
    print("🌐 Pushing to GitHub...")
    if not run_command('git push origin gh-pages'):
        print("❌ Failed to push to GitHub")
        return False
    
    print("✅ Successfully deployed to GitHub Pages!")
    print("🔗 Your reports will be available at: https://jonnybenjamin.github.io/bostontec-stress-test/")
    
    # Switch back to original branch
    if current_branch != 'gh-pages':
        print(f"🔄 Switching back to {current_branch} branch...")
        run_command(f'git checkout {current_branch}')
    
    return True


def cleanup_old_reports(reports_dir):
    """Keep only the 5 most recent reports, remove older ones"""
    reports = list(Path(reports_dir).glob('*.html'))
    if len(reports) <= 5:
        return  # No cleanup needed
    
    # Sort by modification time, newest first
    reports.sort(key=lambda x: x.stat().st_mtime, reverse=True)
    
    # Remove all but the 5 most recent
    for old_report in reports[5:]:
        old_report.unlink()
        print(f"  🗑️  Removed old report: {old_report.name}")
    
    print(f"  ✅ Cleaned up old reports, kept {min(5, len(reports))} most recent")


def update_index_html(reports_dir):
    """Generate a completely new index.html file with the latest reports"""
    reports = list(Path(reports_dir).glob('*.html'))
    reports.sort(key=lambda x: x.stat().st_mtime, reverse=True)  # Sort by modification time, newest first
    
    # Generate reports list HTML
    reports_html = ""
    for i, report in enumerate(reports[:5], 1):  # Show only the 5 most recent reports
        report_date = datetime.fromtimestamp(report.stat().st_mtime).strftime('%B %d, %Y at %I:%M %p')
        reports_html += f'''
        <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition-colors">
            <div class="flex justify-between items-center">
                <div>
                    <h4 class="font-semibold text-gray-800">Performance Test #{i}</h4>
                    <p class="text-sm text-gray-500">Generated: {report_date}</p>
                </div>
                <a href="reports/{report.name}" target="_blank" 
                   class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
                    View Report
                </a>
            </div>
        </div>'''
    
    # Generate the complete index.html file from scratch
    index_content = f'''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BostonTec 3D Workbench Builder - Stress Test Reports</title>
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
        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <div class="text-center">
                <div class="mb-4">
                    <img src="BOSTONtec-Logo.png" alt="BostonTec" class="h-12 mx-auto">
                </div>
                <h1 class="text-2xl font-semibold text-gray-800 mb-2">3D Workbench Builder</h1>
                <h2 class="text-lg font-medium text-gray-600">Stress Test Reports</h2>
                <div class="mt-4 text-sm text-gray-500">
                    Automated testing and analysis reports
                </div>
            </div>
        </div>

        <div class="bg-white rounded-xl shadow-sm p-6 mb-6">
            <h3 class="text-xl font-semibold text-gray-800 mb-4">Latest Reports</h3>
            <div id="reports-list" class="space-y-3">
                {reports_html}
            </div>
        </div>

        <div class="bg-blue-50 rounded-lg p-4 mb-6">
            <h4 class="font-semibold text-blue-800 mb-2">About These Reports</h4>
            <p class="text-sm text-blue-700">
                These reports contain comprehensive analysis of the BostonTec 3D Workbench Builder stress tests, 
                including performance metrics, memory usage patterns, and error analysis to help identify 
                potential issues with PDF generation and overall system performance.
            </p>
        </div>

        <div class="text-xs text-gray-400 text-center mt-12 pt-4 border-t border-gray-200">
            BostonTec 3D Workbench Builder - Stress Test Reports | Generated automatically
        </div>
    </div>
</body>
</html>'''
    
    # Write the complete new index.html file
    with open('index.html', 'w') as f:
        f.write(index_content)
    
    print(f"📝 Generated new index.html with {len(reports)} reports")


if __name__ == "__main__":
    deploy_reports()
