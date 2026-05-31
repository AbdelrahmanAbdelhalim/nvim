from itertools import combinations

def bootstrap_axis_stability(embs_a, embs_b, n_bootstrap=200):
    """How stable is the axis across random resamples?"""
    n = min(len(embs_a), len(embs_b))
    axes = []
    for _ in range(n_bootstrap):
        idx_a = np.random.choice(len(embs_a), n // 2, replace=False)
        idx_b = np.random.choice(len(embs_b), n // 2, replace=False)
        v = unit(embs_a[idx_a].mean(0) - embs_b[idx_b].mean(0))
        axes.append(v)
    
    # Pairwise cosine similarities between bootstrap axes
    sims = [np.dot(axes[i], axes[j]) 
            for i, j in combinations(range(len(axes)), 2)]
    print(f"Mean cosine similarity: {np.mean(sims):.4f}")
    print(f"Std:                    {np.std(sims):.4f}")
    # Target: mean > 0.95, std < 0.02

bootstrap_axis_stability(war, peace)
bootstrap_axis_stability(diplomacy, breakdown)
