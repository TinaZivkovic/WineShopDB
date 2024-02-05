CREATE DATABASE WineShop;

USE WineShop;


-- Started by creating tables for our Products - Red and White wines


CREATE TABLE RedWines
	(W_ID INT PRIMARY KEY, 
    NAME VARCHAR (50) NOT NULL,
    COUNTRY VARCHAR (50) NOT NULL,
    REGION VARCHAR (50) NOT NULL,
    PRICE DECIMAL (5,2) NOT NULL
    );
    
INSERT INTO RedWines
VALUES 
	(101, 'House Red', 'France', 'South France', 9.50),
    (102, 'House Red Burgundy', 'France', 'Burgundy', 24.95),
    (103, 'Chateau Argadens', 'France', 'Bordeaux', 13.50),
    (104, 'Zapallares Pinot Noir', 'Chile', 'Aconcagua', 11.95),
    (105, 'Meerlust', 'South Africa', 'Stellenbosch', 30.00),
    (106, 'Gouguenheim Malbec', 'Argentina', 'Mendoza', 13.95),
    (107, 'Bousquet Malbec', 'Argentina', 'Mendoza', 13.95),
    (108, 'Somontes Tinto', 'Portugal', 'Dao', 11.95),
    (109, 'Chianti Classico', 'Italy', 'Chianti', 18.95),
    (110, 'Brunello', 'Italy', 'Brunello di Montalcino', 40.00);
    
CREATE TABLE WhiteWines
	(W_ID INT PRIMARY KEY, 
    NAME VARCHAR (50) NOT NULL,
    COUNTRY VARCHAR (50) NOT NULL,
    REGION VARCHAR (50) NOT NULL,
    PRICE DECIMAL (5,2) NOT NULL
    );
    
INSERT INTO WhiteWines
VALUES
	(201, 'House White', 'France', 'Gascony', 9.50),
    (202, 'House White Burgundy', 'France', 'Burgundy', 16.50), 
    (203, 'Picpoul de Piner', 'France', 'Languedoc', 12.95),
    (204, 'Fiano', 'Italy', 'Puglia', 10.95),
    (205, 'Zapallares Pinot Grigio', 'Chile', 'Aconcagua', 11.95),
    (206, 'Whispering Angel Sauvignon Blanc', 'New Zealand', 'Waipara', 14.95),
    (207, 'Sancerre', 'France', 'Loire', 22.95),
    (208, 'Argyros Assyrtiko', 'Greece', 'Santorini', 30.50),
    (209, 'Riesling Trocken', 'Germany', 'Mosel', 15.95),
    (210, 'Blanco Rioja', 'Spain', 'Rioja', 40.00);
   
-- Then we needed information on our customers
-- One table with their names and contact information
-- Separate table with their addresses
-- Normalised the tables so that there isn't too much information in one table

CREATE TABLE CUSTOMER (
	C_ID INT PRIMARY KEY,
	FIRST_NAME VARCHAR(50) NOT NULL,
	LAST_NAME VARCHAR(50) NOT NULL,
	PHONE_NUMBER VARCHAR(20) NULL,
	EMAIL_ADDRESS VARCHAR(55) NOT NULL
);

INSERT INTO CUSTOMER
	(C_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMAIL_ADDRESS)
VALUES
	('1', 'LILLY', 'ANDERS', '07539639621', 'ANDERSL@OUTLOOK.COM'),
	('2', 'DANIEL', 'PHILLIPS', '07217952863', 'DANPHIL@HOTMAIL.COM'),
	('3', 'COOPER', 'MITCHELL', '07852968431', 'MITCH21@HOTMAIL.COM'),
	('4', 'JONATHAN', 'ALLEN', '', 'JALLEN@ICLOUD.COM'),
	('5', 'INDIYAH', 'OWENS', '07539856565', 'INDIO@GMAIL.COM'),
	('6', 'DAVIDO', 'SMITH', '07289090745', 'DAVSMITH@OUTLOOK.COM'),
	('7', 'SKYLA', 'IDRIS', '0781234123', 'SKYS@GMAIL.COM'),
	('8', 'MAYA', 'GABRIEL', '', 'MAYAG@OUTLOOK.COM'),
	('9', 'DECLAN', 'WHITE', '07586765245', 'DECCYWHITE@ICLOUD.CO.UK'),
	('10', 'DARREN', 'JAMEEL', '07287895341', 'JAMEELD9@HOTMAIL.CO.UK');

CREATE TABLE CUSTOMER_ADDRESS (
    C_ID INT PRIMARY KEY,
    Flat VARCHAR(255) NULL,
    HouseNumber INT NOT NULL,
    Street VARCHAR(255) NOT NULL,
    County VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Postcode VARCHAR(10) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    FOREIGN KEY (C_ID) REFERENCES Customer(C_ID)
);


INSERT INTO CUSTOMER_ADDRESS 
	(C_ID, Flat, HouseNumber, Street, County, City, Postcode, Country)
