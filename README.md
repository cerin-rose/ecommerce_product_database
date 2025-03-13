# E-Commerce Database Schema

## Overview

This database schema is designed for an e-commerce platform, handling product management, order processing, and category classification. It supports tracking product inventory, storing orders, and computing sales analytics.

## Database Tables

### 1. **Products**

* Stores product details such as name, price, category, stock quantity, and creation date.
* Each product belongs to a category (nullable foreign key).

### 2. **Categories**

* Manages product categories with unique names.
* Linked to products to classify them accordingly.

### 3. **Orders**

* Stores order details, including order date and total amount.
* Orders serve as a parent entity for order details.

### 4. **Order Details**

* Records individual product purchases in each order.
* Tracks the quantity and subtotal for each product in an order.

## Relationships

* Each **product** belongs to a **category** (can be NULL).
* Each **order** consists of multiple  **order details** .
* Products in **order details** reference the **products** table.
* Deleting an order removes related **order details** (cascade delete).
* Deleting a product removes associated **order details** (cascade delete).

## Sample Data

* Predefined categories: Electronics, Clothing, Home Appliances.
* Example products include a Laptop, Smartphone, T-shirt, and Microwave.
* Sample orders simulate customer purchases.

## Queries Included

1. Retrieve order details along with product names and quantities.
2. Compute total revenue per product.
3. Count the number of orders per product.
4. Calculate total sales revenue.
5. Determine total revenue per category.
6. Identify the top 5 best-selling products.
7. List products with low stock (less than 10 units).

## Use Cases

* Tracking product availability and sales.
* Generating revenue reports by product and category.
* Analyzing popular products based on sales volume.
* Monitoring low-stock items for inventory management.

## Notes

* Uses `SERIAL` for primary keys with auto-increment.
* Enforces foreign key constraints for data integrity.
* Implements `ON DELETE SET NULL` for categories to prevent data loss.
