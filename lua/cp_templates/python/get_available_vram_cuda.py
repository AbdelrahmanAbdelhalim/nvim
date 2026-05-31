import torch
print(f"GPU: {torch.cuda.get_device_name(0)}")
print(f"Total VRAM: {torch.cuda.get_device_properties(0).total_memory / 1e9:.2f} GB")
print(f"Allocated: {torch.cuda.memory_allocated(0) / 1e9:.2f} GB")
print(f"Reserved: {torch.cuda.memory_reserved(0) / 1e9:.2f} GB")
