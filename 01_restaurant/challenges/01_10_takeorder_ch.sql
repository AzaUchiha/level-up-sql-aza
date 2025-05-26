-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.


--Find customerID (70)
select * 
from customers
where FirstName = 'Loretta'
and LastName = 'Hundey'
and address = '6939 Elka Place'


--Create order record
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (
  (SELECT CustomerID
    FROM Customers
    WHERE FirstName = 'Loretta'
    and address = '6939 Elka Place'),
    '2022-09-12 14:00:00');


--Find new OrderID (1001)
Select *
from Orders
where CustomerID = 70
ORDER BY OrderDate desc


--Find DishID
Select DishID, Name, Price 
from Dishes
where Name in ('House Salad', 'Mini Cheeseburgers', 'Tropical Blue Smoothie')


--Add items to OrdersDishes
INSERT INTO OrdersDishes (OrderID, DishID)
VALUES 
  (1001, (Select DishID from Dishes where Name = 'House Salad')),
  (1001, (Select DishID from Dishes where Name = 'Mini Cheeseburgers')),
  (1001, (Select DishID from Dishes where Name = 'Tropical Blue Smoothie'))


--Find new OrdersDishes and crosscheck Dishes Name
SELECT *
from OrdersDishes od
join Dishes d on od.DishID = d.DishID
where od.orderID = 1001


--Total cost referencing from new OrdersDishes orderID
select sum(d.Price)
from Dishes d
join OrdersDishes od on d.DishID = od.DishID
where od.OrderID = 1001