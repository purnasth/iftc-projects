import pandas as pd

def load_data(filepath):
    """Load CSV data into a DataFrame."""
    return pd.read_csv(filepath)

def clean_data(df):
    """Clean missing values and correct data types for Amazon Sale Report."""
    df = df.dropna()
    df['Date'] = pd.to_datetime(df['Date'])
    # If there is a quantity or price column, add logic here. For now, just keep the structure.
    # Example: df['Quantity Ordered'] = pd.to_numeric(df['Quantity Ordered'], errors='coerce')
    # Example: df['Price Each'] = pd.to_numeric(df['Price Each'], errors='coerce')
    # If there is a total sales column, use it, else skip calculation.
    return df

def transform_data(df):
    """Add derived columns for analysis."""
    df['Month'] = df['Date'].dt.month
    df['Year'] = df['Date'].dt.year
    return df
