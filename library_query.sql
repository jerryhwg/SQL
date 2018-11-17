/*** 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? ***/

CREATE PROC dbo.getLostTribeSharpstown AS
SELECT a1.book_title AS "Book Title", a2.number_of_copies AS "Number of Copies", a3.branch_name AS "Branch Name"
FROM tbl_books a1
INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
INNER JOIN tbl_branch a3 ON a3.branch_id = a2.branch_id
WHERE book_title = 'The Lost Tribe'
AND branch_name = 'Sharpstown';
GO

/* Use: EXEC [dbo].[getLostTribeSharpstown] */

/*** 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch? ***/

CREATE PROC dbo.getLostTribeNumCopiesBranch AS
SELECT a1.book_title AS "Book Title", a2.number_of_copies AS "Number of Copies", a3.branch_name AS "Branch Name"
FROM tbl_books a1
INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
INNER JOIN tbl_branch a3 ON a3.branch_id = a2.branch_id
WHERE book_title = 'The Lost Tribe';
GO

/* Use: EXEC [dbo].[getLostTribeNumCopiesBranch] */

/*** 3. Retrieve the names of all borrowers who do not have any books checked out. ***/

CREATE PROC dbo.getBorrowerNoCheckout AS
SELECT a1.borrower_name AS "Borrower with no checkout"
FROM tbl_borrower a1
LEFT OUTER JOIN tbl_book_loans a2 ON a1.card_no = a2.card_no
WHERE a2.card_no IS NULL;
GO

/* Use: EXEC [dbo].[getBorrowerNoCheckout] */

/*** 4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. ***/

CREATE PROC dbo.getBookSharpstownDueToday AS
SELECT a1.book_title AS "Book Title Due Today at Sharpstown", a2.borrower_name AS "Borrower Name", a2.borrower_address AS "Borrwer Adress"
FROM tbl_borrower a2
INNER JOIN tbl_book_loans a3 ON a3.card_no = a2.card_no
INNER JOIN tbl_books a1 ON a1.book_id = a3.book_id
WHERE a3.date_due = CAST(CURRENT_TIMESTAMP AS DATE) AND a3.branch_id = 100;
GO

/* Use: EXEC [dbo].[getBookSharpstownDueToday] */

/*** 5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch. ***/

CREATE PROC dbo.getBookLoanPerBranch AS
SELECT a1.branch_name AS "Branch Name", COUNT(a2.book_id) AS "Books Loaned"
FROM tbl_branch a1
RIGHT OUTER JOIN tbl_book_loans a2 ON a1.branch_id = a2.branch_id
GROUP BY a1.branch_name;
GO

/* Use: EXEC [dbo].[getBookLoanPerBranch] */

/*** 6. Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out. ***/

CREATE PROC dbo.getBorrowerBookLoanOverFive AS
SELECT a1.borrower_name AS "Borrower Name", a1.borrower_address AS "Borrower Address", COUNT(a2.book_id) AS "Number of Books Loaned"
FROM tbl_borrower a1
INNER JOIN tbl_book_loans a2 ON a1.card_no = a2.card_no
GROUP BY a1.borrower_name, a1.borrower_address
HAVING COUNT(a2.book_id) > 5;
GO

/* Use: EXEC [dbo].[getBorrowerBookLoanOverFive] */

/*** 7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central". ***/

CREATE PROC dbo.getBookStephenKingCentral AS
SELECT a1.book_title AS "Book Title", a2.number_of_copies AS "Number of Copies"
FROM tbl_books a1
INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
INNER JOIN tbl_branch a3 ON a3.branch_id = a2.branch_id
INNER JOIN tbl_authors a4 ON a4.book_id = a1.book_id 
WHERE a3.branch_name = 'Central' AND a4.author_name = 'Stephen King';
GO

/* Use: EXEC [dbo].[getBookStephenKingCentral] */