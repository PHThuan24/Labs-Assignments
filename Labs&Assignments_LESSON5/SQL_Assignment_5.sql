USE adventureworks;
-- Exercise 1: Subquery
-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name
-- của ProductSubcategory là 'Saddles'.
-- Hướng dẫn:
-- Sử dụng Sub Query để lấy ra tất cả các ID của ProductSubcategory có name = 'Saddles'.
-- Sau đó trong outer query, sử dụng kết quả từ Sub Query để lấy ra yêu cầu của đề bài.

SELECT * FROM 

SHOW CREATE TABLE ProductSubcategory;
SHOW CREATE TABLE ProductCategory;

'CREATE TABLE `productcategory` (
  `ProductCategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3'

'CREATE TABLE `productsubcategory` (
  `ProductSubcategoryID` int NOT NULL AUTO_INCREMENT,
  `ProductCategoryID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `rowguid` varbinary(16) NOT NULL,
  `ModifiedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ProductSubcategoryID`),
  KEY `my_fk_38` (`ProductCategoryID`),
  CONSTRAINT `my_fk_38` FOREIGN KEY (`ProductCategoryID`) REFERENCES `productcategory` (`ProductCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3'

SELECT ProductSubcategoryID FROM ProductSubcategory
WHERE name = 'Saddles';

SELECT name FROM productcategory
WHERE ProductCategoryID = (
	SELECT ProductSubcategoryID FROM ProductSubcategory
	WHERE name = 'Saddles'
)

SELECT * FROM Product P
INNER JOIN ProductSubcategory PS ON P.ProductID = PS.
