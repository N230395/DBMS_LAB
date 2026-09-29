USE PlayStoreDB;
-- Level 0
-- 1
SET SQL_SAFE_UPDATES=0;
SELECT AppName,Rating FROM Apps;
UPDATE Apps SET Rating=4.9 WHERE AppName="Google Keep";
COMMIT;
SELECT AppName,Rating FROM Apps;
-- 2
SET AUTOCOMMIT=0;
SELECT AppName,Price FROM Apps;
UPDATE Apps SET Price=550 WHERE AppName="BYJU'S Learning";
ROLLBACK;
SELECT AppName,Price FROM Apps;
-- 3
SELECT * FROM Apps;
INSERT INTO Apps VALUES
(1012,'YouTube',101,202,304,4.8,5500000000,200);
SELECT * FROM Apps;
COMMIT;
SELECT * FROM Apps;
-- 4
SELECT * FROM Developers;
INSERT INTO Developers VALUES
(107,'Samsung','Korea',2000);
SELECT * FROM Developers;
ROLLBACK;
SELECT * FROM Developers;
-- 5
SELECT AppName,Rating FROM Apps;
UPDATE Apps SET Rating=4.6 WHERE AppName='SnapChat';
SELECT AppName,Rating FROM Apps;
SAVEPOINT S1;

-- Level 1
-- 1
UPDATE Apps SET Rating=4.7 WHERE AppName='Instagram';
SAVEPOINT S2;
UPDATE Apps SET Rating=4.6 WHERE AppName='Temple Run';
SELECT AppName,Rating FROM Apps;
-- 2
SAVEPOINT S3;
UPDATE Apps SET Rating=4.2 WHERE AppName='Spotify';
SELECT AppName,Rating FROM Apps;
ROLLBACK TO SAVEPOINT S3;
SELECT AppName,Rating FROM Apps;
-- 3
SELECT * FROM Apps;
INSERT INTO Apps VALUES
(1013,'Netflix',102,203,304,4.5,2000000000,500);
SAVEPOINT S4;
UPDATE Apps SET Price=250.0 WHERE AppName='Netflix';
SELECT * FROM Apps;
ROLLBACK TO SAVEPOINT S4;
SELECT * FROM Apps WHERE AppName='Netflix';
-- 4
CREATE USER 'jashu'@'localhost' IDENTIFIED BY 'jashrini';
GRANT SELECT ON Apps TO 'jashu'@'localhost';
SHOW GRANTS FOR 'jashu'@'localhost';
-- 5
GRANT SELECT,INSERT ON Apps TO 'jashu'@'localhost';
SHOW GRANTS FOR 'jashu'@'localhost';
-- 6
REVOKE INSERT ON Apps FROM 'jashu'@'localhost';
SHOW GRANTS FOR 'jashu'@'localhost';

-- Level 2
-- 1
SAVEPOINT S5;
UPDATE Apps SET Price=100.0 WHERE AppName='Canva';
UPDATE Apps SET CategoryID=302 WHERE AppName='Spotify';
SELECT * FROM Apps;
ROLLBACK TO SAVEPOINT S5;
SELECT * FROM Apps;
-- 2
SELECT * FROM Categories;
INSERT INTO Categories VALUES
(303,'Vocal',10),
(307,'Dance',4);
SELECT * FROM Categories;
SAVEPOINT S6;
ROLLBACK TO SAVEPOINT S6;
SELECT * FROM Categories;
-- 3
GRANT SELECT,INSERT,UPDATE ON Apps TO 'jashu'@'localhost';
SHOW GRANTS FOR 'jashu'@'localhost';
-- 4
REVOKE UPDATE ON Apps FROM 'jashu'@'localhost';
SHOW GRANTS FOR 'jashu'@'localhost';
-- 5
GRANT SELECT ON Developers TO 'jashu'@'localhost';
SHOW GRANTS FOR 'jashu'@'localhost';
REVOKE SELECT ON Developers FROM 'jashu'@'localhost';
SHOW GRANTS FOR 'jashu'@'localhost';
-- 6
START TRANSACTION;
INSERT INTO Categories VALUES
(308,'Software',21);
UPDATE Categories SET MinimumAge=15 WHERE CategoryID=306;
DELETE FROM Categories WHERE CategoryID=308;
SELECT * FROM Categories;
COMMIT;
SELECT * FROM Categories;
-- 7
SELECT * FROM Apps;
UPDATE Apps SET Price=150.0 WHERE AppName='Spotify';
COMMIT;
SELECT * FROM Apps WHERE AppName='Spotify';
UPDATE Apps SET Rating=4.0 WHERE AppName='Google classroom';
SELECT * FROM Apps WHERE AppName='Google classroom';
ROLLBACK;
SELECT * FROM Apps WHERE AppName='Google classroom';
