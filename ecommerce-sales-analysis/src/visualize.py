import matplotlib.pyplot as plt
import seaborn as sns
import os

def sales_trend(df, output_dir):
    """Plot monthly sales trend."""
    monthly_sales = df.groupby(['Year', 'Month'])['Total Sales'].sum().reset_index()
    plt.figure(figsize=(10,6))
    sns.lineplot(data=monthly_sales, x='Month', y='Total Sales', hue='Year', marker='o')
    plt.title('Monthly Sales Trend')
    plt.savefig(os.path.join(output_dir, 'monthly_sales_trend.png'))
    plt.close()

def category_sales(df, output_dir):
    """Plot sales by product category."""
    category_sales = df.groupby('Category')['Total Sales'].sum().sort_values(ascending=False)
    plt.figure(figsize=(10,6))
    sns.barplot(x=category_sales.index, y=category_sales.values)
    plt.title('Sales by Product Category')
    plt.xticks(rotation=45)
    plt.savefig(os.path.join(output_dir, 'category_sales.png'))
    plt.close()
