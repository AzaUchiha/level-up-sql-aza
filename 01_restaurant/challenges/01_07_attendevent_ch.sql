-- Register a customer for our Anniversary event.

-- The customer 'atapley2j@kinetecoinc.com' will be in
-- attendance, and will bring 3 friends.

Select CustomerID, PartySize from Reservations R
Join Customers C on C.CustomerID = R.CustomerID
where C.Email = 'atapley2j@kinetecoinc.com'


INSERT INTO AnniversaryAttendees (CustomerID, PartySize)
VALUES (
  (SELECT CustomerID
    FROM Customers
    WHERE Email = 'atapley2j@kinetecoinc.com'),
    4);

Select * from AnniversaryAttendees