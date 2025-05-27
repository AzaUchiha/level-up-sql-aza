-- Prepare a report of the library patrons
-- who have checked out the fewest books.


Select p.email, p.FirstName, count(l.LoanID) as LoanCount
from Patrons p
join Loans l on p.PatronID = l.PatronID
group by l.PatronID
order by LoanCount
limit 5