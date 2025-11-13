SELECT * FROM [dbo].[Nums]
SELECT * FROM [HR].[Employees]
SELECT * FROM [Production].[Categories]
SELECT * FROM [Production].[Products]
SELECT * FROM [Production].[Suppliers]
SELECT * FROM [Sales].[Customers]
SELECT * FROM [Sales].[OrderDetails]
SELECT * FROM [Sales].[Orders]
SELECT * FROM [Sales].[Shippers]
SELECT * FROM [Stats].[Scores]
SELECT * FROM [Stats].[Tests]


-- 1. გამოიტანეთ ლონდონელი და მადრიდელი კლიენტების გვარი, სახელი, ქალაქი და შეკვეთების თარიღები;
SELECT 
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 1)) AS FirstName,
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 2)) AS LastName,
    c.City,
    o.OrderDate
FROM Sales.Customers AS c
JOIN Sales.Orders AS o
    ON c.custid = o.custid
WHERE c.City IN ('London', 'Madrid');


-- 2. გამოიტანეთ იმ პროდუქტების სახელწოდება ზედა რეგისტრში, ფასი და კატეგორია, რომელთა ფასი 20-დან 40-მდეა;
SELECT 
    UPPER(p.productname) AS ProductName,
    p.unitprice,
    c.categoryname
FROM Production.Products AS p
JOIN Production.Categories AS c
    ON p.categoryid = c.categoryid
WHERE p.unitprice BETWEEN 20 AND 40;

-- 3. გამოიტანეთ გაყიდვების მენეჯერების გვარი, სახელი და შეკვეთების იდენტიფიკატორი (orderid),
--რომელსაც Sales Manager მოემსახურნენ. გამოიტანეთ მხოლოდ 50 -ზე მეტი წონის შეკვეთები;

SELECT
    e.lastname AS LastName,
    e.firstname AS FirstName,
    o.orderid AS OrderID
FROM HR.Employees AS e
JOIN Sales.Orders AS o
    ON e.empid = o.empid
JOIN Sales.Customers AS s
    ON o.custid = s.custid
WHERE e.title = 'Sales Manager' AND s.contacttitle = 'Sales Manager' AND o.freight > 50

-- 4. გამოიტანეთ შეკვეთის თარიღი, კლიენტის გვარი, სახელი, ქალაქი და მისამართი იმ შეკვეთებისათვის,
-- რომლებიც გაკეთდა 2007 წელს ამერიკული კომპანიის მიერ;

SELECT
    CONVERT(date, o.orderdate),
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 2)) AS LastName,
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 1)) AS FirstName,
    c.city,
    c.address
FROM Sales.Orders AS o
JOIN Sales.Customers AS c
    ON o.custid = c.custid
WHERE YEAR(o.orderdate) = 2007 AND c.country = 'USA'

-- 5. გამოიტანეთ იმ ქალაქების სახელები, სადაც მოხდა კომპანიის თანამშრომელ Cameron -ის მიღებული
-- შეკვეთების ტრანსპორტირება. მიღებულ ვირტუალურ ცხრილში ქალაქების სახელები არ განმეორდეს;

SELECT DISTINCT 
    o.shipcity,
    e.lastname
FROM Sales.Orders AS o
JOIN HR.Employees AS e
    ON o.empid = e.empid
WHERE e.lastname = 'Cameron'

-- 6. გამოიტანეთ გადამზიდავი კომპანიების მიერ გერმანიაში და ავსტრიაში ტრანსპორტირებული
--შეკვეთების id (orderid), ასევე ქვეყანა და ქალაქი, სადაც მოხდა შეკვეთის ტრანსპორტირება;
SELECT
    o.orderid AS OrderID,
    o.shipcountry,
    o.shipcity
FROM Sales.Orders AS o
JOIN  Sales.Shippers AS s
    ON o.shipperid = s.shipperid
WHERE o.shipcountry IN ('Germany', 'Austria');

SELECT
    o.orderid AS OrderID,
    o.shipcountry,
    o.shipcity
FROM Sales.Orders AS o
WHERE o.shipcountry IN ('Germany', 'Austria');

-- 7. გამოიტანეთ სრული მონაცემები ტოკიოდან (Tokyo) მოწოდებული იმ პროდუქტების შესახებ,
--რომლებზეც მოქმედებს ფასდაკლება;

