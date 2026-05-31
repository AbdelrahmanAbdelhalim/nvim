import matplotlib.pyplot as plt
import seaborn as sns

plt.figure(figsize=(12, 6))
ax = sns.barplot(
    data=hyperdf, 
    x='Name', 
    y='Count', 
    hue='Name', 
    palette='viridis', 
    dodge=False
)

# 3. Aesthetics: Remove the cluttered X-axis labels
ax.set_xticklabels([])
ax.set_xlabel('Topics (See Legend)')
ax.set_ylabel('Number of Articles')
plt.title('Distribution of Article Topics')

# 4. Move the legend outside the plot so it doesn't overlap the bars
plt.legend(title='Topic Name', bbox_to_anchor=(1.05, 1), loc='upper left', borderaxespad=0.)

plt.tight_layout()
plt.show()
