-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424


select * from Loans l
join Books b on l.BookID = b.BookID
where b.Barcode in ('6435968624', '5677520613', '8730298424')
and l.ReturnedDate is null


update Loans
set ReturnedDate = '2022-07-05'
where BookID = (select BookID from Books where Barcode = '6435968624')
and ReturnedDate is null;

update Loans
set ReturnedDate = '2022-07-05'
where BookID = (select BookID from Books where Barcode = '5677520613')
and ReturnedDate is null;

update Loans
set ReturnedDate = '2022-07-05'
where BookID = (select BookID from Books where Barcode = '8730298424')
and ReturnedDate is null;


select * from Loans l
join Books b on l.BookID = b.BookID
where b.Barcode in ('6435968624', '5677520613', '8730298424')
order by l.loanID desc