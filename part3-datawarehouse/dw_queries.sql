-- -- =========================
-- Q1: Total sales revenue by product category for each month
-- =========================
SELECT 
    d.month_name,
    p.category,
    SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY d.month, d.month_name, p.category
ORDER BY d.month, p.category;


-- =========================
-- Q2: Top 2 performing stores by total revenue
-- =========================
SELECT 
    s.store_name,
    SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY total_revenue DESC
LIMIT 2;


-- =========================
-- Q3: Month-over-month sales trend
-- =========================
SELECT 
    d.year,
    d.month,
    SUM(f.revenue) AS monthly_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;DIM DATE
-- =========================
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT,
    month INT,
    year INT,
    month_name VARCHAR(20)
);

-- =========================
-- DIM STORE
-- =========================
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(50)
);

-- =========================
-- DIM PRODUCT
-- =========================
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- =========================
-- FACT TABLE
-- =========================
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    units_sold INT,
    revenue DECIMAL(12,2),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- =========================
-- CLEANED DATA INSERTS
-- =========================

-- Dates (standardized YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2023-01-15', 15, 1, 2023, 'January'),
(2, '2023-02-05', 5, 2, 2023, 'February'),
(3, '2023-02-20', 20, 2, 2023, 'February'),
(4, '2023-08-29', 29, 8, 2023, 'August'),
(5, '2023-12-12', 12, 12, 2023, 'December');

-- Stores
INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Mumbai Central', 'Mumbai');

-- Products (category standardized)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Mobile', 'Electronics'),
(3, 'TV', 'Electronics'),
(4, 'Shirt', 'Clothing'),
(5, 'Rice', 'Groceries');

-- FACT TABLE (revenue calculated = units * price)
INSERT INTO fact_sales VALUES
(1, 4, 1, 1, 3, 147788.34),
(2, 5, 1, 2, 11, 255487.32),
(3, 2, 1, 3, 20, 974067.80),
(4, 3, 2, 2, 14, 325165.68),
(5, 1, 1, 1, 10, 588510.10),
(6, 2, 2, 4, 5, 15000),
(7, 3, 3, 5, 8, 4000),
(8, 4, 2, 3, 6, 180000),
(9, 5, 3, 1, 2, 100000),
(10, 1, 3, 2, 7, 140000);