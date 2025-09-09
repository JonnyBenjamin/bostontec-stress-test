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
    """Update the index.html file with a list of available reports"""
    reports = list(Path(reports_dir).glob('*.html'))
    reports.sort(key=lambda x: x.stat().st_mtime, reverse=True)  # Sort by modification time, newest first
    
    if not reports:
        return
    
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
    
    # Read current index.html
    with open('index.html', 'r') as f:
        content = f.read()
    
    # Find the reports list section and replace it completely
    start_marker = '<div id="reports-list" class="space-y-3">'
    end_marker = '</div>'
    
    start_idx = content.find(start_marker)
    if start_idx != -1:
        start_idx += len(start_marker)
        end_idx = content.find(end_marker, start_idx)
        if end_idx != -1:
            # Replace the entire reports section
            new_content = content[:start_idx] + reports_html + content[end_idx:]
            content = new_content
    
    # Write updated index.html
    with open('index.html', 'w') as f:
        f.write(content)
    
    print(f"📝 Updated index.html with {len(reports)} reports")


if __name__ == "__main__":
    deploy_reports()
