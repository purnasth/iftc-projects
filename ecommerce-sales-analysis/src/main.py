import os
from etl import load_data, clean_data, transform_data
from visualize import sales_trend, category_sales

DATA_PATH = 'data/sales_data.csv'
OUTPUT_DIR = 'output'

def main():
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)
    df = load_data(DATA_PATH)
    df = clean_data(df)
    df = transform_data(df)
    sales_trend(df, OUTPUT_DIR)
    category_sales(df, OUTPUT_DIR)
    print("Analysis complete. Charts saved in 'output/' folder.")

if __name__ == "__main__":
    main()
