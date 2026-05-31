import json
# Open the file and load the data
with open('data.json', 'r', encoding='utf-8') as file:
    data = json.load(file)

# 'data' is now a Python dictionary or list
print(data)

