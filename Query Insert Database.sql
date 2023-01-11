USE ApotekHaLLo
GO

ALTER TABLE Employee
ADD CONSTRAINT CHK_PHONE_NUMBER CHECK (EmployeePhoneNumber LIKE '08%' AND LEN(EmployeePhoneNumber) BETWEEN 11 AND 12 AND ISNUMERIC(EmployeePhoneNumber) = 1)

ALTER TABLE Employee
DROP CONSTRAINT CHK_PHONE_NUMBER 

INSERT INTO Customer VALUES 
('CU001', 'ANDI','0834561231', 'Jalan Kemerdekaan', 'Laki-laki','Andi@hallo.com','1234pass','2001-12-02'),
('CU002', 'TONO','0809374923', 'Jalan Kecamatan', 'Laki-laki','TONO@hallo.com','4321pass','2001-12-03'),
('CU003', 'MARIA','0812314122', 'Jalan Ciliwung', 'Perempuan','MARIA@hallo.com','1243pass','2001-12-04'),
('CU004', 'CHRIS','08324234212', 'Jalan Pesanggrahan', 'Laki-laki','CHRIS@hallo.com','1342pass','2001-12-04'),
('CU005', 'ASEP','08936324122', 'Jalan Aria', 'Laki-laki','ASEP@hallo.com','1122pass','2001-12-04'),
('CU006', 'UJANG','08957812312', 'Jalan Kemanggisan', 'Laki-laki','UJANG@hallo.com','1334pass','2001-12-04'),
('CU007', 'ASEP PARALON','08347532341', 'Jalan Alam Sutra', 'Laki-laki','ASEP PARALON@hallo.com','1255pass','2001-12-05'),
('CU008', 'RUBEN','08111333222', 'Jalan Kesenjangan', 'Laki-laki','RUBEN@hallo.com','1454pass','2001-12-05'),
('CU009', 'KEN','08999777882', 'Jalan Melati', 'Laki-laki','KEN@hallo.com','1765pass','2001-12-05'),
('CU010', 'INDI','082223334442', 'Jalan Mawar', 'Laki-laki','INDI@hallo.com','1291pass','2001-12-05'),
('CU011', 'VINCENT','08112341213', 'Jalan Anggrek', 'Laki-laki','VINCENT@hallo.com','1933pass','2001-12-05'),
('CU012', 'MARCEL','08102311232', 'Jalan Ciputra', 'Laki-laki','MARCEL@hallo.com','1891pass','2001-12-12'),
('CU013', 'ANDREW','08987000012', 'Jalan Mangga', 'Laki-laki','ANDREW@hallo.com','1902pass','2001-12-12'),
('CU014', 'ANDRE','08672300001', 'Jalan Dukuh Atas', 'Laki-laki','ANDRE@hallo.com','4610pass','2001-12-12'),
('CU015', 'JOJO','08124512309', 'Jalan Dukuh Bawah', 'Laki-laki','JOJO@hallo.com','1214pass','2001-12-12'), 
('CU016', 'JAJA','08135312309', 'Jalan Putra', 'Perempuan','JAJA@hallo.com','1214pass','2001-11-12')
GO

SELECT * FROM Customer
INSERT INTO Employee VALUES
('EM001', 'DIDO', 'DIDO@hallo.com','089914121419','2000-01-02','Laki-laki','5000000'),
('EM002', 'DIDI', 'DIDI@hallo.com','089914121233','1999-03-23','Laki-laki','5500000'),
('EM003', 'DEDI', 'DEDI@hallo.com','089914122319','1990-04-12','Laki-laki','6000000'),
('EM004', 'DODO', 'DODO@hallo.com','089234121419','1998-03-10','Laki-laki','4000000'),
('EM005', 'DIKI', 'DIKI@hallo.com','089914123419','1998-02-20','Laki-laki','4500000'),
('EM006', 'TINIDA', 'TINIDA@hallo.com','089914235419','1998-02-22','Perempuan','4000000'),
('EM007', 'PUTRI', 'PUTRI@hallo.com','089914123519','1995-01-10','Perempuan','5200000'),
('EM008', 'HANA', 'HANA@hallo.com','089911221419','1999-11-02','Perempuan','5500000'),
('EM009', 'SHEILA', 'SHEILA@hallo.com','089244121419','1999-09-13','Perempuan','6000000'),
('EM010', 'ANDINI', 'ANDINI@hallo.com','089912421419','1997-10-22','Perempuan','4300000'),
('EM011', 'SHERLY', 'SHERLY@hallo.com','089914241419','1996-11-20','Perempuan','5000000'),
('EM012', 'LISKA', 'LISKA@hallo.com','089876121419','2000-12-02','Perempuan','5000000'),
('EM013', 'ADINDA', 'ADINDA@hallo.com','089987901419','2000-11-15','Perempuan','6100000'),
('EM014', 'ALMEIRA', 'ALMEIRA@hallo.com','082345121419','2000-06-17','Perempuan','5200000'),
('EM015', 'ALMIRA', 'ALMIRA@hallo.com','081754871419','2000-08-25','Perempuan','5400000'),
('EM016', 'ANISA', 'ANISA@hallo.com','085216485236','2000-05-21','Perempuan','5700000')
GO