VALUES
    (1, NULL, '123', 'Main Street', 'Redbridge', 'London', 'SW1A 1AA', 'United Kingdom'),
    (2, 'Flat 2B', '456', 'High Street', 'Trafford', 'Manchester', 'M1 1AA', 'United Kingdom'),
    (3, 'Flat 3C', '789', 'Park Avenue', 'Birmingham', 'Birmingham', 'B1 1AA', 'United Kingdom'),
    (4, 'Flat 4D', '101', 'Kings Road', 'Leeds', 'Leeds', 'LS1 1AA', 'United Kingdom'),
    (5, 'Flat 5E', '202', 'Queen Street', 'Wallasey', 'Liverpool', 'L1 1AA', 'United Kingdom'),
    (6, 'Flat 6F', '303', 'Elm Street', 'Lanarkshire', 'Glasgow', 'G1 1AA', 'United Kingdom'),
    (7, 'Flat 7G', '404', 'Oak Lane', 'Edinburgh', 'Edinburgh', 'EH1 1AA', 'United Kingdom'),
    (8, 'Flat 8H', '505', 'Birch Road', 'South Glamorgan', 'Cardiff', 'CF1 1AA', 'United Kingdom'),
    (9, 'Flat 9I', '606', 'Cedar Close', 'Tyrone', 'Belfast', 'BT1 1AA', 'United Kingdom'),
   (10, 'Flat 10J', '707', 'Willow Way', 'Northumberland', 'Newcastle', 'NE1 1AA', 'United Kingdom');

-- Then we made tables giving us Order information
-- We created the table that relates the Orders to the customers
-- It tells us who ordered, when, and how much it cost

CREATE TABLE ORDERS (
    O_ID CHAR(4) PRIMARY KEY,
    C_ID INT,
    DATE DATE NOT NULL, 
    AMOUNT DECIMAL(10, 2),
    FOREIGN KEY (C_ID) REFERENCES CUSTOMER(C_ID) 
);


INSERT INTO ORDERS 
	(O_ID, C_ID, DATE, AMOUNT)
VALUES 
    ('O020', 1, '2023-01-15', 115.90), 
    ('O021', 2, '2023-01-18', 11.95),
    ('O022', 3, '2023-02-10', 41.85),
    ('O023', 4, '2023-02-20', 33.85),
    ('O024', 5, '2023-03-05', 55.80),
    ('O025', 6, '2023-03-12', 32.85),
    ('O026', 7, '2023-03-15', 68.85),
    ('O027', 8, '2023-04-01', 47.80),
    ('O028', 9, '2023-04-10', 53.50),
    ('O029', 1, '2023-04-15', 49.50),
    ('O030', 2, '2023-04-20', 47.50); 


-- Then we created a table relating the orders to the wines
-- It tells us which wines were in the order, and the quantity

CREATE TABLE Order_Info(
	O_ID CHAR(4) NOT NULL,
	W_ID INT NOT NULL, 
	Quantity CHAR(10),
	FOREIGN KEY (W_ID) REFERENCES WINES(W_ID)
);

INSERT INTO Order_Info 
VALUES ('O020','202','4'),
('O020', '102', '2'),
('O021', '205', '1'),
('O022', '107', '3'),
('O023', '204', '2'),
('O023', '205', '1'),
('O024', '106', '4'),
('O025', '204', '3'),
('O026', '207', '3'),
('O027', '108', '4'),
('O028', '103', '1'),
('O028', '210', '1'),
('O029', '202', '3'),
('O030', '101', '5');

-- realised that the Order_Info table isn't relating to the Wines table as planned
-- as we forgot to add FK constraint on O_ID

ALTER TABLE Order_Info 
ADD CONSTRAINT FK_Order_Info_OrderID
FOREIGN KEY (O_ID) REFERENCES Orders(O_ID);

-- While we were trying to add FK to W_ID
-- We noted that one table (Order_Info) can't have a Foreign Key referencing two different tables (RedWines and WhiteWines) 
-- So we decided to drop the table WhiteWines and merge it with RedWines into Wines table

ALTER TABLE REDWINES
RENAME WINES;

INSERT INTO WINES
VALUES
	(201, 'House White', 'France', 'Gascony', 9.50),
    (202, 'House White Burgundy', 'France', 'Burgundy', 16.50), 
    (203, 'Picpoul de Piner', 'France', 'Languedoc', 12.95),
    (204, 'Fiano', 'Italy', 'Puglia', 10.95),
    (205, 'Zapallares Pinot Grigio', 'Chile', 'Aconcagua', 11.95),
    (206, 'Whispering Angel Sauvignon Blanc', 'New Zealand', 'Waipara', 14.95),
    (207, 'Sancerre', 'France', 'Loire', 22.95),
    (208, 'Argyros Assyrtiko', 'Greece', 'Santorini', 30.50),
    (209, 'Riesling Trocken', 'Germany', 'Mosel', 15.95),
    (210, 'Blanco Rioja', 'Spain', 'Rioja', 40.00);
    
DROP TABLE WHITEWINES;

CREATE TABLE PAYMENTS (
    P_ID INT PRIMARY KEY,
    O_ID CHAR(4) NOT NULL, 
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    CardNumber VARCHAR(16) NOT NULL,
    ExpiryDate DATE NOT NULL,
    FOREIGN KEY (O_ID) REFERENCES ORDERS(O_ID)
);

