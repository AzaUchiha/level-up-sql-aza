-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.


Select published, count(DISTINCT title) as PUBCount
from Books
group by published
order by PUBCount desc

Select b.title, count(l.loanID) LOANCount
from Loans l
join Books b on l.BookID = b.BookID
group by b.title
order by LOANCount desc
limit 5