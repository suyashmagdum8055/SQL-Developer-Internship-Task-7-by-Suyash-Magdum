USE ECommerce_DB;

-- 1. Create a view showing customer order details
CREATE VIEW CustomerOrderDetails AS
SELECT 
    c.CustomerID,
    c.Name AS CustomerName,
    o.OrderID,
    o.OrderDate,
    o.Amount
FROM Customer2 c
JOIN Orders4 o ON c.CustomerID = o.CustomerID;

-- Usage: Select from the view
SELECT * FROM CustomerOrderDetails;


-- Create a view showing product sales by category
CREATE VIEW ProductSalesByCategory AS
SELECT 
    cat.CategoryName,
    p.ProductName,
    SUM(oi.Quantity) AS Total_Quantity_Sold,
    SUM(oi.Price * oi.Quantity) AS Total_Sales
FROM OrderItems oi
JOIN Product p ON oi.ProductID = p.ProductID
JOIN Category cat ON p.CategoryID = cat.CategoryID
GROUP BY cat.CategoryName, p.ProductName;

-- Usage:
SELECT * FROM ProductSalesByCategory;


-- 3. Create a view showing high value orders (above 5000)
CREATE VIEW HighValueOrders AS
SELECT *
FROM Orders4
WHERE Amount > 5000;

-- Usage:
SELECT * FROM HighValueOrders;


-- 4. Create a view combining payment info with customer name
CREATE VIEW CustomerPayments AS
SELECT 
    c.Name AS CustomerName,
    p.PaymentID,
    p.PaymentDate,
    p.Amount,
    p.PaymentMethod
FROM Payment p
JOIN Orders4 o ON p.OrderID = o.OrderID
JOIN Customer2 c ON o.CustomerID = c.CustomerID;

-- Usage:
SELECT * FROM CustomerPayments;

