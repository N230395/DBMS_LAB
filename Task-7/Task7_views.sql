USE playstoreDB;
SHOW TABLES;
SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;

-- Level 1
-- 1
CREATE VIEW Apps_Details_View AS SELECT * FROM Apps;
SELECT * FROM Apps_Details_View;
-- 2
CREATE VIEW Apps_Details_View1 AS SELECT AppID,AppName,Rating,Price FROM Apps;
SELECT * FROM Apps_Details_View1;
-- 3
CREATE VIEW Highly_Rated_Apps_View AS SELECT AppID,AppName,Rating FROM Apps WHERE Rating>=4.5;
SELECT * FROM Highly_Rated_Apps_View;
-- 4
DROP VIEW Apps_View;
CREATE VIEW Apps_View AS SELECT AppID,AppName,Price FROM Apps WHERE Price=0;
SELECT * FROM Apps_View;
-- 5
SELECT * FROM Highly_Rated_Apps_View;
-- 6
SHOW FULL TABLES WHERE Table_type='VIEW';

-- Level 2
-- 1
CREATE VIEW Join_View AS SELECT a.AppName,d.DeveloperName FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID;
SELECT * FROM Join_View;
-- 2
CREATE VIEW Join_View1 AS SELECT a.AppName,p.PublisherName FROM Apps a INNER JOIN Publishers p ON a.PublisherID=p.PublisherID;
SELECT * FROM Join_View1;
-- 3
CREATE VIEW Join_View2 AS SELECT a.AppName,c.CategoryName FROM Apps a INNER JOIN Categories c ON a.CategoryID=c.CategoryID;
SELECT * FROM Join_View2;
-- 4
CREATE VIEW Join_View3 AS SELECT a.AppName,d.DeveloperName,d.Country FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID;
SELECT * FROM Join_View3;
-- 5
CREATE VIEW Category_App_Count AS SELECT CategoryID,COUNT(*) AS Total_Applications FROM Apps GROUP BY CategoryID;
SELECT * FROM Category_App_Count;
-- 6
CREATE VIEW Total_Apps_IN_Developers_View AS SELECT DeveloperID,COUNT(*) AS Total_Applications FROM Apps GROUP BY DeveloperID;
SELECT * FROM Total_Apps_IN_Developers_View;
-- 7
CREATE VIEW Categories_AvgRating_View AS SELECT CategoryID,AVG(Rating) AS AverageRating FROM Apps GROUP BY CategoryID;
SELECT * FROM Categories_AvgRating_View;
-- 8
CREATE VIEW Join_View4 AS SELECT a.AppName,d.DeveloperName,a.Rating FROM Apps a INNER JOIN Developers d ON a.DeveloperID=d.DeveloperID WHERE a.Rating>4.3;
SELECT * FROM Join_View4;
-- 9
SELECT * FROM Category_App_Count;

-- 10
SHOW CREATE VIEW Join_View4;


-- Level 3

-- 1
CREATE VIEW Categories_View AS SELECT c.CategoryID,c.CategoryName,COUNT(*) AS TotalApps FROM Apps a INNER JOIN Categories c ON a.CategoryID=c.CategoryID GROUP BY CategoryID;
SELECT * FROM Categories_View;
-- 2
CREATE VIEW Dev_Apps_Count AS SELECT DeveloperID,COUNT(*) AS ApplicationsCount FROM Apps GROUP BY DeveloperID HAVING COUNT(*)>1;
SELECT * FROM Dev_Apps_Count;
-- 3
DROP VIEW Max_Min_Rating_Categories;
CREATE VIEW Max_Min_Rating_Categories AS SELECT c.CategoryID,MAX(Rating),MIN(Rating) FROM Apps a INNER JOIN Categories c ON a.CategoryID=c.CategoryID GROUP BY c.CategoryID;
SELECT * FROM Max_Min_Rating_Categories; 