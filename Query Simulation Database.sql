-- pada suatu hari ada karyawan ApotekHallo yang sedang menjaga toko
-- lalu seorang karyawan kedatangan Vendor Untuk menawari obat yang ia jual
-- karwayan ingin membeli obat kepada vendor  
	
	CREATE VIEW TransactionPurchaseEntry AS
	SELECT EMP.EmployeeID, EMP.EmployeeName, VN.VendorID, VendorName, ME.MedicineName, (SELECT DISTINCT MedicineTypeName FROM MedicineType 
																						WHERE ME.MedicineTypeID = MedicineTypeID) AS [Medicine Category], PTD.PurchaseQuantity, 
																						 CONCAT('Rp.', CAST((ME.MedicinePrice * PTD.PurchaseQuantity) AS VARCHAR) , ',00') AS [Total Price] FROM PurchaseTransactionHeader PTH
	JOIN Employee EMP ON PTH.EmployeeID = EMP.EmployeeID
	JOIN Vendor VN ON PTH.VendorID = VN.VendorID
	JOIN PurchaseTransactionDetail PTD ON PTH.PurchaseTransactionID = PTD.PurchaseTransactionID
	JOIN Medicine ME ON PTD.MedicineID = ME.MedicineID

	SELECT * FROM TransactionPurchaseEntry
	ORDER BY PurchaseQuantity

	CREATE TRIGGER Purchase ON PurchaseTransactionDetail
	FOR INSERT
	AS 
		DECLARE  @Quantity INT, @Purchased_ID CHAR(5), @EMP VARCHAR(50)
		SELECT @Quantity = PurchaseQuantity FROM INSERTED
		SELECT @Purchased_ID = MedicineID FROM INSERTED
		SELECT @EMP = PurchaseTransactionID FROM INSERTED
		IF(@Quantity IS NOT NULL)
		BEGIN
			UPDATE Medicine
			SET MedicineStock += @Quantity
			FROM Medicine ME JOIN PurchaseTransactionDetail PTD ON PTD.MedicineID = ME.MedicineID
			WHERE ME.MedicineID = @Purchased_ID
			---------------
			SELECT  EMP.EmployeeID, EMP.EmployeeName, VN.VendorID, VendorName, ME.MedicineName, (SELECT MedicineTypeName FROM MedicineType 
																						WHERE ME.MedicineTypeID = MedicineTypeID) AS [Medicine Category], PTD.PurchaseQuantity, 
																						(ME.MedicineStock) AS [Medicine Stock] , CONCAT('Rp.', CAST((ME.MedicinePrice * PTD.PurchaseQuantity) AS VARCHAR) , ',00') AS [Total Price] FROM PurchaseTransactionHeader PTH
			JOIN Employee EMP ON PTH.EmployeeID = EMP.EmployeeID
			JOIN Vendor VN ON PTH.VendorID = VN.VendorID
			JOIN PurchaseTransactionDetail PTD ON PTH.PurchaseTransactionID = PTD.PurchaseTransactionID
			JOIN Medicine ME ON PTD.MedicineID = ME.MedicineID
			WHERE @EMP = PTH.PurchaseTransactionID 
		END
	

-- setelah karyawan membeli obat di vendor
-- lalu karyawan menjual kembali ke customer
-- customer membeli obat ke karyawan

	CREATE VIEW TransactionCustomerPurchaseEntry AS
	SELECT EMP.EmployeeID, EMP.EmployeeName, CS.CustomerID, CustomerName, ME.MedicineName, (SELECT DISTINCT MedicineTypeName FROM MedicineType 
																							WHERE ME.MedicineTypeID = MedicineTypeID) AS [Medicine Category], STD.SalesQuantity, 
																							CONCAT('Rp.', CAST((ME.MedicinePrice * STD.SalesQuantity) AS VARCHAR) , ',00') AS [Total Price] FROM SalesTransactionHeader STH
	JOIN Employee EMP ON STH.EmployeeID = EMP.EmployeeID
	JOIN Customer CS ON STH.CustomerID = CS.CustomerID
	JOIN SalesTransactionDetail STD ON STH.SalesTransactionID = STD.SalesTransactionID
	JOIN Medicine ME ON STD.MedicineID = ME.MedicineID

	SELECT * FROM TransactionCustomerPurchaseEntry
	ORDER BY SalesQuantity

	CREATE TRIGGER Sales ON SalesTransactionDetail
	FOR INSERT
	AS 
		DECLARE  @Quantity INT, @Sales_ID CHAR(5), @EMP VARCHAR(50)
		SELECT @Quantity = SalesQuantity FROM INSERTED
		SELECT @Sales_ID = MedicineID FROM INSERTED
		SELECT @EMP = SalesTransactionID FROM INSERTED
		IF(@Quantity IS NOT NULL)
		BEGIN
			UPDATE Medicine
			SET MedicineStock -= @Quantity
			FROM Medicine ME JOIN SalesTransactionDetail STD ON STD.MedicineID = ME.MedicineID
			WHERE ME.MedicineID = @Sales_ID
			---------------
			SELECT EMP.EmployeeID, EMP.EmployeeName, CS.CustomerID, CustomerName, ME.MedicineName, (SELECT DISTINCT MedicineTypeName FROM MedicineType 
																							WHERE ME.MedicineTypeID = MedicineTypeID) AS [Medicine Category], STD.SalesQuantity, 
																							CONCAT('Rp.', CAST((ME.MedicinePrice * STD.SalesQuantity) AS VARCHAR) , ',00') AS [Total Price] FROM SalesTransactionHeader STH
				JOIN Employee EMP ON STH.EmployeeID = EMP.EmployeeID
				JOIN Customer CS ON STH.CustomerID = CS.CustomerID
				JOIN SalesTransactionDetail STD ON STH.SalesTransactionID = STD.SalesTransactionID
				JOIN Medicine ME ON STD.MedicineID = ME.MedicineID
			WHERE @EMP = STH.SalesTransactionID 
		END
		