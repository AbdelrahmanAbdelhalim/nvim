client = chromadb.PersistentClient(path=abs_chroma_path)
collection = client.get_collection(name="archival")
query_text = """afghanistan-pakistan border skirmish"""
query_res = collection.query(
    query_texts = [query_text], 
)

print(query_res)

