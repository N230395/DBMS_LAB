 -- CREATE DATABASE playstoreDB;
 -- Level0
USE playstoreDB;
DROP TABLE Developers;
DROP TABLE Publishers;
DROP TABLE Categories;
DROP TABLE Apps;

CREATE TABLE Developers
(
DeveloperID INT PRIMARY KEY,
DeveloperName VARCHAR(60) Not Null,
Country VARCHAR(30) ,
FoundedYear INT
);

CREATE TABLE Publishers
(
PublisherID INT PRIMARY KEY,
PublisherName VARCHAR(60),
HeadOffice VARCHAR(30) ,
SupportEmail VARCHAR(60)
);

CREATE TABLE Categories
(
CategoryID INT Primary Key,
CategoryName VARCHAR(40),
MinimumAge INT
);

CREATE TABLE Apps
(
AppID INT Primary Key,
AppName VARCHAR(60),
DeveloperID INT,
PublisherID INT,
CategoryID INT,
Rating DECIMAL(2,1),
Downloads BIGINT,
Price DECIMAL(6,2)
);

INSERT INTO Developers values
(101,'Google LLC','USA',1998),
(102,'Meta platforms','USA',2004),
(103,'Spotify AB','Sweden',2006),
(104,'Canva pty Ltd','Australia',2012),
(105,"BYJU'S",'India',2011);

INSERT INTO Publishers VALUES
(201,'Google Play','California','support@google.com'),
(202,'Samsung Galaxy Store','Seoul','support@samsung.com'),
(203,'Huawei AppGallery','Shenzhen','support@huawei.com'),
(204,'Amazon Appstore','Seattle','support@amazon.com');

INSERT INTO Categories VALUES
(301,'Education',3),
(302,'Productivity',3),
(303,'Music',12),
(304,'Social',13),
(305,'Gaming',16);

INSERT INTO Apps VALUES
(1001,'Google Classroom',101,201,301,4.6,500000000,0),
(1002,'Google Keep',101,201,302,4.5,1000000000,0),
(1003,'Instagram',102,201,304,4.4,5000000000,0),
(1004,'Spotify',103,201,303,4.5,1000000000,0),
(1005,'Canva',104,201,303,4.5,500000000,0),
(1006,"BYJU'S Learning",105,201,301,4.3,100000000,299),
(1007,'Candy Crush',102,204,305,4.6,1000000000,0),
(1008,'Temple Run',104,203,305,4.2,500000000,0);

SELECT *FROM Developers;
SELECT *FROM Publishers;
SELECT *FROM Categories;
SELECT *FROM Apps;
DESC Apps;

-- Level 1;
INSERT INTO Developers VALUES
(106,"Open AI",'USA',2015);
SELECT *FROM Developers;

INSERT INTO Categories VALUES
(306,'Artificial Intelligence',12);
SELECT *FROM Categories;

INSERT INTO Apps VALUES
(1009,"ChatGPT",102,204,303,4.5,100000000,0);
SELECT *FROM Apps;

UPDATE Apps 
SET Rating=4.5 
WHERE AppID=1008 AND AppName="Temple Run";
SELECT *FROM Apps;

DELETE FROM Developers
WHERE DeveloperID=105;
SELECT *FROM Developers;

-- Level 2;

UPDATE Publishers
SET SupportEmail="samsung@gmail.com"
WHERE PublisherID=202;
SELECT *FROM Publishers;

INSERT INTO Apps VALUES
(1010,"WhatsApp",104,203,305,4.7,1000000000,0),
(1011,"SnapChat",103,204,302,4.1,900000000,0);
SELECT *FROM Apps;

UPDATE Apps
SET Price=199
WHERE AppID=1006 AND AppName="BYJU'S Learning";
SELECT *FROM Apps;

DELETE FROM Categories
WHERE CategoryID=303 AND CAtegoryName="Music";
SELECT *FROM Categories;

SELECT *FROM Developers;
SELECT *FROM Publishers;
SELECT *FROM Categories;
SELECT *FROM Apps;
