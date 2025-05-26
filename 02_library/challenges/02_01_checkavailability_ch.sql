-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.


--3 copies (12, 60, 73)
select count(*) from Books where Title = 'Dracula'


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