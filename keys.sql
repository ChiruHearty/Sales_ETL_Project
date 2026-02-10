create database sales_etl1;
use sales_etl1;

ALTER TABLE categories
ADD CONSTRAINT PK_Constraint PRIMARY KEY (category_id);

ALTER TABLE customers
ADD CONSTRAINT PK_Constraint PRIMARY KEY (customer_id);

ALTER TABLE order_items
ADD CONSTRAINT PK_Constraint PRIMARY KEY (order_item_id);

ALTER TABLE orders
ADD CONSTRAINT PK_Constraint PRIMARY KEY (order_id);

ALTER TABLE products
ADD CONSTRAINT PK_Constraint PRIMARY KEY (product_id);


ALTER TABLE products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (category_id) REFERENCES categories(category_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_product
FOREIGN KEY (product_id) REFERENCES products(product_id);

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;

SELECT 
    ROUND(SUM(quantity * price), 2) AS total_revenue
FROM order_items;


