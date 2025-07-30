import pandas as pd

def load_data(filepath):
    """Load CSV data into a DataFrame."""
    return pd.read_csv(filepath)

def clean_data(df):
    """Clean missing values and correct data types."""
    df = df.dropna()
    df['Order Date'] = pd.to_datetime(df['Order Date'])
    df['Quantity Ordered'] = pd.to_numeric(df['Quantity Ordered'], errors='coerce')
    df['Price Each'] = pd.to_numeric(df['Price Each'], errors='coerce')
    df['Total Sales'] = df['Quantity Ordered'] * df['Price Each']
    return df

def transform_data(df):
    """Add derived columns for analysis."""
    df['Month'] = df['Order Date'].dt.month
    df['Year'] = df['Order Date'].dt.year
    return df
