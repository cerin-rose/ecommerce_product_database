CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    category_id INT,
    stock_quantity INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10,2) NOT NULL
);

CREATE TABLE order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

INSERT INTO categories (category_name) VALUES 
('Electronics'), 
('Clothing'), 
('Home Appliances');

INSERT INTO products (name, price, category_id, stock_quantity) VALUES
('Laptop', 1200.99, 1, 50),
('Smartphone', 799.49, 1, 100),
('T-shirt', 19.99, 2, 200),
('Microwave', 150.75, 3, 30);

INSERT INTO orders (total_amount) VALUES
(2000.50), (500.75), (999.99);

INSERT INTO order_details (order_id, product_id, quantity, subtotal) VALUES
(1, 1, 2, 2401.98),
(1, 2, 1, 799.49),
(2, 3, 3, 59.97),
(3, 4, 2, 301.50);

SELECT orders.order_id, products.name, order_details.quantity, order_details.subtotal
FROM order_details
JOIN products ON order_details.product_id = products.product_id
JOIN orders ON order_details.order_id = orders.order_id;

SELECT products.name, SUM(order_details.subtotal) AS total_revenue
FROM order_details
JOIN products ON order_details.product_id = products.product_id
GROUP BY products.name;

SELECT products.name, COUNT(order_details.order_id) AS total_orders
FROM order_details
JOIN products ON order_details.product_id = products.product_id
GROUP BY products.name;

SELECT SUM(total_amount) AS total_sales FROM orders;

SELECT c.category_name, SUM(od.subtotal) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;


SELECT p.name, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 5;

SELECT name, stock_quantity
FROM products
WHERE stock_quantity < 10;

