def fix_seed(seed=0):
    import os
    import random

    import numpy as np
    import torch

    os.environ['PYTHONHASHSEED'] = str(seed)
    # random
    random.seed(seed)
    # Numpy
    np.random.seed(seed)
    # Pytorch
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    torch.use_deterministic_algorithms(True)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False
