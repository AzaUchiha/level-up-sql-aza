-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.


Select * from Reservations R
join Customers C on R.CustomerID = C.CustomerID
where FirstName like '%Norby'
and Date > '2022-07-24'

Delete from Reservations
where ReservationID = 2000