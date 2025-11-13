--subquery
--Hardware

--1. გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომელთა მწარმოებელი არის Hewlett-Packard;
SELECT Name, Price
FROM Products
WHERE ManufacturerId = (
    SELECT ManufacturerId
    FROM Manufacturers
    WHERE Name = 'Hewlett-Packard'
);

-- 2. გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომლებიც არ უწარმოებია Fujitsu -ს;
SELECT Name, Price
FROM Products
WHERE ManufacturerId <> (
     SELECT ManufacturerId
     FROM Manufacturers
     WHERE Name = 'Fujitsu'
);


-- 3. გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომელთა მწარმოებელი არის Sony, Fujitsu, IBM ან Intel;
SELECT Name, Price
FROM Products
WHERE ManufacturerId IN (
    SELECT ManufacturerId
    FROM Manufacturers
    WHERE Name IN ('Sony', 'Fujitsu', 'IBM', 'Intel')
);

--4. გამოიტანეთ იმ კომპანიების სახელწოდებები, რომლებმაც აწარმოეს 200 -ზე უფრო მაღალი ღირებულების მქონე პროდუქტები;
SELECT Name 
FROM Manufacturers
WHERE ManufacturerId IN(
    SELECT ManufacturerId
    FROM Products
    WHERE Price > 200
);

-- 5. გამოიტანეთ იმ პროდუქტების სახელწოდება და ღირებულება, რომლებსაც არ აწარმოებს Genius და Dell

SELECT Name, Price
FROM Products
WHERE ManufacturerId NOT IN (
    SELECT ManufacturerId
    FROM Manufacturers
    WHERE Name IN ('Genius', 'Dell')
);

-- 6. გამოიტანეთ იმ მწარმოებელთა რაოდენობა, რომლებიც აწარმოებენ drive -ებს
SELECT COUNT(DISTINCT ManufacturerId) AS Quantity
FROM Products
WHERE Name LIKE '%drive%';

-- 7. გამოიტანეთ Intel -ის მიერ წარმოებული იმ პროდუქტების რაოდენობა, რომელთა ფასი აღემატება Intel -ის
-- მიერ წარმოებული პროდუქტების საშუალო ფასს.

SELECT COUNT(Name)
FROM Products
WHERE ManufacturerId = (
    SELECT ManufacturerId
    FROM Manufacturers
    WHERE Name = 'Intel'
)
AND Price > (
    SELECT AVG(Price)
    FROM Products
    WHERE ManufacturerId = (
        SELECT ManufacturerId
        FROM Manufacturers
        WHERE Name = 'Intel'
    )
);

