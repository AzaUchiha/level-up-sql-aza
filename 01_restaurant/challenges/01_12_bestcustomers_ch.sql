-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

with o as (
select CustomerID, count(orderID) OrderCount
from Orders
group by CustomerID
order by number_of_orders desc
)

select c.FirstName, c.LastName, c.Email, o.OrderCount
join o on o.CustomerID = c.CustomerID
;


select c.FirstName, c.LastName, c.Email, count(orderID) OrderCount
from Orders o
join Customers c on o.CustomerID = c.CustomerID
group by o.CustomerID
order by OrderCount desc
limit 15;