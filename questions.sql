use canes; 

-- 1. Which customers are missing emails?
SELECT CustomerID, LastName, FirstName
FROM Customer
WHERE Email is NULL;

-- 2. How much did we have to pay for materials in total?
SELECT sum(BuyPrice) as 'Total Amount Spent on Materials'
FROM materials;

-- 3. How many unique customers do we have?
SELECT count(distinct CustomerID) as 'Unique Customers'
FROM customer;

-- 4. List of menu items and how many materials it takes to make them and which menu item takes the most materials?
SELECT f.NumberofMaterials, i.MenuID, m.materialID
FROM menuitem i, materials m, madefrom f
WHERE i.menuID = f.menuID and m.MaterialID = f.MaterialID
Order by f.NumberofMaterials desc;

-- 5. Which menu item has more than two orders?
SELECT m.menuID, m.comboname
FROM menuitem m, orders o
WHERE m.menuID = o.menuID
GROUP BY menuID
HAVING COUNT(o.MenuID)  >  2;

-- 6. Which material’s buy price is less than the average cost of all the materials’ buy prices?
SELECT MaterialName, BuyPrice
FROM Materials
WHERE BuyPrice > (
SELECT AVG(BuyPrice)
FROM Materials );

-- 7. Which customers use gmail for their email?
SELECT * 
FROM customer
WHERE email LIKE '%gmail.com';

-- 8. A customer has a complaint about their order. What date did OrderNo 1044 take place?
SELECT orderno, DATE(datebought) as date
FROM orders
WHERE orderno = '1044';

-- 9. Which branches are not located in Louisiana?
SELECT * FROM Branch
WHERE State  NOT IN ('LA');

-- 10. Which vendor provides the most material?
Select f.Numberofmaterials, m.MaterialID, m.Vendor 
from materials m, madefrom f
where m.materialid = f.materialID
order by NumberofMaterials desc;
