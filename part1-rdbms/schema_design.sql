-- =========================
-- CUSTOMERS TABLE
-- =========================
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customers VALUES
('C101', 'Amit Sharma', 'Mumbai'),
('C102', 'Priya Singh', 'Delhi'),
('C103', 'Rahul Verma', 'Mumbai'),
('C104', 'Sneha Reddy', 'Hyderabad'),
('C105', 'Arjun Mehta', 'Bangalore');

-- =========================
-- PRODUCTS TABLE
-- =========================
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO products VALUES
('P101', 'Laptop', 55000),
('P102', 'Mobile', 20000),
('P103', 'Headphones', 2000),
('P104', 'Keyboard', 1500),
('P105', 'Mouse', 800);

-- =========================
-- SALES REPRESENTATIVES TABLE
-- =========================
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    office_address VARCHAR(100) NOT NULL
);

INSERT INTO sales_reps VALUES
('SR101', 'Ravi Kumar', 'ravi@example.com', 'Delhi'),
('SR102', 'Anita Shah', 'anita@example.com', 'Mumbai'),
('SR103', 'Vikram Rao', 'vikram@example.com', 'Hyderabad'),
('SR104', 'Neha Jain', 'neha@example.com', 'Delhi'),
('SR105', 'Karan Patel', 'karan@example.com', 'Bangalore');

-- =========================
-- ORDERS TABLE
-- =========================
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO orders VALUES
('O101', 'C101', 'SR101', '2024-01-10'),
('O102', 'C102', 'SR102', '2024-01-12'),
('O103', 'C103', 'SR101', '2024-01-15'),
('O104', 'C104', 'SR103', '2024-01-18'),
('O105', 'C105', 'SR104', '2024-01-20');

-- =========================
-- ORDER ITEMS TABLE
-- =========================
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 'O101', 'P101', 1),
(2, 'O101', 'P103', 2),
(3, 'O102', 'P102', 1),
(4, 'O103', 'P104', 3),
(5, 'O104', 'P105', 5);