#!/usr/bin/env python3
"""
Cleanup script to organize timestamped test files
Moves old reports and data files to organized archive folders
"""

import os
import shutil
import glob
from datetime import datetime

def create_archive_structure():
    """Create organized archive directory structure"""
    archive_dirs = [
        'archive/old_test_data',
        'archive/old_reports', 
        'archive/old_mock_data',
        'archive/debug_files'
    ]
    
    for dir_path in archive_dirs:
        os.makedirs(dir_path, exist_ok=True)
        print(f"✅ Created directory: {dir_path}")

def cleanup_test_data_files():
    """Move old test data JSON files to archive"""
    test_data_files = glob.glob('bostontec_stress_test_data_*.json')
    
    if test_data_files:
        print(f"\n📊 Found {len(test_data_files)} old test data files:")
        for file in test_data_files:
            print(f"  - {file}")
            shutil.move(file, f'archive/old_test_data/{file}')
        print(f"✅ Moved {len(test_data_files)} test data files to archive/old_test_data/")
    else:
        print("📊 No old test data files found")

def cleanup_report_files():
    """Move old HTML report files from root to archive"""
    report_files = glob.glob('bostontec_stress_test_report_*.html')
    
    if report_files:
        print(f"\n📄 Found {len(report_files)} old report files in root:")
        for file in report_files:
            print(f"  - {file}")
            shutil.move(file, f'archive/old_reports/{file}')
        print(f"✅ Moved {len(report_files)} report files to archive/old_reports/")
    else:
        print("📄 No old report files found in root")

def cleanup_mock_data_files():
    """Move old mock data files to archive"""
    mock_data_files = glob.glob('mock_memory_test_data_*.json')
    
    if mock_data_files:
        print(f"\n🎭 Found {len(mock_data_files)} old mock data files:")
        for file in mock_data_files:
            print(f"  - {file}")
            shutil.move(file, f'archive/old_mock_data/{file}')
        print(f"✅ Moved {len(mock_data_files)} mock data files to archive/old_mock_data/")
    else:
        print("🎭 No old mock data files found")

def cleanup_debug_files():
    """Move debug and temporary files to archive"""
    debug_files = []
    
    # Add debug images
    debug_files.extend(glob.glob('run_*_final_state.png'))
    
    # Add log files
    debug_files.extend(glob.glob('*.log'))
    
    if debug_files:
        print(f"\n🐛 Found {len(debug_files)} debug/temp files:")
        for file in debug_files:
            print(f"  - {file}")
            shutil.move(file, f'archive/debug_files/{file}')
        print(f"✅ Moved {len(debug_files)} debug files to archive/debug_files/")
    else:
        print("🐛 No debug files found")

def cleanup_duplicate_reports():
    """Remove duplicate reports folder since we have html_reports/"""
    if os.path.exists('reports/'):
        print(f"\n📁 Found duplicate reports/ folder")
        shutil.rmtree('reports/')
        print("✅ Removed duplicate reports/ folder (keeping html_reports/)")
    else:
        print("📁 No duplicate reports folder found")

def cleanup_cache():
    """Remove Python cache files"""
    cache_dirs = glob.glob('__pycache__')
    cache_dirs.extend(glob.glob('**/__pycache__', recursive=True))
    
    if cache_dirs:
        print(f"\n🗑️  Found {len(cache_dirs)} cache directories:")
        for cache_dir in cache_dirs:
            print(f"  - {cache_dir}")
            shutil.rmtree(cache_dir)
        print(f"✅ Removed {len(cache_dirs)} cache directories")
    else:
        print("🗑️  No cache directories found")

def show_cleanup_summary():
    """Show summary of what's left in the main directory"""
    print(f"\n📋 CLEANUP SUMMARY")
    print(f"=" * 50)
    
    # List remaining files in main directory
    remaining_files = [f for f in os.listdir('.') if os.path.isfile(f)]
    remaining_dirs = [d for d in os.listdir('.') if os.path.isdir(d) and not d.startswith('.')]
    
    print(f"\n📁 Remaining directories:")
    for dir_name in sorted(remaining_dirs):
        print(f"  - {dir_name}/")
    
    print(f"\n📄 Remaining files:")
    for file_name in sorted(remaining_files):
        print(f"  - {file_name}")
    
    print(f"\n✅ Main directory is now clean and organized!")

def main():
    """Main cleanup function"""
    print("🧹 BOSTONTEC TESTING CLEANUP")
    print("=" * 50)
    print(f"Cleaning up timestamped files and organizing archive...")
    
    # Create archive structure
    create_archive_structure()
    
    # Clean up different file types
    cleanup_test_data_files()
    cleanup_report_files() 
    cleanup_mock_data_files()
    cleanup_debug_files()
    cleanup_duplicate_reports()
    cleanup_cache()
    
    # Show summary
    show_cleanup_summary()
    
    print(f"\n🎉 Cleanup complete! All old files moved to archive/ folders")

if __name__ == "__main__":
    main()
