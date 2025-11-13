SELECT TOP (1000) [StudentsID]
      ,[Lastname]
      ,[Firstname]
      ,[DoB]
      ,[Email]
      ,[Quiz1]
      ,[Quiz2]
      ,[MiddleTest]
      ,[FinalTest]
      ,[Country]
  FROM [Homework17].[dbo].[Students]


SELECT TOP (1000) [PersonsID]
      ,[Lastname]
      ,[Firstname]
      ,[DoB]
      ,[PrivateId]
      ,[Email]
      ,[Phone]
      ,[WorkPlace]
      ,[Country]
      ,[City]
      ,[Salary]
      ,[PINcode]
  FROM [Homework17].[dbo].[Persons]

  -- Students 
  -- 1. გამოიტანეთ ყველა სტუდენტი რომელიც დაიბადა 1990 წლის შემდეგ
SELECT * FROM Students WHERE YEAR(DoB) > 1990;

-- 2. გამოიტანეთ იმ სტუდენთა სახელი გვარი ასაკი(CurrentYear- DoB) რომლებიც არიან საქართველოდან და ლიბიიდან

SELECT Firstname, Lastname,  DATEDIFF(YEAR, DoB, GETDATE()) AS Age FROM Students WHERE Country IN ('Georgia','Libya')

-- 3. დაამატეთ ახალი სტუდენტი მონაცემთა ბაზაში ნებისმიერი მონაცემებით
INSERT INTO Students VALUES('AA','BB','2003-01-01','',1,2,36,4,'AA')

-- 4. გამოიტანეთ TOP 5 შედეგის მქონე სტუდენტის სახელი და ქულა შუალედურზე ([MiddleTest])
--მიღებული ქულის მიხედვით (აჩვენეთ ყველა შესაძლო ვარიანტი მაგ : 1 2 3 4 5 5 თუ მომდევნო ელემენტიც 5 ტოლია შედეგი უნდა იყოს 1,2,3,4,5,5
SELECT TOP 5 WITH TIES FirstName, MiddleTest FROM Students ORDER BY MiddleTest DESC;

-- 5. წაშალეთ ყველა სტუდენტი რომლებმაც ფინალურზე 19 ქულა მიიღეს და შედეგი გამოიტანეთ OUTPUT სახით
DELETE FROM Students OUTPUT DELETED. * WHERE FinalTest = 19

-- 6. განაახლეთ მონაცემები ყველა სტუდენტს რომელსაც შუალედურზე აქვს მიღებული 1 ქულა ფინალურ შეფასებაში ჩაუწერეთ 0
UPDATE Students SET FinalTest = 0 OUTPUT INSERTED.* WHERE MiddleTest = 1


-- Persons
-- 1. გამოიტანეთ სრული მონაცემები იმ პირების შესახებ რომელთა პირადი ნომერი PrivateId იწყება 163
SELECT * FROM Persons WHERE PrivateId LIKE '163%'

-- 2. გამოიტანეთ სრული მონაცემები იმ პირების რომელთა გვარი ემთხვევა იმ ქალაქის სახელწოდებას სადაც ცხოვრობენ
SELECT * FROM Persons WHERE Lastname = City

-- 3. გამოიტანეთ სრული მონაცემები იმ პირების შესახებ რომლებიც ცხოვრობენ კანადაში ან მონაკოში არ გამოიყენოთ ტოლობა და Like ოპერატორი
SELECT * FROM Persons WHERE Country IN('Canada','Monaco')

-- 4. გამოიტანეთ იმ პირების სახელი ,გვარი და პირადი ნომერი რომლებსაც არ აქვთ იმეილი.
SELECT Firstname, Lastname, PrivateId Email FROM Persons WHERE Email IS NULL OR Email = ''

-- 5. გამოიტანეთ სრული მონაცემები იმ პირების შესახებ რომლებიც ცხოვრობენ ესპანეთში ან 
--თურქეთში და ხელფასი არის 1000-3000 დიაპაზონში ( არ გამოიყენოთ მეტობა/ნაკლებობის ნიშნები)
SELECT * FROM Persons WHERE Country IN('Spain','Turkey') AND Salary BETWEEN 1000 AND 3000

-- 6. გამოიტანეთ კომპანიების სახელწოდება რომლებიც შეიცავენ LLC, PC , LLP
SELECT WorkPlace FROM Persons WHERE WorkPlace LIKE '%LLC%' OR WorkPlace LIKE '%PC%' OR WorkPlace LIKE '%LLP%'

-- 7. შეამოწმეთ რამდენი წერტილს შეიცავს მეილი თუ წერტილების რაოდენობა მეტია 2 ზე ახალ
--ველში MAILINFO გამოიტანეთ 'more than 2 dots ' თუ ნაკლები 'less than 2 dots'
SELECT Email, 
       CASE 
         WHEN LEN(Email) - LEN(REPLACE(Email, '.', '')) > 2 THEN 'more than 2 dots'
         WHEN LEN(Email) - LEN(REPLACE(Email, '.', '')) = 2 THEN '2 dots'
         ELSE 'less than 2 dots'
       END AS MAILINFO FROM Persons

-- 8. გამოიტანეთ სრული მონაცემები იმ პირების შესახებ რომელთა პინ კოდიც მთავრდება 51

SELECT * FROM Persons WHERE PINcode LIKE '%51'

-- 9. დააჯგუფეთ ცხრილი ქვეყნების მიხედვით და გამოიტანეს საშუალო ხელფასი ქვეყნების მიხედვით
SELECT Country,
    AVG(Salary) AS AvgSalary
FROM Persons GROUP BY Country
