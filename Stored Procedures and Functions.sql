-- 1. Stored Procedure

-- ➤ Name: GetCustomerOrders
-- This procedure takes a customer_id and returns their order details (order date and total payment).

DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(IN input_customer_id INT)
BEGIN
    SELECT 
        c.name AS customer_name,
        o.order_id,
        o.order_date,
        p.amount_paid,
        p.payment_date
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Payments p ON o.order_id = p.order_id
    WHERE c.customer_id = input_customer_id;
END$$

DELIMITER ;

-- How to call it:

CALL GetCustomerOrders(1);

 Stored Procedure 2
-- ➤ Name: GetOrderSummaryByCity
-- This procedure returns the total number of orders and total payment grouped by city.

DELIMITER $$

CREATE PROCEDURE GetOrderSummaryByCity()
BEGIN
    SELECT 
        c.city,
        COUNT(o.order_id) AS total_orders,
        SUM(p.amount_paid) AS total_payment
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN Payments p ON o.order_id = p.order_id
    GROUP BY c.city;
END$$

DELIMITER ;
-- 🧪 How to call:

CALL GetOrderSummaryByCity();

-- 2. Function

-- ➤ Name: GetTotalPaidByCustomer
-- This function takes a customer_id and returns the total amount paid by that customer.

DELIMITER $$

CREATE FUNCTION GetTotalPaidByCustomer(input_customer_id INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    
    SELECT SUM(p.amount_paid)
    INTO total
    FROM Orders o
    JOIN Payments p ON o.order_id = p.order_id
    WHERE o.customer_id = input_customer_id;
    
    RETURN IFNULL(total, 0.00);
END$$

DELIMITER ;

-- 🧪 How to use it:

SELECT GetTotalPaidByCustomer(1) AS Total_Amount_Paid;

-- 🔧 Function 2
-- ➤ Name: GetProductTotalSales
-- This function returns the total sales amount for a product using its product ID.

DELIMITER $$

CREATE FUNCTION GetProductTotalSales(input_product_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_sales DECIMAL(10,2);
    
    SELECT SUM(p.price * oi.quantity)
    INTO total_sales
    FROM OrderItems oi
    JOIN Products p ON oi.product_id = p.product_id
    WHERE p.product_id = input_product_id;
    
    RETURN IFNULL(total_sales, 0.00);
END$$

DELIMITER ;
-- 🧪 How to use:

SELECT GetProductTotalSales(1) AS Laptop_Sales;


