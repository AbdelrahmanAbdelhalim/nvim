import torch
import psutil

if torch.backends.mps.is_available():
    print("✓ MPS (Metal Performance Shaders) is available")
    print(f"MPS is built: {torch.backends.mps.is_built()}")
else:
    print("✗ MPS is not available")

# Get system memory info
import os
if hasattr(os, 'sysconf'):
    total_memory = os.sysconf('SC_PAGE_SIZE') * os.sysconf('SC_PHYS_PAGES')
    print(f"\nTotal unified memory: {total_memory / 1e9:.2f} GB")

# Get current process memory
process = psutil.Process(os.getpid())
memory_info = process.memory_info()
print(f"Process memory (RSS): {memory_info.rss / 1e9:.2f} GB")
print(f"Process memory (VMS): {memory_info.vms / 1e9:.2f} GB")

# PyTorch MPS memory
if torch.backends.mps.is_available():
    try:
        print(f"\nCurrent MPS allocated: {torch.mps.current_allocated_memory() / 1e9:.2f} GB")
        print(f"MPS driver allocated: {torch.mps.driver_allocated_memory() / 1e9:.2f} GB")
    except Exception as e:
        print(f"Could not get MPS memory stats: {e}")
