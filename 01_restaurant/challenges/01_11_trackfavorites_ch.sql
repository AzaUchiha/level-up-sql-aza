-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.


--Get CustomerID (42)
select * from Customers
WHERE FirstName = 'Cleo'and LastName = 'Goldwater'


UPDATE Customers
SET FavoriteDish = (Select DishID from Dishes where Name = 'Quinoa Salmon Salad')
WHERE CustomerID = 42

select c.FirstName, c.LastName, c.FavoriteDish, d.Name  from Customers c
join Dishes d on c.FavoriteDish = d.DishID
where CustomerID =42