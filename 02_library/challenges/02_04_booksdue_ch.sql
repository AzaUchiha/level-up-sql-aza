-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

select p.FirstName, p.Email, b.Title, l.DueDate
from Patrons p
join Loans l on l.PatronID = p.PatronID
join Books b on b.BookID = l.BookID
where l.DueDate = '2022-07-13'
and l.ReturnedDate is null