-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.


Select * from customers
where LastName like 'St%'

select * from reservations r
join Customers c on r.customerID = c.customerID
where c.LastName like 'St%'
and r.partysize = 4
order by r.Date desc