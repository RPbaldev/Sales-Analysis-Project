--Data cleaning

CREATE TABLE customers AS
SELECT DISTINCT
    customer_id,
    customer_segment,
    region,
    city
FROM raw_sales;

------------------
CREATE TABLE suppliers (
    supplier_id 
    supplier_name
);

-------------------
CREATE TABLE products AS
SELECT DISTINCT
    product_id,
    product_name,
    category,
    supplier_id
FROM raw_sales;

---------------------
CREATE TABLE orders AS
SELECT DISTINCT
    order_id,
    customer_id,
    order_date
FROM raw_sales;

---------------------
CREATE TABLE order_items AS
SELECT
    ROW_NUMBER() OVER () AS order_item_id,
    order_id,
    product_id,
    product_id,
    quantity,
    price,
    discount,
    total_sales,
    profit,
    customer_rating
FROM raw_sales;