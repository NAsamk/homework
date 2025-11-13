--WorldEvents
--1. გამოიტანეთ ევროპაში გამართულ მოვლენების რაოდენობა;
SELECT COUNT(EventName) AS EuropeEventCount
FROM Event
WHERE CountryID IN (
    SELECT CountryID
    FROM Country
    WHERE ContinentID = (
        SELECT ContinentID
        FROM Continent
        WHERE ContinentName = 'Europe'
    )
);

SELECT COUNT(EventName) AS EuropeEventCount
FROM Event
WHERE CountryID IN (
    SELECT CountryID
    FROM Country
    WHERE ContinentID = 3
);


--2. გამოიტანეთ აფრიკაში ყველაზე ადრე გამართული მოვლენის თარიღი;
SELECT MIN(EventDate)
FROM Event
WHERE CountryID IN (
    SELECT CountryID
    FROM Country
    WHERE ContinentID = 2
);
SELECT MIN(EventDate) 
FROM Event
WHERE CountryID IN (
    SELECT CountryID
    FROM Country
    WHERE ContinentID = (
        SELECT ContinentID
        FROM Continent
        WHERE ContinentName = 'Africa'
    )
);

--3. გამოიტანეთ ჩრდილოეთ და სამხრეთ ამერიკაში არსებული ქვეყნების რაოდენობა;
SELECT COUNT(CountryName)
FROM Country
WHERE ContinentID IN (
    SELECT ContinentID
    FROM Continent
    WHERE ContinentName IN ('South America', 'North America')
);
SELECT COUNT(*) 
FROM Country
WHERE ContinentID IN (5,6
);

-- 4. გამოიტანეთ ახალ წელს გამართული ეკონომიკასთან დაკავშირებული მოვლენების რაოდენობა;

SELECT COUNT(*) 
FROM Event
WHERE CategoryID = (
    SELECT CategoryID
    FROM Category
    WHERE CategoryName = 'Economy'
)
AND DAY(EventDate) = 1
AND MONTH(EventDate) = 1;

--5. გამოიტანეთ ევროპაში ყველაზე გვიან გამართული, სპორტის კატეგორიასთან დაკავშირებული მოვლენის თარიღი.
SELECT MAX(EventDate) 
FROM Event
WHERE CountryID IN (
    SELECT CountryID
    FROM Country
    WHERE ContinentID = (
        SELECT ContinentID
        FROM Continent
        WHERE ContinentName = 'Europe'
    )
)
AND CategoryID = (
    SELECT CategoryID
    FROM Category
    WHERE CategoryName = 'Sports'
);