SELECT * FROM Employee

INSERT INTO Vendor VALUES
('VN001','ASLAB','08912412413','Jalan Pisang Panjang','Aslab@vendor.com','2015'),
('VN002','ASLIB','08131412413','Jalan Pisang I','Aslib@vendor.com','2015'),
('VN003','MAMAS','08145412413','Jalan Pisang II','Mamas@vendor.com','2014'),
('VN004','MAMIDA','08867124131','Jalan Pisang III','Mamida@vendor.com','2012'),
('VN005','KAKEKI','08141124132','Jalan Bambo Panjang','Kakeki@vendor.com','2013'),
('VN006','BELLA','08152412413','Jalan Saritem II','Bella@vendor.com','2016'),
('VN007','NATASYA','08891412413','Jalan Panjang','Natasya@vendor.com','2017'),
('VN008','AGUNG','08136412413','Jalan Pendek','Agung@vendor.com','2016'),
('VN009','ALASKA','08198412413','Jalan Sejahtera','Alaska@vendor.com','2017'),
('VN010','AZKA','08213412413','Jalan Avenue','Azka@vendor.com','2016'),
('VN011','ZASKIA','08212412413','Jalan Central Park','Zaskia@vendor.com','2014'),
('VN012','ZAZA','08312412413','Jalan Cibubur','Zaza@vendor.com','2014'),
('VN013','ELANG','08453412413','Jalan Taman Bunga','ELang@vendor.com','2015'),
('VN014','SUMANTO','08912412413','Jalan One Bell Park','Sumanto@vendor.com','2017'),
('VN015','KUSNAEDI','08912412413','Jalan PIK II','Kusnaedi@vendor.com','2017'),
('VN016','INNA','08912412413','Jalan Dilan I','Inna@vendor.com','2018')
GO

SELECT * FROM Vendor

INSERT INTO MedicineType VALUES
('CT001','Pulvis'),
('CT002','Pil'),
('CT003','Pil'),
('CT004','Pil'),
('CT005','Capsule'),
('CT006','Capsule'),
('CT007','Guttae'),
('CT008','Pil'),
('CT009','Pulvis'),
('CT010','Pulveres'),
('CT011','Pulveres'),
('CT012','Pulveres'),
('CT013','Tablet'),
('CT014','Tablet'),
('CT015','Tablet'),
('CT016','Tablet')

SELECT * FROM MedicineType

INSERT INTO Medicine VALUES
('MD001','CT001','Obat Puyer','5000','Obat Sakit Perut','20'),
('MD002','CT002','Vitamin A','60000','Suplemen Menjaga kesehatan Mata','20'),
('MD003','CT003','Vitamin E','85000','Suplemen Melindungi Sel-Sel Tubuh ','20'),
('MD004','CT004','Zink','79000','Suplemen Menjaga Kekebalan Tubuh','20'),
('MD005','CT005','Obat Diabetes','99000','Obat Penurun Diabetes','20'),
('MD006','CT006','Vitamin D','90000','Suplemen Mencegah Kerapuhan','20'),
('MD007','CT007','Obat Mata','25000','Obat Sakit Mata','20'),
('MD008','CT008','Vitamin C','50000','Suplemen Menjaga Kesehatan Tubuh','20'),
('MD009','CT009','Trolit','80000','Mengembalikan Cairan Tubuh Yang Hilang','20'),
('MD010','CT010','Obat Puyer Pegal-Pegal','8000','Obat Sakit Pegal-Pegal','20'),
('MD011','CT011','Obat Puyer Sakit Kepala','6000','Obat Sakit Kepala','20'),
('MD012','CT012','Obat Puyer Bintang 7','5000','Obat Sakit Perut','20'),
('MD013','CT013','Promaag','10000','Obat Pereda Sakit Maag','20'),
('MD014','CT014','Panadol','5500','Obat Pereda Sakit Sakit Deman','20'),
('MD015','CT015','Paramex','6000','Obat Sakit Kepala','20'),
('MD016','CT016','Bodrex','5000','Obat Sakit Kepala','20')

