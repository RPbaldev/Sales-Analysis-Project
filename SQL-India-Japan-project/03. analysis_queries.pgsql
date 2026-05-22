--Query 1 : Total revenue by region  

SELECT 
    c.region,
    SUM(oi.total_sales) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_revenue DESC;

--Query 2 : Top 5 products by revenue 

SELECT 
    p.product_name,
    SUM(oi.total_sales) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

--Query 3 : Revenue by japanese supplier 

SELECT 
    s.supplier_name,
    SUM(oi.total_sales) AS revenue
FROM order_items oi 
JOIN products p ON 
    oi.product_id = p.product_id 
JOIN suppliers s ON 
    p.supplier_id = s.supplier_id 
GROUP BY s.supplier_name
ORDER BY revenue DESC;

--Query 4 : Monthly sales trend 

SELECT 
    DATE_TRUNC('month',o.order_date) AS month,
    SUM(oi.total_sales) AS revenue 
FROM order_items oi 
JOIN orders o ON
    oi.order_id = o.order_id 
GROUP BY month
ORDER BY month;

--Query 5 : Top customers by cities

SELECT * 
FROM (
    SELECT c.customer_id, c.city,
    SUM(oi.total_sales) AS revenue,
    RANK( ) OVER (ORDER BY 
    SUM(oi.total_sales)DESC) AS rank
        FROM order_items oi 
        JOIN orders o ON 
        oi.order_id = o.order_id 
        JOIN customers c ON  
        o.customer_id = c.customer_id 
        GROUP BY c.customer_id, c.city
) ranked 
WHERE rank <=5;

--Query 6 : Profit by category 

SELECT 
    p.category,
    SUM(oi.profit) AS total_profit
FROM order_items oi 
JOIN products p ON 
    oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_profit DESC;