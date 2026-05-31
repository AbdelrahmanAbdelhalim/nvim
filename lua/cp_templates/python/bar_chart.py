import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.DataFrame(data)

plt.figure(figsize=(10, 6))
sns.barplot(x=df['col'].index, y=df['something'].values, palette='viridis')

plt.title('Distribution of Article Topics')
plt.xlabel('Topic')
plt.ylabel('Number of Articles')
plt.xticks(rotation=45)
plt.show()
