## Normalization Justification

While keeping all data in a single flat table may seem simpler initially, it leads to significant data inconsistencies and maintenance challenges. In the given dataset, customer, product, order, and sales representative details are stored together, resulting in redundancy and anomalies.

For example, sales representative information such as name, email, and office address is repeated across multiple rows for every order they handle. If the office address of a sales representative changes, it must be updated in multiple records. Missing even one update leads to inconsistent data, demonstrating an update anomaly. Similarly, product details are duplicated across rows, increasing storage usage and risk of errors.

The dataset also suffers from insert and delete anomalies. A new product cannot be added unless an order exists, and deleting an order may result in the loss of important product or customer information if it exists only in that row.

Normalization to Third Normal Form (3NF) resolves these issues by separating the data into logical tables such as customers, products, orders, sales representatives, and order items. Each table stores only relevant attributes, and relationships are maintained using foreign keys. This eliminates redundancy, ensures data consistency, and improves scalability.

Therefore, normalization is not over-engineering but a necessary design approach for maintaining data integrity, reducing anomalies, and supporting efficient database operations in real-world applications.

## Anomaly Analysis

### 1. Insert Anomaly

**Description:**
An insert anomaly occurs when we cannot insert data into the database without including additional, unrelated data.

**Example from orders_flat.csv:**
The product details (`product_id`, `product_name`, `unit_price`) cannot be inserted independently without creating an order.

For instance, we cannot add:

- product_id = P999
- product_name = Tablet
- unit_price = 15000

unless we also provide:

- order_id
- customer_id
- sales_rep_id

**Issue:**
Product information is dependent on order data, making independent insertion impossible.

---

### 2. Update Anomaly

**Description:**
An update anomaly occurs when the same data is repeated across multiple rows and must be updated in multiple places.

**Example from orders_flat.csv:**
Sales representative details such as (`sales_rep_id`, `sales_rep_name`, `office_address`) are repeated in multiple rows.

For example:

- Row 1: sales_rep_id = SR101, office = Delhi
- Row 4: sales_rep_id = SR101, office = Delhi

If the office address changes, all rows must be updated.

**Issue:**
If one row is not updated, it leads to inconsistent data.

---

### 3. Delete Anomaly

**Description:**
A delete anomaly occurs when deleting a row unintentionally removes important data.

**Example from orders_flat.csv:**
If a product (e.g., product_id = P205) exists in only one order, deleting that order will remove all product information.

**Issue:**
Important product/customer/sales representative data may be lost when deleting order records.

---
