Use ApotekHaLLo 
go 
--1
SELECT CS.CustomerID AS [Customer Id], CustomerName AS [Customer Name], CONVERT(nvarchar, SalesTransactionDate, 109) AS [Transaction Date], SUM(SalesQuantity) AS [Medicine Bought]
FROM Customer CS
JOIN SalesTransactionHeader STH ON STH.CustomerID = CS.CustomerID
JOIN SalesTransactionDetail STD ON STD.SalesTransactionID = STH.SalesTransactionID
WHERE CustomerGender IN ('Perempuan') AND DAY(SalesTransactionDate) BETWEEN 20 AND 30
GROUP BY CS.CustomerID, CustomerName, SalesTransactionDate

--2

SELECT RIGHT(EMP.EmployeeID, 3) AS [Employee Number], EmployeeName AS [Employee Name], CAST(COUNT(STD.SalesTransactionID) AS VARCHAR(10)) + ' customer' AS [Customer Served]
FROM Employee EMP
JOIN SalesTransactionHeader STH ON STH.EmployeeID = EMP.EmployeeID
JOIN SalesTransactionDetail STD ON STD.SalesTransactionID = STH.SalesTransactionID
WHERE EmployeeName LIKE  ('%b%') AND EmployeeGender IN ('Perempuan')
GROUP BY EMP.EmployeeID, EmployeeName

--3
SELECT CS.CustomerID AS [Customer Id], CustomerName AS [Customer Name], CONVERT(nvarchar, CustomerDOB, 106) AS [Date of Birth],Count(STD.SalesTransactionID) AS [Transaction Count], SUM(SalesQuantity*MedicinePrice)  AS [Total Purchase]
FROM Customer CS
JOIN SalesTransactionHeader STH ON STH.CustomerID = CS.CustomerID
JOIN SalesTransactionDetail STD ON STD.SalesTransactionID = STH.SalesTransactionID
JOIN Medicine M ON M.MedicineID = STD.MedicineID
WHERE EmployeeID IN ('EM004', 'EM006', 'EM008') AND DAY(SalesTransactionDate) BETWEEN 1 AND 6
GROUP BY CS.CustomerID, CustomerName,CustomerDOB

--4
SELECT EMP.EmployeeID AS [Employee Id], EmployeeName AS [Employee Name], REPLACE(EmployeePhoneNumber,'0','62') AS [Local Employee Phone], COUNT(PTD.PurchaseTransactionID) AS [Transaction Done], CAST(SUM(PTD.PurchaseQuantity) AS VARCHAR (10)) + ' item'  AS [Total Medicine Bought]
FROM Employee EMP 
JOIN PurchaseTransactionHeader PTH ON PTH.EmployeeID = EMP.EmployeeID
JOIN PurchaseTransactionDetail PTD ON PTD.PurchaseTransactionID = PTH.PurchaseTransactionID
JOIN Vendor V ON PTH.VendorID = V.VendorID
WHERE VendorEstablishedYear > 2000 AND DAY(PurchaseTransactionDate) BETWEEN 10 AND 20
GROUP BY PTH.PurchaseTransactionID, EMP.EmployeeID, EmployeeName, EmployeePhoneNumber



-- 5
SELECT SUBSTRING(MedicineID,3,LEN(MedicineID)) AS [Medicine ID], UPPER(MedicineName) AS [Medicine Name], MedicineTypeName AS [Category Name], 'Rp. ' + CAST(MedicinePrice AS VARCHAR(50)) AS [Price], MedicineStock AS [Medicine Stock] FROM Medicine M
JOIN MedicineType MT ON MT.MedicineTypeID = M.MedicineTypeID, (SELECT AVG(SalesQuantity) AS AVGS FROM SalesTransactionDetail ) AS X
WHERE MedicinePrice > 50000 AND MedicineStock < X.AVGS

-- 6
SELECT REPLACE(EMP.EmployeeID,'EM','EMPLOYEE') AS [Employee Code], EmployeeName AS [Employee Name],CONVERT(NVARCHAR,SalesTransactionDate,103) as [Transaction Date],MedicineName AS [Medicine Name], MedicinePrice AS [Medicine Price], SalesQuantity FROM Employee EMP
JOIN SalesTransactionHeader STH ON STH.EmployeeID = EMP.EmployeeID
JOIN SalesTransactionDetail STD ON STD.SalesTransactionID = STH.SalesTransactionID
join Medicine M ON M.MedicineID = STD.MedicineID,(SELECT AVG(EmployeeSalary) AS [ALL SALARY] FROM Employee) AS X 
WHERE DAY(SalesTransactionDate) = 2 AND EMP.EmployeeSalary < X.[ALL SALARY]

