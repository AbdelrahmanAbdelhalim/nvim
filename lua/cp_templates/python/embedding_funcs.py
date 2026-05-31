from chromadb.utils import embedding_functions

bge_ef = embedding_functions.SentenceTransformerEmbeddingFunction(model_name="BAAI/bge-base-en-v1.5")

nomic_ef = embedding_functions.SentenceTransformerEmbeddingFunction(
    model_name="nomic-ai/nomic-embed-text-v1.5", 
    trust_remote_code=True # Required for Nomic's custom architecture
)
