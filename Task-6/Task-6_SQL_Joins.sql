USE playstoreDB;

-- Level 0
-- 1
SELECT a.AppName,d.DeveloperName FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID;
-- 2
SELECT a.AppName,p.PublisherName FROM Apps a INNER JOIN Publishers p ON a.PublisherID=p.PublisherID;
-- 3
SELECT a.AppName,c.CategoryName FROM Apps a INNER JOIN Categories c ON a.CategoryID=c.CategoryID;
-- 4
SELECT a.AppName,d.DeveloperName,p.PublisherName FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Publishers p ON a.PublisherID=p.PublisherID;
-- 5
SELECT a.AppName,d.DeveloperName,c.CategoryName FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Categories c ON a.CategoryID=c.CategoryID;
-- 6
SELECT p.PublisherName,a.AppName FROM Publishers p LEFT JOIN Apps a ON p.PublisherID=a.PublisherID;
-- 7
SELECT c.CategoryName,a.AppName FROM Categories c LEFT JOIN Apps a ON c.CategoryID=a.CategoryID;

-- Level 1

-- 1
SELECT p.PublisherName,a.AppName FROM Publishers p LEFT JOIN Apps a ON p.PublisherID=a.PublisherID;
-- 2
SELECT a.AppName,p.PublisherName FROM Apps a RIGHT JOIN Publishers p ON a.PublisherID=p.PublisherID;
-- 3
SELECT c.CategoryName,a.AppName FROM Categories c LEFT JOIN Apps a ON c.CategoryID=a.CategoryID;
-- 4
SELECT a.AppName,d.DeveloperName,d.Country FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID; 
-- 5
SELECT a.AppName,d.DeveloperName,p.PublisherName,c.CategoryName FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Publishers p ON a.PublisherID=p.PublisherID INNER JOIN Categories c ON a.CategoryID=c.CategoryID;
-- 6
SELECT a.AppName,d.DeveloperName,d.Country FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID WHERE d.Country='USA'; 
-- 7
SELECT a.AppName,c.CategoryName,p.PublisherName FROM Apps a INNER JOIN Categories c ON a.CategoryID=c.CategoryID INNER JOIN Publishers p ON a.PublisherID=p.PublisherID WHERE c.CategoryName='Gaming';
-- 8
SELECT a.AppName,d.DeveloperName,a.Rating FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID WHERE Rating>4.5;

-- Level 2
-- 1
SELECT p.PublisherName,a.AppName FROM Publishers p LEFT JOIN Apps a ON a.PublisherID=p.PublisherID;
-- 2
SELECT p.PublisherName,a.AppName FROM Publishers p LEFT JOIN Apps a ON a.PublisherID=p.PublisherID;
-- 3
SELECT c.CategoryName,a.AppName FROM Categories c INNER JOIN Apps a ON c.CategoryID=a.CategoryID ORDER BY CategoryName;
-- 4
SELECT a.AppName,d.DeveloperName,p.PublisherName,c.CategoryName,a.Rating FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Publishers p ON a.PublisherID=p.PublisherID INNER JOIN Categories c ON a.CategoryID=c.CategoryID;
-- 5
SELECT a.AppName,d.Country,p.PublisherName FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Publishers p ON a.PublisherID=p.PublisherID WHERE d.Country='USA' AND p.PublisherName='Google Play';
-- 6
SELECT d.DeveloperName,a.AppName FROM Apps a LEFT JOIN Developers d ON a.DeveloperID=d.DeveloperID; 
-- 7
SELECT d1.DeveloperName AS Developer1,d2.DeveloperName AS Developer2,d1.Country FROM Developers d1 JOIN Developers d2 ON d1.Country=d2.Country AND d1.DeveloperID<d2.DeveloperID;
-- 8
SELECT p.PublisherName,c.CategoryName FROM Publishers p CROSS JOIN Categories c;
-- 9
SELECT p.PublisherID,p.PublisherName,a.AppName FROM Publishers p LEFT JOIN Apps a ON p.PublisherID=a.PublisherID UNION SELECT p.PublisherID,p.PublisherName,a.AppName FROM Publishers p RIGHT JOIN Apps a ON p.PublisherID=a.PublisherID;
-- 10
SELECT a.AppName,d.DeveloperName,c.CategoryName FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Categories c ON a.CategoryID=c.CategoryID WHERE c.CategoryName IN('Gaming','Social');
-- 11
SELECT a.AppName,d.DeveloperName,c.CategoryName,a.Rating FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Categories c ON a.CategoryID=c.CategoryID WHERE a.Rating BETWEEN 4.3 AND 4.7;
-- 12
SELECT a.AppName,d.DeveloperName,d.Country FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID WHERE NOT d.Country='India';

-- Optional Practice Queries
-- 1
SELECT d.DeveloperName,d.Country,COUNT(*) AS AppCount,AVG(Rating) FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID GROUP BY d.DeveloperName,d.Country HAVING COUNT(*)>1;
-- 2
SELECT a.AppName,d.DeveloperName,UPPER(Country) FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID WHERE d.Country='USA' GROUP BY a.AppName,d.DeveloperName;
-- 3
SELECT p.PublisherName,COUNT(*) AS AppCount,COUNT(Downloads) AS TotalDownloads FROM Publishers p LEFT JOIN Apps a ON p.PublisherID=a.PublisherID GROUP BY p.PublisherName ORDER BY COUNT(Downloads) DESC;
-- 4
SELECT a.AppName,d.DeveloperName,c.CategoryName,ROUND(Rating) FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID INNER JOIN Categories c ON a.CategoryID=c.CategoryID GROUP BY a.AppName,d.DeveloperName,c.CategoryName;
-- 5
SELECT d.DeveloperName,a.AppName,p.PublisherName,CONVERT(FoundedYear,CHAR) FROM Developers d INNER JOIN Apps a ON d.DeveloperID=a.DeveloperID INNER JOIN Publishers p ON a.PublisherID=p.PublisherID;
-- 6
SELECT c.CategoryID,c.CategoryName,COUNT(*) AS NoOfApplications,AVG(Rating) FROM Categories c INNER JOIN Apps a ON c.CategoryID=a.CategoryID GROUP BY c.CategoryID,c.CategoryName HAVING AVG(Rating)>4.3;
