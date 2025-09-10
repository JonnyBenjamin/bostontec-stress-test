#!/usr/bin/env python3
"""
Mock data generator for memory analysis visualization
Creates realistic memory usage data across 40 test runs
"""

import json
import random
from datetime import datetime

def generate_mock_memory_data(num_runs=100):
    """Generate mock memory usage data for multiple test runs with varied scenarios"""
    
    memory_data = []
    
    for run_num in range(1, num_runs + 1):
        # Create varied scenarios: good, bad, and in-between
        scenario = run_num % 10
        
        if scenario <= 6:  # 70% good runs (low memory)
            base_memory = random.uniform(8, 25)
            variation = random.uniform(-3, 5)
        elif scenario <= 8:  # 20% medium runs (caution zone)
            base_memory = random.uniform(30, 45)
            variation = random.uniform(-5, 8)
        else:  # 10% bad runs (high memory)
            base_memory = random.uniform(50, 70)
            variation = random.uniform(-8, 10)
        
        peak_memory = base_memory + variation
        peak_memory = max(5.0, min(75.0, peak_memory))  # Keep within 5-75% range
        
        # Generate some step-by-step memory data for each run
        step_memory = []
        for step in range(1, 8):  # 7 steps per run
            step_memory.append(peak_memory - random.uniform(0, 2.0))
        
        memory_data.append({
            'run_number': run_num,
            'peak_memory_percent': round(peak_memory, 1),
            'average_memory_percent': round(peak_memory - 1.2, 1),
            'step_memory': [round(m, 1) for m in step_memory],
            'timestamp': datetime.now().timestamp() + (run_num * 30)  # 30 seconds apart
        })
    
    return memory_data

def create_mock_test_data():
    """Create a complete mock test data file"""
    
    memory_data = generate_mock_memory_data(100)
    
    # Calculate realistic success rates based on memory usage
    high_memory_runs = [run for run in memory_data if run['peak_memory_percent'] > 50]
    medium_memory_runs = [run for run in memory_data if 35 <= run['peak_memory_percent'] <= 50]
    
    # Higher memory usage = more likely to fail
    total_runs = 100
    failed_runs = len(high_memory_runs) + int(len(medium_memory_runs) * 0.3)  # 30% of medium runs fail
    successful_runs = total_runs - failed_runs
    
    # Create comprehensive test data
    mock_data = {
        'test_summary': {
            'total_runs': 100,
            'successful_runs': successful_runs,
            'failed_runs': failed_runs,
            'success_rate': (successful_runs / total_runs) * 100,
            'run_times': [random.uniform(25, 35) for _ in range(100)],
            'average_run_time': 29.2
        },
        'performance_metrics': [],
        'console_logs': [
            {'message': 'PDF generation completed successfully', 'relevance': 'pdf_generation'},
            {'message': 'Canvas to blob conversion successful', 'relevance': 'canvas_memory'},
            {'message': 'Memory cleanup completed', 'relevance': 'memory_management'}
        ] * 20,  # 20 successful logs
        'network_requests': [
            {'url': 'https://api.zoovu.com/products', 'status': 200, 'relevance': 'zoovu_request'}
        ] * 15,
        'memory_analysis': {
            'peak_memory_across_runs': max([run['peak_memory_percent'] for run in memory_data]),
            'average_memory_across_runs': sum([run['average_memory_percent'] for run in memory_data]) / len(memory_data),
            'memory_stability': 'STABLE',
            'trend_analysis': 'SLIGHT_INCREASE'
        },
        'timestamp': datetime.now().timestamp(),
        'test_path_file': 'test_path.json',
        'target_url': 'https://www.bostontec.com/3d-workbench-builder/?'
    }
    
    # Add performance metrics for each run
    for run_data in memory_data:
        for step_num, step_memory in enumerate(run_data['step_memory']):
            mock_data['performance_metrics'].append({
                'timestamp': run_data['timestamp'] + (step_num * 4),
                'memory': {
                    'used': int(step_memory * 20000000),  # Mock memory usage in bytes
                    'total': 200000000,
                    'limit': 2000000000
                },
                'memory_usage_percent': step_memory,
                'run_number': run_data['run_number'],
                'step_name': f'step_{step_num + 1}',
                'navigation': {
                    'load_time': random.uniform(2.5, 3.5),
                    'dom_content_loaded': 0,
                    'first_paint': random.uniform(1.0, 2.0),
                    'first_contentful_paint': random.uniform(1.5, 2.5)
                }
            })
    
    return mock_data, memory_data

if __name__ == "__main__":
    # Generate mock data
    mock_data, memory_data = create_mock_test_data()
    
    # Save to file
    filename = f"mock_memory_test_data_{int(datetime.now().timestamp())}.json"
    with open(filename, 'w') as f:
        json.dump(mock_data, f, indent=2)
    
    print(f"✅ Mock data generated: {filename}")
    print(f"📊 {len(memory_data)} test runs with varied memory data")
    print(f"📈 Memory range: {min([r['peak_memory_percent'] for r in memory_data]):.1f}% - {max([r['peak_memory_percent'] for r in memory_data]):.1f}%")
    print(f"📈 Average memory: {sum([r['average_memory_percent'] for r in memory_data]) / len(memory_data):.1f}%")
    
    # Show memory distribution
    green_runs = [r for r in memory_data if r['peak_memory_percent'] <= 35]
    yellow_runs = [r for r in memory_data if 35 < r['peak_memory_percent'] <= 50]
    red_runs = [r for r in memory_data if r['peak_memory_percent'] > 50]
    
    print(f"\n📊 Memory Distribution:")
    print(f"  🟢 Green (Normal ≤35%): {len(green_runs)} runs")
    print(f"  🟡 Yellow (Caution 35-50%): {len(yellow_runs)} runs")
    print(f"  🔴 Red (High Risk >50%): {len(red_runs)} runs")
    
    # Show first few runs
    print("\nFirst 5 runs:")
    for run in memory_data[:5]:
        print(f"  Run {run['run_number']}: Peak {run['peak_memory_percent']}%, Avg {run['average_memory_percent']}%")
