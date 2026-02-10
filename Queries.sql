## Core KPI's ##
-- Total Revenue
SELECT 
	ROUND(SUM(oi.quantity * oi.price)) as total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed';

-- Total orders
SELECT 
	COUNT(DISTINCT order_id) as total_orders
FROM orders
WHERE order_status = 'Completed' ;

-- Average order value
SELECT 
	ROUND(
		SUM(oi.quantity * oi.price) / COUNT(DISTINCT o.order_id),2) AS avg_ord_val
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed';


## Revenue Trend Analysis ##
-- Monthly Revenue Trend
SELECT 
	DATE_FORMAT(o.order_date, '%Y -%m') AS month,
	ROUND(SUM(oi.quantity * oi.price),2) AS Monthly_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY month
ORDER BY Month;

-- YEAR-OVER-YEAR REVENUE
WITH yearly_revenue AS (
	SELECT 
		YEAR(o.order_date) AS year,
        SUM(oi.quantity * oi.price) AS revenue
	FROM order_items oi
    JOIN orders o ON o.order_id = oi.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY year
)
SELECT 
	year,
    LAG(revenue) OVER(ORDER BY year) AS prev_year_revenue,
    ROUND(
		(revenue - LAG(revenue) OVER (ORDER BY year)) / 
        LAG(revenue) OVER (ORDER BY year) * 100, 2) AS yoy_growth
FROM yearly_revenue;



## Customer Analysis Patterns ##
-- Top 10 Customers by revenue
SELECT 
	c.customer_name,
    ROUND(SUM(oi.quantity * oi.price), 2) AS tot_spent
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY customer_name
ORDER BY tot_spent DESC
LIMIT 10;

-- Repeated Customers
SELECT 
	customer_id,
    COUNT(DISTINCT order_id) AS Tot_orders
FROM orders
WHERE order_status = 'Completed'
GROUP BY customer_id
HAVING tot_orders > 1
ORDER BY Tot_orders DESC;
    
## Operational Insights ##
-- Payment Methods Usage
SELECT 
	payment_method,
    COUNT(*) AS order_count
FROM orders
WHERE order_status = 'Completed'
GROUP BY payment_method
ORDER BY order_count DESC;

-- Order Status Breakdown
SELECT
	order_status,
    COUNT(*) AS tot_orders
FROM orders
GROUP BY order_status;

-- Revenue Fact View
CREATE OR REPLACE VIEW vw_sales_fact AS
SELECT 
	o.order_id,
    o.order_date,
    o.customer_id,
    o.payment_method,
    p.product_id,
    p.product_name,
    c.category_name,
    oi.quantity,
    oi.price,
    (oi.quantity * oi.price) AS revenue
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN categories c ON c.category_id = p.category_id
WHERE o.order_status = 'Completed';    
    
    
select * from vw_sales_fact;


    
    
    
    