-- Inserting table with payment information

INSERT INTO PAYMENTS 
	(P_ID, O_ID, PaymentDate, Amount, PaymentMethod, CardNumber, ExpiryDate)
VALUES
    (1, 'O020', '2023-01-15',  115.90, 'Credit Card', '************1234', '2025-12-31'),
    (2, 'O021', '2023-01-18', 11.95, 'Debit Card', '************5678', '2024-06-30'),
    (3, 'O022', '2023-02-10', 41.85, 'Credit Card', '************9090', '2025-09-30'),
    (4, 'O023', '2023-02-20', 33.85, 'Debit Card', '************1234', '2024-04-30'),
    (5, 'O024', '2023-03-05', 55.80, 'Credit Card', '************5678', '2025-11-30'),
    (6, 'O025', '2023-03-12', 32.85, 'Debit Card', '************9090', '2024-08-31'),
    (7, 'O026', '2023-03-15', 68.85, 'Credit Card', '************1234', '2025-10-31'),
    (8, 'O027', '2023-04-01', 47.80, 'Debit Card', '************5678', '2024-05-31'),
    (9, 'O028', '2023-04-10', 53.50, 'Credit Card', '************9090', '2025-07-31'),
    (10, 'O029', '2023-04-15', 49.50, 'Debit Card', '************1234', '2024-03-31'),
    (11, 'O030', '2023-04-20', 47.50, 'Credit Card', '************5678', '2025-04-30');

-- Inserting table with memberships

CREATE TABLE Membership (
    M_ID INT PRIMARY KEY,
    C_ID INT,
    Type VARCHAR(15) CHECK (Type IN ('Active', 'Inactive', 'No Membership')),
    MembershipLevel VARCHAR(10) NULL 
		CHECK (MembershipLevel IN ('Silver', 'Gold', 'Platinum') OR MembershipLevel IS NULL),
    ExpiryDate DATE NULL,
    FOREIGN KEY (C_ID) REFERENCES CUSTOMER(C_ID)
);

INSERT INTO Membership 
	(M_ID, C_ID, Type, MembershipLevel, ExpiryDate) 
VALUES
	(1, 1, 'Active', 'Silver', '2024-01-01'),
	(2, 2, 'Active', 'Gold', '2024-06-01'),
	(3, 3, 'Active', 'Platinum', '2023-12-01'),
	(4, 4, 'No Membership', NULL, NULL),
	(5, 5, 'No Membership', NULL, NULL),
	(6, 6, 'Inactive', 'Platinum', '2023-10-01'),
	(7, 7, 'No Membership', NULL, NULL),
	(8, 8, 'Active', 'Gold', '2024-05-01'),
	(9, 9, 'Active', 'Platinum', '2024-02-01'),
	(10, 10, 'Inactive', 'Silver', '2023-08-01');


-- Inserting Suppliers table for Wines

CREATE TABLE SUPPLIER (
	S_ID INT PRIMARY KEY,
	SNAME VARCHAR (20),
	COUNTRY VARCHAR (20)
);

INSERT INTO SUPPLIER
	(S_ID, SNAME, COUNTRY)
VALUES
	('01', 'LES BLANC', 'FRANCE'),
	('02', 'BRUNELLO', 'ITALY'),
	('03', 'FRIO', 'CHILE'),
	('04', 'FIEN SPIRITS', 'NEW ZELAND'),
	('05', 'ROYAL CALI', 'GREECE'),
	('06', 'SPIRITED GRAPE', 'GERMANY'),
	('07', 'LA SIP', 'SPAIN'),
	('08', 'GRAPEVINE', 'SOUTH AFRICA'),
	('09', 'FULL GLASS INC', 'ARGENTINA'),
	('10', 'LE CHARDONAY', 'PORTUGAL');


-- Find orders that amount is greater than the average spend

-- The average as fyi

SELECT AVG(AMOUNT)
FROM ORDERS;

-- Customers spending more than the average

SELECT
	O_ID,
    AMOUNT
FROM ORDERS
WHERE AMOUNT > (
	SELECT AVG(AMOUNT)
    FROM ORDERS);

-- Checking which wines haven't been sold at all

SELECT 
	W.W_ID, 
    W.Name
FROM Wines AS W
LEFT JOIN Order_Info O ON W.W_ID = O.W_ID
WHERE O.W_ID IS NULL;

-- Cusomers with active memberships get 10% cashback on their orders
-- We decided to create a view that would show us how much are customers getting cashback

CREATE VIEW CashbackInformation AS
	SELECT 
		O.C_ID,
        C.First_Name,
        O.O_ID, 
        M.Type as MembershipStatus,
        O.AMOUNT,
		ROUND(CASE
			WHEN M.Type = 'Active'
            THEN O.Amount * 0.1
            ELSE 0
		END, 2)
        AS Cashback
FROM Orders O
LEFT JOIN Membership M ON O.C_ID = M.C_ID
JOIN Customer C ON O.C_ID = C.C_ID;

-- Check how the View looks 

SELECT * FROM CashbackInformation;
