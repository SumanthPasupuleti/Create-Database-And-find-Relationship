

CREATE TABLE Orders
(
  Order_id CHAR(5) NOT NULL,
  Order_Status VARCHAR(20) NOT NULL,
  Date_recevied DATE NOT NULL,
  Employee_Id CHAR(4) NOT NULL,
  Date_Ordered DATE NOT NULL,
  Order_total NUMERIC NOT NULL,
  Cust_Id CHAR(4) NOT NULL,
  PRIMARY KEY (Order_id)
);


CREATE TABLE Product
(
  Product_Id CHAR(4) NOT NULL,
  Product_Name VARCHAR(20) NOT NULL,
  P.category VARCHAR(20) NOT NULL,
  Rating INT NOT NULL,
  Price INT NOT NULL,
  Quantity_on_Hand INT NOT NULL,
  Order_id CHAR(5) NOT NULL,
  PRIMARY KEY (Product_Id),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Menu_Order_Details
(
  Quantity_ INT NOT NULL,
  Order_Details INT NOT NULL,
  Price_ INT NOT NULL,
  Order_id CHAR(5) NOT NULL,
  Product_Id CHAR(4) NOT NULL,
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
  FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
);

CREATE TABLE Product_Ingredient
(
  Product_Name VARCHAR(20) NOT NULL,
  Product_Category VARCHAR(20) NOT NULL,
  Ingredient_ID CHAR(4) NOT NULL,
  Quantity INT NOT NULL,
  Product_Id CHAR(4) NOT NULL,
  PRIMARY KEY (Ingredient_ID),
  FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
);

CREATE TABLE Employee
(
  Employee_ID CHAR(5) NOT NULL,
  Employee_Name VARCHAR(20) NOT NULL,
  Order_id CHAR(5) NOT NULL,
  PRIMARY KEY (Employee_ID),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Customer
(
  Cust_Id CHAR(4) NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Phone NUMERIC NOT NULL,
  Zip_-_code CHAR(6) NOT NULL,
  City VARCHAR(10) NOT NULL,
  State VARCHAR(10) NOT NULL,
  Order_id CHAR(5) NOT NULL,
  PRIMARY KEY (Cust_Id),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Orders
(
  Order_id CHAR(5) NOT NULL,
  Order_Status VARCHAR(20) NOT NULL,
  Date_recevied DATE NOT NULL,
  Employee_Id CHAR(4) NOT NULL,
  Date_Ordered DATE NOT NULL,
  Order_total NUMERIC NOT NULL,
  Cust_Id CHAR(4) NOT NULL,
  PRIMARY KEY (Order_id)
);
INSERT INTO Orders (Order_id, Order_Status, Date_recevied, Employee_Id, Date_ordered, Order_total, Cust_Id)
VALUES 
('10001', 'Pending', '2024-01-01', 'E001', '2024-01-01', 20, 'C001'),
('10002', 'Confirmed', '2024-01-02', 'E002', '2024-01-02', 30, 'C002'),
('10003', 'Shipped', '2024-01-03', 'E003', '2024-01-03', 40, 'C003'),
('10004', 'Delivered', '2024-01-04', 'E001', '2024-01-04', 50, 'C004'),
('10005', 'Cancelled', '2024-01-05', 'E002', '2024-01-05', 60, 'C005'),
('10006', 'Pending', '2024-01-06', 'E003', '2024-01-06', 70, 'C006'),
('10007', 'Confirmed', '2024-01-07', 'E001', '2024-01-07', 80, 'C007'),
('10008', 'Shipped', '2024-01-08', 'E002', '2024-01-08', 90, 'C008');
CREATE TABLE Product
(
  Product_Id CHAR(4) NOT NULL,
  Product_Name VARCHAR(20) NOT NULL,
  Category VARCHAR(20) NOT NULL, -- Corrected column name
  Rating INT NOT NULL,
  Price INT NOT NULL,
  Quantity_on_Hand INT NOT NULL,
  Order_id CHAR(5) NOT NULL,
  PRIMARY KEY (Product_Id),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id) -- Assuming Orders is the correct table name
);
INSERT INTO Product (Product_Id, Product_Name, Category, Rating, Price, Quantity_on_Hand, Order_id)
VALUES ('P001', 'Apples', 'Fruits', 5, 2, 100, '10001'),
       ('P002', 'Bread', 'Bakery', 4, 3, 50, '10002'),
       ('P003', 'Broccoli', 'Vegetables', 4, 4, 75, '10003'),
       ('P004', 'Pizza', 'Frozen Meals', 5, 10, 30, '10004'),
       ('P005', 'Yogurt', 'Dairy', 4, 3, 80, '10005'),
       ('P006', 'Coffee Beans', 'Beverages', 4, 15, 20, '10006'),
       ('P007', 'Honey', 'Condiments', 5, 8, 40, '10007'),
       ('P008', 'Pasta', 'Dry Staples', 4, 5, 120, '10008');

CREATE TABLE Menu_Order_Details
(
  Quantity_ INT NOT NULL,
  Order_Details INT NOT NULL,
  Price_ INT NOT NULL,
  Order_id CHAR(5) NOT NULL,
  Product_Id CHAR(4) NOT NULL,
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
  FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
);
INSERT INTO Menu_Order_Details (Quantity_, Order_Details, Price_, Order_id, Product_Id) VALUES
(2, 1, 15, '10001', 'P001'),
(3, 2, 10, '10002', 'P002'),
(1, 3, 20, '10003', 'P003'),
(4, 4, 25, '10004', 'P004'),
(2, 5, 30, '10005', 'P005'),
(1, 6, 35, '10006', 'P006'),
(3, 7, 40, '10007', 'P007'),
(2, 8, 45, '10008', 'P008');


CREATE TABLE Product_Ingredient
(
  Product_Name VARCHAR(20) NOT NULL,
  Product_Category VARCHAR(20) NOT NULL,
  Ingredient_ID CHAR(4) NOT NULL,
  Quantity INT NOT NULL,
  Product_Id CHAR(4) NOT NULL,
  PRIMARY KEY (Ingredient_ID),
  FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
);

INSERT INTO Product_Ingredient (Product_Name, Product_Category, Ingredient_ID, Quantity, Product_Id)
VALUES 
('Apples', 'Fruits', 'I001', 6, 'P001'),          -- 6 Apples
('Bread', 'Bakery', 'I002', 5, 'P002'),            -- 5 cups of Flour
('Broccoli', 'Vegetables', 'I003', 1, 'P003'),     -- 1 head of Broccoli
('Pizza', 'Frozen Meals', 'I004', 2, 'P004'),      -- 2 Pizza crusts
('Cheese', 'Dairy', 'I005', 2, 'P004'),            -- 2 cups of Cheese
('Tomato Sauce', 'Condiments', 'I006', 1, 'P004'), -- 1 jar of Tomato Sauce
('Honey', 'Condiments', 'I009', 2, 'P007'),        -- 2 jars of Honey
('Pasta Sauce', 'Condiments', 'I011', 2, 'P008');  -- 2 jars of Pasta Sauce

           

CREATE TABLE Employee
(
  Employee_ID CHAR(5) NOT NULL,
  Employee_Name VARCHAR(20) NOT NULL,
  Order_id CHAR(5) NOT NULL,
  PRIMARY KEY (Employee_ID),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);
INSERT INTO Employee (Employee_ID, Employee_Name, Order_id) VALUES
('E001', 'John Doe', '10001'),
('E002', 'Alice Smith', '10002'),
('E003', 'Michael Johnson', '10003'),
('E004', 'Emily Davis', '10004'),
('E005', 'James Wilson', '10005'),
('E006', 'Sarah Brown', '10006'),
('E007', 'David Martinez', '10007'),
('E008', 'Jennifer Taylor', '10008');


CREATE TABLE Customer_Orders
(
  Cust_Id CHAR(4) NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Phone NUMERIC NOT NULL,
  Zip_code CHAR(6) NOT NULL,
  City VARCHAR(10) NOT NULL,
  State VARCHAR(10) NOT NULL,
  Order_id CHAR(5) NOT NULL,
  PRIMARY KEY (Cust_Id),
  FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

INSERT INTO Customer_Orders (Cust_Id, Name, Phone, Zip_code, City, State, Order_id) VALUES
('C001', 'Alice Johnson', 1234567890, '123456', 'NYC', 'NY', '10001'),
('C002', 'Bob Smith', 9876543210, '654321', 'LA', 'CA', '10002'),
('C003', 'Charlie Brown', 2345678901, '456789', 'Chicago', 'IL', '10003'),
('C004', 'David Lee', 8765432109, '789012', 'Houston', 'TX', '10004'),
('C005', 'Emily Wilson', 3456789012, '567890', 'Phila', 'PA', '10005'),
('C006', 'Frank Garcia', 7654321098, '890123', 'Phoenix', 'AZ', '10006'),
('C007', 'Grace Rodriguez', 4567890123, '678901', 'SanAnt', 'TX', '10007'),
('C008', 'Hannah Martinez', 6543210987, '901234', 'SDiego', 'CA', '10008');



 1.)#calculate the total_order_amount for each order
 
SELECT o.Order_id, SUM(p.Price * mod2.Quantity_) AS Total_Order_Amount
FROM Orders o
JOIN Menu_Order_Details mod2 ON o.Order_id = mod2.Order_id
JOIN Product p ON mod2.Product_Id = p.Product_Id
GROUP BY o.Order_id;

2.)#count the number of orders placed by each customer

SELECT co.cust_id, co.Name, COUNT(o.Order_id) AS Total_Orders
FROM Customer_Orders co
JOIN Orders o ON co.Order_id = o.Order_id
GROUP BY co.Cust_Id, co.Name;


3.)# calculate the total revenue generated by each employee

