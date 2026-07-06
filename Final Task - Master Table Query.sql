-- ================================================
-- SOAL 3
-- ================================================
SELECT 
  c.CustomerID,
  c.CustomerEmail,
  c.CustomerCity,
  o.OrderID,
  o.Date AS order_date,
  o.Quantity
FROM `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Customers` c
JOIN `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Orders` o 
  ON c.CustomerID = o.CustomerID;

SELECT 
  p.ProdNumber,
  p.ProdName,
  p.Price,
  o.OrderID,
  o.Date AS order_date,
  o.Quantity
FROM `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Products` p
JOIN `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Orders` o 
  ON p.ProdNumber = o.ProdNumber;

SELECT 
  pc.CategoryID,
  pc.CategoryName,
  p.ProdNumber,
  p.ProdName,
  p.Price
FROM `project-93c09293-d518-48e5-8c2.bank_muamalat_task.ProductCategory` pc
JOIN `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Products` p 
  ON pc.CategoryID = p.Category;


SELECT 
  COUNT(*) AS total_rows
FROM `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Orders` o
JOIN `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Customers` c 
  ON o.CustomerID = c.CustomerID
JOIN `project-93c09293-d518-48e5-8c2.bank_muamalat_task.Products` p 
  ON o.ProdNumber = p.ProdNumber
JOIN `project-93c09293-d518-48e5-8c2.bank_muamalat_task.ProductCategory` pc 
  ON p.Category = pc.CategoryID;


-- ================================================
-- SOAL 4
-- ================================================

SELECT
  o.Date                                  AS order_date,
  pc.CategoryName                         AS category_name,
  p.ProdName                              AS product_name,
  p.Price                                 AS product_price,
  o.Quantity                              AS order_qty,
  o.Quantity * p.Price                    AS total_sales,
  SPLIT(c.CustomerEmail, '#')[OFFSET(0)] AS cust_email,
  c.CustomerCity                          AS cust_city,

FROM `bank_muamalat_task.Orders` o

JOIN `bank_muamalat_task.Customers` c
  ON o.CustomerID = c.CustomerID

JOIN `bank_muamalat_task.Products` p
  ON o.ProdNumber = p.ProdNumber

JOIN `bank_muamalat_task.ProductCategory` pc
  ON p.Category = pc.CategoryID

ORDER BY o.Date ASC;