SELECT
    p.*
FROM Production.Products AS p
JOIN Production.Suppliers AS s
    ON p.supplierid = s.supplierid
WHERE s.city = 'Tokyo' AND p.discontinued > 0;

-- 8. გამოიტანეთ იაპონიიდან მოწოდებული ზღვის პროდუქტების და სასმელების დასახელებები
-- კატეგორიის სახელწოდებებთან ერთად;
SELECT 
    p.productname,
    c.categoryname
FROM Production.Products AS p
JOIN Production.Suppliers AS s
    ON  p.supplierid = s.supplierid
JOIN Production.Categories as c
    ON p.categoryid = c.categoryid
WHERE s.country = 'Japan'
  AND c.categoryname IN ('Seafood', 'Beverages');

-- 9. გამოიტანეთ კომპანიის თანამშრომლების სახელი და გვარი და გადამზიდავი კომპანიების
--სახელწოდებები, რომლებმაც 2007 წელს გადაზიდეს შეკვეთები, რომლებსაც მოემსახურნენ სარა დევისი
--(Sara Davis) და მარია ქემერონი (Maria Cameron);
SELECT
    e.firstname,
    e.lastname,
    s.companyname
FROM HR.Employees as e
JOIN Sales.Orders AS o
    ON  e.empid = o.empid
JOIN Sales.Shippers AS s
    ON o.shipperid = s.shipperid
WHERE YEAR(o.shippeddate) = 2007 
AND (e.FirstName + ' ' + e.LastName IN ('Sara Davis', 'Maria Cameron'));

SELECT DISTINCT 
    e.firstname,
    e.lastname,
    s.companyname
FROM HR.Employees as es
JOIN Sales.Orders AS o
    ON  e.empid = o.empid
JOIN Sales.Shippers AS s
    ON o.shipperid = s.shipperid
WHERE YEAR(o.shippeddate) = 2007 
AND CONCAT(trim(e.firstname),trim(e.lastname)) IN ('SaraDavis', 'MariaCameron');

--10. გამოიტანეთ ამერიკელი მწარმოებლების მიერ წარმოებული იმ პროდუქტების სახელწოდებები და
--კატეგორიები, რომლებიც არ მიეკუთვნება ზღვის პროდუქტების და წვენების კატეგორიას;
SELECT
    p.productname,
    c.categoryname
FROM Production.Suppliers AS s
JOIN Production.Products AS p
    ON s.supplierid = p.supplierid
JOIN Production.Categories AS c
    ON p.categoryid = c.categoryid
WHERE s.country = 'USA' 
AND c.categoryname  NOT IN ('Seafood', 'Juices');

-- 11. გამოიტანეთ შეკვეთის ნომერი, კომპანიის თანამშრომლის გვარი, სახელი და საცხოვრებელი ქალაქი,
--კლიენტის სახელი და გვარი იმ შეკვეთებისათვის, რომლის კლიენტი და კომპანიის თანამშრომელი
-- ცხოვრობენ ერთ ქალაქში;

SELECT 
    o.orderid,
    e.lastname AS E_LastName,
    e.FirstName AS E_FirstName,
    e.City AS EmployeeCity,
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 1)) AS C_FirstName,
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 2)) AS C_LastName
FROM Sales.Orders AS o
JOIN HR.Employees AS e
    ON o.empid = e.empid
JOIN Sales.Customers AS c
    ON o.custid= c.custid
WHERE e.city = c.city


--12. გამოიტანეთ იმ კლიენტების სახელი და გვარი, რომლებმაც შეუკვეთეს სასმელები (Beverages) ან რძის
--პროდუქტები (Dairy Products). ერთი და იგივე კლიენტის სახელი და გვარი გამოიტანეთ მხოლოდ
--ერთხელ.

SELECT DISTINCT
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 1)) AS FirstName,
    TRIM(PARSENAME(REPLACE(c.ContactName, ',', '.'), 2)) AS LastName
FROM Sales.Customers AS c
JOIN Sales.Orders AS o
    ON c.custid = o.custid
JOIN Sales.OrderDetails AS od
    ON o.orderid = od.orderid
JOIN Production.Products AS p
    ON od.productid = p.productid
JOIN Production.Categories AS cat
    ON p.categoryid = cat.categoryid
WHERE cat.categoryname IN ('Beverages', 'Dairy Products');
