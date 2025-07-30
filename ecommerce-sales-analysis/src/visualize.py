import matplotlib.pyplot as plt
import seaborn as sns
import os

def sales_trend(df, output_dir):
    """Plot monthly order count trend for Amazon Sale Report."""
    monthly_orders = df.groupby(['Year', 'Month'])['Order ID'].count().reset_index()
    plt.figure(figsize=(10,6))
    sns.lineplot(data=monthly_orders, x='Month', y='Order ID', hue='Year', marker='o')
    plt.title('Monthly Order Count Trend')
    plt.ylabel('Number of Orders')
    plt.savefig(os.path.join(output_dir, 'monthly_order_count_trend.png'))
    plt.close()

def category_sales(df, output_dir):
    """Plot order count by product category for Amazon Sale Report."""
    category_orders = df.groupby('Category')['Order ID'].count().sort_values(ascending=False)
    plt.figure(figsize=(10,6))
    sns.barplot(x=category_orders.index, y=category_orders.values)
    plt.title('Order Count by Product Category')
    plt.ylabel('Number of Orders')
    plt.xticks(rotation=45)
    plt.savefig(os.path.join(output_dir, 'category_order_count.png'))
    plt.close()
