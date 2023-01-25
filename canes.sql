-- Drop Tables
DROP TABLE orders;
DROP TABLE madefrom;
DROP TABLE materials;
DROP TABLE menuitem;
DROP TABLE customer;
DROP TABLE branch;

-- Table Creation
Create table Customer
	CustomerID int(10),
	LastName varchar(100),
	FirstName varchar(100),
	Email varchar(100),
Primary key(CustomerID),
Foreign key(BranchNo) REFERENCES Branch(BranchNo);

Create table Branch(
	BranchNo int(10),
	State varchar(2),
	City varchar(100),
	Street varchar(100),
	ZipCode int(5),
	Primary key (BranchNo));

Create table MenuItem(
	MenuID int(5),
	ComboName varchar(100), 
	Description varchar(100),
	SellPrice decimal(10,2),
Primary key(MenuID));

Create table Materials(
	MaterialID int(10),
	MaterialName varchar(100),
	Vendor varchar(100),
	BuyPrice decimal(10,2),
Primary key (MaterialID));

Create table Order(
	OrderNo int(10),
	CustomerID int(10),
	MenuID int(5),
	Datebought varchar(10),
Primary key (orderNo, CustomerID, MenuID),
Foreign key (MenuID) REFERENCES MenuItem(MenuID)
Foreign key (CustomerID) REFERENCES Customer(CustomerID));

Create table MadeFrom(
	MadeID int(10),
	NumberofMaterials int(5),
	MenuID int(5),
	MaterialID int(10),
Primary key (MadeID, MenuID, MaterialID)
Foreign key (MenuID) REFERENCES MenuItem(MenuID)
Foreign key (MaterialID) REFERENCES Materials(MaterialID));

-- Data Insertions
-- Branch Table
Insert into Branch (BranchNo, State, City, Street, ZipCode)
values(5834, 'LA', 'Baton Rouge', 'Highland Road', 84614);

Insert into Branch (BranchNo, State, City, Street, ZipCode)
values(1234, 'OH', 'Columbus', 'Government Street', 32758);

Insert into Branch (BranchNo, State, City, Street, ZipCode)
values(4881, 'CA', 'San Diego', 'River Road', 43551);

Insert into Branch (BranchNo, State, City, Street, ZipCode)
values(9271, 'AL', 'Aubrun', 'Sunset Lane', 64144);

Insert into Branch (BranchNo, State, City, Street, ZipCode)
values(6578, 'NY', 'New York', '5th Street', 88345);

-- MenuItem Table
Insert into menuitem (MenuID, ComboName, Description, SellPrice)
values(1, 'Kids Combo', 'Two Chicken Fingers', 4.58);

Insert into menuitem (MenuID, ComboName, Description, SellPrice)
values(2, 'Three Finger Combo', 'Three Chicken Fingers', 6.38);

Insert into menuitem (MenuID, ComboName, Description, SellPrice)
values(3, 'Box Combo', 'Four Chicken Fingers', 6.98);

Insert into menuitem (MenuID, ComboName, Description, SellPrice)
values(4, 'Caniac Combo', 'Six Chicken Fingers', 9.98);

Insert into menuitem (MenuID, ComboName, Description, SellPrice)
values(5, 'Sandwich Combo', 'Chicken Sandwich', 5.98);

-- Materials Table
Insert into Materials (MaterialID, MaterialName, Vendor, BuyPrice)
values(111, 'Boxes', 'Boxes Inc.', 500.00);

Insert into Materials (MaterialID, MaterialName, Vendor, BuyPrice)
values(742, 'Chicken', 'Peter Chicken Farm', 1000.58);

Insert into Materials (MaterialID, MaterialName, Vendor, BuyPrice)
values(314, 'Potatoes', 'Berry Vegetable Farm', 1568.60);

Insert into Materials (MaterialID, MaterialName, Vendor, BuyPrice)
values(205, 'Utensils', 'Utensils Corp.', 1609.34);

Insert into Materials (MaterialID, MaterialName, Vendor, BuyPrice)
values(502, 'Napkins', 'Paper Planet Inc.', 300.45);

-- Customer Table
Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(9876, 'Wheeler', 'Mike', 'mwheeler@gmail.com', 4881);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(1337, 'Byers', 'Will', wbyers@outlook.com, 5834);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(4269, 'Mayfield', 'Max', 'mmayfield@yahoo.com', 6578);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(9999, 'Henderson', 'Dustin', 'dhenderson@gmail.com', 9271);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(1212, 'Sinclair', 'Lucas', 'lsinclair@gmail.com', 1234);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(8572, 'Jones', 'Juan', NULL, 5834);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(9587, 'Bond', 'James', 'Bond007@outlook.com', 1234);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(6632, 'Burrow', 'Joe', 'thegoat7@gmail.com', 5834);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(2841, 'Kelly', 'Brian', NULL, 5834);

Insert into Customer(CustomerID, LastName, FirstName, Email, BranchNo)
values(2345, 'Walters', 'Felix', 'fwalters@gmail.com', 9271);

-- Orders Table
Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(7483, 1337, 1, 2022-12-16);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(1343, 4269, 2, 2022-11-12);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(2395, 9876, 3, 2022-12-29);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(5783, 9999, 4, 2022-10-20);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(8695, 1212, 5, 2022-11-12);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(2814, 2345, 1, 2022-12-23);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(1216, 2841, 2, 2022-11-12);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(1044, 6632, 4, 2022-12-1);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(6733, 8572, 3, 2022-11-12);

Insert into Orders(OrderNo, CustomerID, MenuID, DateBought)
values(8462, 9587, 3, 2022-11-25);

-- MadeFrom Table
Insert into MadeFrom(MadeID, NumberofMaterials, MenuID, MaterialID)
values(1345, 2, 1, 742);

Insert into MadeFrom(MadeID, NumberofMaterials, MenuID, MaterialID)
values(1742, 5, 4, 111);

Insert into MadeFrom(MadeID, NumberofMaterials, MenuID, MaterialID)
values(4721, 10, 2, 502);

Insert into MadeFrom(MadeID, NumberofMaterials, MenuID, MaterialID)
values(1252, 3, 4, 205);

Insert into MadeFrom(MadeID, NumberofMaterials, MenuID, MaterialID)
values(6575, 8, 5, 314);