SELECT e.employee_id,e.employee_name,SUM(p.price*mod2.Quantity_) AS Total_revenue
from Employee e 
join Orders o on e.Employee_ID = o.Employee_Id 
join Menu_Order_Details mod2 on o.Order_id = mod2.Order_id 
join Product p on mod2.Product_Id = p.Product_Id 
GROUP by e.Employee_ID ,e.Employee_Name 

4.)#find the total quantity of each ingredient used in all products

SELECT pi.Ingredient_ID, SUM(pi.Quantity) AS Total_Quantity_Used
FROM Product_Ingredient pi
GROUP BY pi.Ingredient_ID;





library(DBI)
library(RMySQL)
library(dplyr)
library(dbplyr)
library(ggplot2)


con1 <- dbConnect (RMySQL::MySQL(),
host = "dbcourse-sp24.cykbzjtad3ic.us-east-1.rds.amazonaws.com",
user = "student20",                                            # Change this to your User ID
password = rstudioapi::askForPassword("Database password:"),    # Change this to your DB password
 dbname="DBstudent20"
                   
)  

dbListTables(con1)


1.)#calculate the total_order_amount for each order

query_1<- "
SELECT o.Order_id, SUM(p.Price * mod2.Quantity_) AS Total_Order_Amount
FROM Orders o
JOIN Menu_Order_Details mod2 ON o.Order_id = mod2.Order_id
JOIN Product p ON mod2.Product_Id = p.Product_Id
GROUP BY o.Order_id"