SELECT * FROM Medicine

INSERT INTO SalesTransactionHeader VALUES
('SL001','EM001','CU001','2020-12-01'),
('SL002','EM002','CU002','2020-11-01'),
('SL003','EM003','CU003','2020-12-02'),
('SL004','EM004','CU004','2020-12-01'),
('SL005','EM005','CU005','2020-12-01'),
('SL006','EM006','CU006','2020-11-02'),
('SL007','EM007','CU007','2020-11-02'),
('SL008','EM008','CU008','2020-11-02'),
('SL009','EM009','CU009','2020-11-04'),
('SL010','EM010','CU010','2020-11-04'),
('SL011','EM011','CU011','2020-11-14'),
('SL012','EM012','CU012','2020-12-13'),
('SL013','EM013','CU013','2020-12-15'),
('SL014','EM014','CU014','2020-12-17'),
('SL015','EM015','CU015','2020-12-20'),
('SL016','EM016','CU016','2020-12-22')

SELECT * FROM SalesTransactionHeader

INSERT INTO PurchaseTransactionHeader VALUES
('PC001','EM001','VN001','2020-12-01'),
('PC002','EM002','VN002','2020-11-01'),
('PC003','EM003','VN003','2020-12-02'),
('PC004','EM004','VN004','2020-12-01'),
('PC005','EM005','VN005','2020-12-01'),
('PC006','EM006','VN006','2020-11-02'),
('PC007','EM007','VN007','2020-11-04'),
('PC008','EM008','VN008','2020-11-02'),
('PC009','EM009','VN009','2020-11-04'),
('PC010','EM010','VN010','2020-11-04'),
('PC011','EM011','VN011','2020-11-14'),
('PC012','EM012','VN012','2020-12-13'),
('PC013','EM013','VN013','2020-12-15'),
('PC014','EM014','VN014','2020-12-17'),
('PC015','EM015','VN015','2020-12-20'),
('PC016','EM016','VN016','2020-12-22'),
('PC016','EM016','VN016','2020-12-22')


BEGIN TRAN
DELETE PurchaseTransactionHeader

INSERT INTO SalesTransactionDetail VALUES
('SL001','MD001',2),
('SL001','MD002',3),
('SL002','MD003',1),
('SL003','MD001',4),
('SL003','MD004',2),
('SL004','MD004',3),
('SL005','MD001',2),
('SL005','MD006',3),
('SL006','MD005',2),
('SL006','MD007',1),
('SL007','MD008',1),
('SL007','MD010',2),
('SL008','MD009',2),
('SL008','MD011',3),
('SL009','MD016',3),
('SL010','MD012',1),
('SL010','MD015',1),
('SL011','MD011',1),
('SL011','MD010',4),
('SL012','MD006',1),
('SL013','MD007',3),
('SL013','MD016',2),
('SL014','MD015',1),
('SL015','MD014',3),
('SL016','MD013',4)

SELECT * FROM SalesTransactionDetail

INSERT INTO PurchaseTransactionDetail VALUES
('PC001','MD001',5),
('PC001','MD002',4),
('PC002','MD003',6),
('PC002','MD004',7),
('PC003','MD001',4),
('PC004','MD005',5),
('PC004','MD006',2),
('PC005','MD002',3),
('PC005','MD003',5),
('PC006','MD004',9),
('PC007','MD005',10),
('PC008','MD008',6),
('PC008','MD009',7),
('PC009','MD010',5),
('PC009','MD011',3),
('PC010','MD010',4),
('PC010','MD011',8),
('PC011','MD012',7),
('PC011','MD013',6),
('PC012','MD013',5),
('PC013','MD015',3),
('PC014','MD014',2),
('PC014','MD015',1),
('PC015','MD016',5),
('PC016','MD016',1)

SELECT * FROM PurchaseTransactionDetail