import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Sample Data
data = {
    'skills': ['Go', 'Confluence', 'Hadoop', 'Snowflake', 'Azure', 'BigQuery', 'AWS', 'Java', 'SSIS', 'Jira'],
    'avg_salary': [115320, 114210, 113193, 112948, 111225, 109654, 108317, 106906, 106683, 104918],
    'demand_count': [27, 11, 22, 37, 34, 13, 32, 17, 12, 20]
}

# Create DataFrame
df = pd.DataFrame(data)

# Create Bubble Chart
plt.figure(figsize=(10, 6))
sns.scatterplot(data=df, x='avg_salary', y='demand_count', size='demand_count', sizes=(50, 1000), hue='skills', legend=None, palette='viridis')

# Add titles and labels
plt.title('Skills Demand vs. Average Salary for Data Analysts', fontsize=14)
plt.xlabel('Average Salary ($)', fontsize=12)
plt.ylabel('Demand Count', fontsize=12)

plt.savefig('optimal_skills.png')
# Show the plot
plt.show()





