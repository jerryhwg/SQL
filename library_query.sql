/*
1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
*/

SELECT a1.book_title AS "Book Title", a2.number_of_copies AS "Number of Copies", a3.branch_name AS "Branch Name"
FROM tbl_books a1
INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
INNER JOIN tbl_branch a3 ON a3.branch_id = a2.branch_id
WHERE book_title = 'The Lost Tribe'
AND branch_name = 'Sharpstown'
;

/*
2. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
*/

SELECT a1.book_title AS "Book Title", a2.number_of_copies AS "Number of Copies", a3.branch_name AS "Branch Name"
FROM tbl_books a1
INNER JOIN tbl_book_copies a2 ON a2.book_id = a1.book_id
INNER JOIN tbl_branch a3 ON a3.branch_id = a2.branch_id
WHERE book_title = 'The Lost Tribe'
;

/*
3. Retrieve the names of all borrowers who do not have any books checked out.
*/

SELECT a1.borrower_name AS "Borrower with no checkout"
FROM tbl_borrower a1
LEFT OUTER JOIN tbl_book_loans a2 ON a1.card_no = a2.card_no
WHERE a2.card_no IS NULL
;

/*
4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
*/


/*
5. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
*/


/*
6. Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
*/


/*
7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
*/
