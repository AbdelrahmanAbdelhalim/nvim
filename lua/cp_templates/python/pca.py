from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
import numpy as np

X = np.array([[1, 2], [3, 4], [5, 6]])

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

pca = PCA(n_components=1) # Reduce to 1 dimension
X_pca = pca.fit_transform(X_scaled)
