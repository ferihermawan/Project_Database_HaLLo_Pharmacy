CREATE DATABASE ApotekHaLLo

USE ApotekHaLLo
DROP TABLE [Customer]
CREATE TABLE [Customer](
	CustomerID CHAR(5) PRIMARY KEY CONSTRAINT checks_CustomerID CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(50) NOT NULL,
	CustomerPhoneNumber VARCHAR(50) NOT NULL,
	CustomerAddress VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(10) CONSTRAINT CHK_C_GENDER CHECK (CustomerGender IN ('Laki-laki','Perempuan')) NOT NULL,
	CustomerEmail VARCHAR(50) CHECK (CustomerEmail LIKE '%@hallo.com') NOT NULL,
	CustomerPassword VARCHAR(20) NOT NULL,
	CustomerDOB DATE NOT NULL
)

SELECT * FROM Customer

CREATE TABLE [Employee](
	EmployeeID CHAR(5) PRIMARY KEY CONSTRAINT checks_EmployeeID CHECK (EmployeeID LIKE 'EM[0-9][0-9][0-9]'),
	EmployeeName VARCHAR(50) NOT NULL,
	EmployeeEmail VARCHAR(50) CHECK (EmployeeEmail LIKE '%@hallo.com') NOT NULL,
	EmployeePhoneNumber VARCHAR(50) CONSTRAINT CHK_PHONE_NUMBER CHECK (EmployeePhoneNumber LIKE '08%' AND LEN(EmployeePhoneNumber) BETWEEN 11 AND 12 AND ISNUMERIC(EmployeePhoneNumber) = 1) NOT NULL,
	EmployeeDOB DATE NOT NULL,
	EmployeeGender VARCHAR(10) CONSTRAINT CHK_EmployeeGender CHECK (EmployeeGender IN ('Laki-laki','Perempuan'))NOT NULL,
	EmployeeSalary INT NOT NULL
)

SELECT * FROM Employee

CREATE TABLE [Vendor](
	VendorID CHAR(5) PRIMARY KEY CONSTRAINT checks_VendorID CHECK (VendorID LIKE 'VN[0-9][0-9][0-9]'),
	VendorName VARCHAR(50) CHECK (LEN(VendorName) > 3)NOT NULL,
	VendorPhoneNumber VARCHAR(50) CHECK (VendorPhoneNumber LIKE '08%' AND LEN(VendorPhoneNumber) BETWEEN 11 AND 12 AND ISNUMERIC(VendorPhoneNumber) = 1)NOT NULL,
	VendorAddress VARCHAR(50) NOT NULL,
	VendorEmail VARCHAR(50) CHECK (VendorEmail LIKE '%.com')NOT NULL,
	VendorEstablishedYear VARCHAR(10) NOT NULL 
)

SELECT * FROM Vendor

CREATE TABLE [MedicineType](
	MedicineTypeID CHAR(5) PRIMARY KEY CONSTRAINT checks_MedicineTypeID CHECK (MedicineTypeID LIKE 'CT[0-9][0-9][0-9]'),
	MedicineTypeName VARCHAR(50) CHECK (MedicineTypeName NOT LIKE 'Amidopyrine' AND MedicineTypeName NOT LIKE 'Phenacetin' AND MedicineTypeName NOT LIKE 'Methaqualone') NOT NULL
)

SELECT * FROM MedicineType

CREATE TABLE [Medicine](
	MedicineID CHAR(5) PRIMARY KEY CONSTRAINT checks_MedicineID CHECK (MedicineID LIKE 'MD[0-9][0-9][0-9]'),
	MedicineTypeID CHAR(5) FOREIGN KEY REFERENCES MedicineType(MedicineTypeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	MedicineName VARCHAR(50) NOT NULL,
	MedicinePrice INT CHECK (MedicinePrice BETWEEN 5000 AND 100000) NOT NULL,
	MedicineDescription VARCHAR(255) NOT NULL,
	MedicineStock INT NOT NULL,
)
SELECT * FROM Medicine

CREATE TABLE [SalesTransactionHeader](
	SalesTransactionID CHAR(5) PRIMARY KEY CONSTRAINT checks_SalesTransactionID CHECK (SalesTransactionID LIKE 'SL[0-9][0-9][0-9]'),
	EmployeeID CHAR(5) FOREIGN KEY REFERENCES Employee(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesTransactionDate DATE NOT NULL
)

SELECT * FROM SalesTransactionHeader

CREATE TABLE [PurchaseTransactionHeader](
	PurchaseTransactionID CHAR(5) PRIMARY KEY CONSTRAINT checks_PurchaseTransactionID CHECK (PurchaseTransactionID LIKE 'PC[0-9][0-9][0-9]'),
	EmployeeID CHAR(5) FOREIGN KEY REFERENCES Employee(EmployeeID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseTransactionDate DATE NOT NULL
)

SELECT * FROM PurchaseTransactionHeader

CREATE TABLE [SalesTransactionDetail](
	SalesTransactionID CHAR(5) FOREIGN KEY REFERENCES SalesTransactionHeader(SalesTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	MedicineID CHAR(5) FOREIGN KEY REFERENCES Medicine(MedicineID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	SalesQuantity INT NOT NULL,
	PRIMARY KEY(SalesTransactionID, MedicineID)
)


SELECT * FROM SalesTransactionDetail

CREATE TABLE [PurchaseTransactionDetail](
	PurchaseTransactionID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransactionHeader(PurchaseTransactionID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	MedicineID CHAR(5) FOREIGN KEY REFERENCES Medicine(MedicineID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseQuantity INT NOT NULL,
	PRIMARY KEY(PurchaseTransactionID, MedicineID)
)

SELECT * FROM PurchaseTransactionDetail