-- Question 1: Achieving 1NF (First Normal Form)
-- Transform the ProductDetail table so each row represents a single product for an order

-- Assuming the original table is named ProductDetail
-- Sample transformation using UNION ALL (for demonstration)
SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop' AS Product
UNION ALL
SELECT 101, 'John Doe', 'Mouse'
UNION ALL
SELECT 102, 'Jane Smith', 'Tablet'
UNION ALL
SELECT 102, 'Jane Smith', 'Keyboard'
UNION ALL
SELECT 102, 'Jane Smith', 'Mouse'
UNION ALL
SELECT 103, 'Emily Clark', 'Phone';


-- Question 2: Achieving 2NF (Second Normal Form)
-- Remove partial dependencies by splitting OrderDetails into two tables

-- Table 1: Orders (OrderID, CustomerName)
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Table 2: OrderProducts (OrderID, Product, Quantity)
CREATE TABLE OrderProducts (
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert sample data into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
  (101, 'John Doe'),
  (102, 'Jane Smith'),
  (103, 'Emily Clark');

-- Insert sample data into OrderProducts
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES
  (101, 'Laptop', 2),
  (101, 'Mouse', 1),
  (102, 'Tablet', 3),
  (102, 'Keyboard', 1),
  (102, 'Mouse', 2),
  (103, 'Phone', 1);
