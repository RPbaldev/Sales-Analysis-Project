CREATE TABLE raw_sales (
    product_name TEXT,
    category TEXT,
    price NUMERIC,
    quantity INT,
    total_sales NUMERIC,
    discount NUMERIC,
    order_date DATE,
    customer_rating NUMERIC,
    payment_method TEXT,
    supplier_name TEXT,
    profit NUMERIC,
    customer_segment TEXT,
    region TEXT,
    city TEXT,
    customer_id TEXT,
    product_id TEXT,
    order_id TEXT,
    supplier_id TEXT
);

-- =========================================================
            TABLE CREATION
-- =========================================================

-- Customers
CREATE TABLE customers AS
SELECT DISTINCT
    customer_id,
    customer_segment,
    region,
    city
FROM raw_sales;


-- Suppliers
CREATE TABLE suppliers AS
SELECT DISTINCT
    supplier_id,
    supplier_name
FROM raw_sales;


-- Products
CREATE TABLE products AS
SELECT DISTINCT
    product_id,
    product_name,
    category,
    supplier_id
FROM raw_sales;


-- Orders
CREATE TABLE orders AS
SELECT DISTINCT
    order_id,
    customer_id,
    order_date,
    payment_method
FROM raw_sales;


-- Order Items
CREATE TABLE order_items AS
SELECT
    ROW_NUMBER() OVER (ORDER BY order_id, product_id) AS order_item_id,
    order_id,
    product_id,
    quantity,
    price,
    discount,
    total_sales,
    profit,
    customer_rating
FROM raw_sales;