-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

--Distinct
select b.Title
from Books b
join Loans l on b.BookID = l.BookID
where b.Published between 1890 and 1899
and ReturnedDate is not null
group by b.Title;

select Title, Barcode
from Books
where Published between 1890 and 1899
and BookID not in (Select BookID from Loans where ReturnedDate is Null)
order by Title