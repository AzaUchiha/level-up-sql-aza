-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.



Select
  (select count(*) from Books where Title = 'Dracula') -- 3 copies in total (BookID: 12, 60, 73)
-
  (select count(*) from Loans l -- no. of copies not returned
  join Books b on l.BookID = b.BookID
  where b.Title = 'Dracula'
  and ReturnedDate is null)
as AvailableCopies

--method 2
with a as
(
select l.BookID, max(l.DueDate), ReturnedDate,
case when ReturnedDate >= DueDate then 1 else 0 end Available
from Loans l
join Books b on l.BookID = b.BookID
where b.Title = 'Dracula'
group by l.BookID
order by l.BookID Desc
)

select count(a.Available)
from a
where Available =1