x <- dbGetQuery(con1,query_1)

2.)#count the number of orders placed by each customer

query_2<- "
SELECT co.cust_id, co.Name, COUNT(o.Order_id) AS Total_Orders
FROM Customer_Orders co
JOIN Orders o ON co.Order_id = o.Order_id
GROUP BY co.Cust_Id, co.Name"

y <- dbGetQuery(con1,query_2)


3.)# calculate the total revenue generated by each employee

query_3<- "
SELECT e.employee_id,e.employee_name,SUM(p.price*mod2.Quantity_) AS Total_revenue
from Employee e 
join Orders o on e.Employee_ID = o.Employee_Id 
join Menu_Order_Details mod2 on o.Order_id = mod2.Order_id 
join Product p on mod2.Product_Id = p.Product_Id 
GROUP by e.Employee_ID ,e.Employee_Name "

z <- dbGetQuery(con1,query_3)

4.)#find the total quantity of each ingredient used in all products
  
  
  query_4<- "
SELECT pi.Ingredient_ID, SUM(pi.Quantity) AS Total_Quantity_Used
FROM Product_Ingredient pi
GROUP BY pi.Ingredient_ID"
  
  xyz <- dbGetQuery(con1,query_4)
  
  
  #Close all connections.
  dbDisconnect(con1)


6)	Create one (1) VIEW in your DBstudentXX database. Some options for a view can be found below: 
- top 3 products sold,
- products sold in most transactions, 
- days with most sales, etc.
Paste the code for the view below. Provide a description for your VIEW.

#View the top 3 products sold
CREATE view  Order_Summary as
SELECT o.Order_id, COUNT(mod2.Product_Id) AS Total_Products,
       SUM(p.Price * mod2.Quantity_) AS Total_Order_Amount
FROM Orders o
JOIN Menu_Order_Details mod2 ON o.Order_id = mod2.Order_id
JOIN Product p ON mod2.Product_Id = p.Product_Id
GROUP BY o.Order_id;

#View the average order amount
CREATE VIEW Average_Order_Amount AS
SELECT Order_id, AVG(Total_Order_Amount) AS Avg_Order_Amount
FROM Order_Summary
GROUP BY Order_id;

#top customers based on total order amount
CREATE VIEW Top_Customers AS
SELECT co.Cust_Id, SUM(os.Total_Order_Amount) AS Total_Order_Amount
FROM Customer_Orders co
JOIN Order_Summary os ON co.Order_id = os.Order_id
GROUP BY co.Cust_Id,
ORDER BY Total_Order_Amount DESC;



