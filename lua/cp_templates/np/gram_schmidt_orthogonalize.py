def gram_schmidt_orthogonalize(v1, v2):
    """Make v2 orthogonal to v1."""
    v2_orth = v2 - np.dot(v2, v1) * v1
    return unit(v1), unit(v2_orth)

v_conflict_hat, v_process_hat = gram_schmidt_orthogonalize(
    v_conflict_hat, v_process_hat
)

# Verify
print(f"Post-GS dot product: {np.dot(v_conflict_hat, v_process_hat):.6f}")
# Should be ~0.000000
