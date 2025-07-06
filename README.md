# Stored-Procedures-and-Functions

# 📦 SQL Stored Procedures & Functions – Mini Project

This project demonstrates how to use **stored procedures** and **functions** in SQL to modularize and reuse logic using a basic e-commerce-style relational database.

## 🗃️ Database Tables Used

- **Customers**: Holds customer details.
- **Products**: Contains product names and prices.
- **Orders**: Links customer orders.
- **OrderItems**: Associates products with orders (quantities).
- **Payments**: Records payments made for orders.

---

## 🔁 Stored Procedures

### 1. `GetCustomerOrders(IN customer_id INT)`
Returns all order and payment details for a specific customer.

```sql
CALL GetCustomerOrders(1);
2. GetOrderSummaryByCity()
Returns the total number of orders and total payments grouped by city.

CALL GetOrderSummaryByCity();
🔢 Functions
1. GetTotalPaidByCustomer(IN customer_id INT)
Returns the total amount paid by a specific customer.

SELECT GetTotalPaidByCustomer(1);
2. GetProductTotalSales(IN product_id INT)
Returns the total revenue generated from a product.

SELECT GetProductTotalSales(1);  -- Example for Laptop
📌 Learning Outcomes
✅ Learn to write reusable SQL blocks
✅ Understand input/output handling in procedures and functions
✅ Apply conditional logic and calculations
✅ Practice parameter passing and aggregation

📂 Tools Used
MySQL Workbench 

SQL queries with CREATE PROCEDURE, CREATE FUNCTION, CALL, and SELECT

✍️ Author
Gauri Milind Javheri
Aspiring Data Scientist | GenAI Researcher
📍 Kalyan, Thane
📧 gaurijavherist11@gmail.com