-- 7
SELECT CS.CustomerID AS [Customer Id], CustomerName AS [Customer Name], REPLACE(CustomerPhoneNumber,'0','62') AS [Local Customer Phone], CONVERT(nvarchar, CustomerDob, 107) AS [Date Of Birth], 'item  ' + CAST(SalesQuantity AS VARCHAR (10)) AS [Medicine Bought] FROM Customer CS
JOIN SalesTransactionHeader STH ON STH.CustomerID = CS.CustomerID
JOIN SalesTransactionDetail STD ON STD.SalesTransactionID = STH.SalesTransactionID, (SELECT AVG(SalesQuantity) AS QNT FROM SalesTransactionDetail) X
WHERE CS.CustomerGender NOT IN ('Laki-laki') AND SalesQuantity > X.QNT

--8
SELECT EMP.EmployeeID AS [Employee ID], (SELECT CASE 
										WHEN (LEN(EmployeeName) - LEN(REPLACE(EmployeeName,' ',''))) >= 1 THEN SUBSTRING(EmployeeName, 1, CHARINDEX(' ',EmployeeName))
										ELSE EmployeeName
									END) AS [Employee Name], CONCAT('Rp. ',EmployeeSalary) as [Salary] , CONVERT(NVARCHAR,EmployeeDOB,107) AS [Date of Birth], COUNT(SalesTransactionID) AS [Transaction Served]
FROM Employee EMP
JOIN SalesTransactionHeader STH ON STH.EmployeeID = EMP.EmployeeID, (SELECT AVG(Y.[TOTAL TR]) AS [TOTAL AVG TR] FROM SalesTransactionHeader,
																			(SELECT EmployeeID, COUNT(*) AS [TOTAL TR] FROM SalesTransactionHeader
																			GROUP BY EmployeeID) Y
																	 ) X
																	 , (SELECT EmployeeID, COUNT(*) AS [TOTAL TR] FROM SalesTransactionHeader 
																		GROUP BY EmployeeID) Z
WHERE EmployeeName LIKE '% %' AND Z.[TOTAL TR] > X.[TOTAL AVG TR] AND EMP.EmployeeID = Z.EmployeeID
GROUP BY EMP.EmployeeID, EmployeeName, EmployeeSalary, EmployeeDOB

SELECT * FROM SalesTransactionHeader

-- 9

CREATE VIEW VendorMaximumQuantityViewer AS
SELECT
Vendor.VendorID AS [Vendor ID],
Vendor.VendorName AS [Vendor Name],
CONCAT(AVG(PurchaseTransactionDetail.PurchaseQuantity),' item(s)') AS [Average Supplied Quantity],
CONCAT(MAX(PurchaseTransactionDetail.PurchaseQuantity),' item(s)') AS [Maximum Supplied Quantity] 
FROM Vendor
JOIN PurchaseTransactionHeader ON
Vendor.VendorID = PurchaseTransactionHeader.VendorID
JOIN PurchaseTransactionDetail ON
PurchaseTransactionHeader.PurchaseTransactionID = PurchaseTransactionDetail.PurchaseTransactionID
WHERE Vendor.VendorName LIKE 'a%'
GROUP BY Vendor.VendorID, Vendor.VendorNAme
HAVING MAX(PurchaseTransactionDetail.PurchaseQuantity) > 5

SELECT * FROM VendorMaximumQuantityViewer

-- 10
CREATE VIEW VendorSupplyViewer AS
SELECT
RIGHT(Vendor.VendorID, 3) AS [Vendor Number],
Vendor.VendorName AS [Vendor Name],
Vendor.VendorAddress AS [VendorAddress],
CONCAT('Rp. ', SUM(Medicine.MedicinePrice * PurchaseTransactionDetail.PurchaseQuantity)) AS [Total Supplied Value],
CONCAT(COUNT(Medicine.MedicineID), ' medicine(s)') AS [Medicine Type Supply]
FROM Vendor
JOIN PurchaseTransactionHeader ON
Vendor.VendorID = PurchaseTransactionHeader.VendorID
JOIN PurchaseTransactionDetail ON
PurchaseTransactionHeader.PurchaseTransactionID = PurchaseTransactionDetail.PurchaseTransactionID
JOIN Medicine ON
PurchaseTransactionDetail.MedicineID = Medicine.MedicineID
GROUP BY Vendor.VendorID, Vendor.VendorName,Vendor.VendorAddress
HAVING
SUM(Medicine.MedicinePrice * PurchaseTransactionDetail.PurchaseQuantity) > 150000
AND COUNT(Medicine.MedicineID) > 2

Select * from VendorSupplyViewer
