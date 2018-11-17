/***************************************************************
LIBRARY MANAGEMENT SYSTEM
1) CREATE database/table
2) INSERT statements
3) Final query statements in stored procedures - 7 queries
***************************************************************/

CREATE DATABASE db_library

USE db_library

/******************************************************
* Build our database tables and define ther schema
******************************************************/

CREATE TABLE tbl_branch (
    branch_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
    branch_name VARCHAR(50) NOT NULL,
    branch_address VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_publisher (
    publisher_name VARCHAR (50) PRIMARY KEY NOT NULL,
    publisher_address VARCHAR(100) NOT NULL,
    publisher_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
    book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_title VARCHAR(100) NOT NULL,
    publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_authors (
    book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    author_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_copies (
    book_id INT NOT NULL CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    branch_id INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
    number_of_copies INT NOT NULL
);

CREATE TABLE tbl_borrower (
    card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    borrower_name VARCHAR(50) NOT NULL,
    borrower_address VARCHAR(100) NOT NULL,
    borrower_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (
    loan_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    book_id INT NOT NULL CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
    branch_id INT NOT NULL CONSTRAINT fk_branch_id3 FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
    card_no INT NOT NULL CONSTRAINT fk_card_no3 FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
    date_out DATE,
    date_due DATE
);

/******************************************************
* Insert data into the bulit tables
******************************************************/

INSERT INTO tbl_branch
		(branch_name, branch_address)
		VALUES 
		('Sharpstown', 'Seattle, WA'),
        ('Central', 'Bellevue, WA'),
		('Highland', 'Renton, WA'),
        ('Maplevalley', 'Newcastle, WA')
;

INSERT INTO tbl_publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES 
		('Publisher King', 'Renton, WA', '313-1231'),
        ('Publisher Queen', 'Seattle, WA', '313-1232'),
        ('Publisher Jack', 'Newcast, WA', '313-1233'),
		('Publisher Heart', 'Bellevue, WA', '313-1234')
;

INSERT INTO tbl_books
		(book_title, publisher_name)
		VALUES 
		('The Lost Tribe', 'Publisher King'),
        ('Saving Tribe', 'Publisher Queen'),
        ('Winning Tribe', 'Publisher Jack'),
        ('Happy Tribe', 'Publisher King'),
        ('Angry Tribe', 'Publisher Queen'),
        ('World of Tribe', 'Publisher Jack'),
        ('Cars in Tribe', 'Publisher Jack'),
        ('Friends of Tribe', 'Publisher King'),
        ('Wicked Tribe', 'Publisher Heart'),
        ('Foods of Tribe', 'Publisher Heart'),
        ('Houses of Tribe', 'Publisher King'),
        ('History of Tribe', 'Publisher Heart'),
        ('People of Tribe', 'Publisher Heart'),
        ('Sports of Tribe', 'Publisher King'),
        ('Hobbies of Tribe', 'Publisher Queen'),
        ('Animals of Tribe', 'Publisher Queen'),
        ('Who knows Tribe', 'Publisher King'),
        ('Dreams of Tribe', 'Publisher King'),
        ('Dummies for Tribe', 'Publisher Heart'),
		('Science of Tribe', 'Publisher King')
;

INSERT INTO tbl_authors
		(book_id, author_name)
		VALUES 
		(1, 'James Hines'),
        (2, 'Stephen King'),
        (3, 'Stephen King'),
        (4, 'Ross Clark'),
        (5, 'Kay Lu'),
        (6, 'Jacky Chan'),
        (7, 'James Hines'),
        (8, 'Ross Williams'),
        (9, 'Lucy Lu'),
        (10, 'Claire Danes'),
        (11, 'Wang Wu'),
        (12, 'Thomas Harper'),
        (13, 'Kay Lu'),
        (14, 'Claire Danes'),
        (15, 'Amy Lee'),
        (16, 'Victor Larsen'),
        (17, 'Mark Thames'),
        (18, 'Wang Wu'),
        (19, 'James Hines'),
        (20, 'Hank Aaron')
;

INSERT INTO tbl_book_copies
		(book_id, branch_id, number_of_copies)
		VALUES 
		(1, 100, 2),
        (1, 101, 2),
        (1, 102, 2),
        (1, 103, 2),
        (2, 100, 2),
        (2, 101, 2),
        (2, 102, 2),
        (2, 103, 2),
        (3, 100, 2),
        (3, 101, 2),
        (3, 102, 2),
        (3, 103, 2),
        (4, 100, 2),
        (4, 101, 2),
        (4, 102, 2),
        (4, 103, 2),
        (5, 100, 2),
        (5, 101, 2),
        (5, 102, 2),
        (5, 103, 2),
        (6, 100, 2),
        (6, 101, 2),
        (6, 102, 2),
        (6, 103, 2),
        (7, 100, 2),
        (7, 101, 2),
        (7, 102, 2),
        (7, 103, 2),
        (8, 100, 2),
        (8, 101, 2),
        (8, 102, 2),
        (8, 103, 2),
        (9, 100, 2),
        (9, 101, 2),
        (9, 102, 2),
        (9, 103, 2),
        (10, 100, 2),
        (10, 101, 2),
        (10, 102, 2),
        (10, 103, 2),
        (11, 100, 2),
        (11, 101, 2),
        (11, 102, 2),
        (11, 103, 2),
        (12, 100, 2),
        (12, 101, 2),
        (12, 102, 2),
        (12, 103, 2),
        (13, 100, 2),
        (13, 101, 2),
        (13, 102, 2),
        (13, 103, 2),
        (14, 100, 2),
        (14, 101, 2),
        (14, 102, 2),
        (14, 103, 2),
        (15, 100, 2),
        (15, 101, 2),
        (15, 102, 2),
        (15, 103, 2),
        (16, 100, 2),
        (16, 101, 2),
        (16, 102, 2),
        (16, 103, 2),
        (17, 100, 2),
        (17, 101, 2),
        (17, 102, 2),
        (17, 103, 2),
        (18, 100, 2),
        (18, 101, 2),
        (18, 102, 2),
        (18, 103, 2),
        (19, 100, 2),
        (19, 101, 2),
        (19, 102, 2),
        (19, 103, 2),
        (20, 100, 2),
        (20, 101, 2),
        (20, 102, 2),
        (20, 103, 2)
;

INSERT INTO tbl_borrower
		(borrower_name, borrower_address, borrower_phone)
		VALUES 
		('Tim Cook', 'Renton, WA', '123-1231'),
        ('Jeff Bezos', 'Seattle, WA', '123-1232'),
        ('Bill Gates', 'Bellevue, WA', '123-1233'),
        ('Woody Allen', 'Newcastle, WA', '123-1234'),
        ('Cobe Brian', 'Renton, WA', '123-1235'),
        ('Michael Jordan', 'Seattle, WA', '123-1236'),
        ('Rusell Willson', 'Bellevue, WA', '123-1237'),
        ('Steve Balmer', 'Newcastle, WA', '123-1238')
;

INSERT INTO tbl_book_loans
		(book_id, branch_id, card_no, date_out, date_due)
		VALUES 
		(1, 100, 1, '20181021', '20181117'),
        (2, 101, 1, '20181022', '20181118'),
        (3, 102, 1, '20181023', '20181119'),
        (4, 103, 1, '20181024', '20181120'),
        (5, 100, 1, '20181025', '20181121'),
        (6, 101, 1, '20181026', '20181122'),
        (7, 102, 1, '20181027', '20181123'),
        (8, 103, 1, '20181028', '20181124'),
        (9, 100, 1, '20181029', '20181125'),
        (10, 101, 1, '20181030', '20181126'),
        (11, 102, 2, '20181021', '20181117'),
        (12, 103, 2, '20181022', '20181118'),
        (13, 100, 2, '20181023', '20181119'),
        (14, 101, 2, '20181024', '20181120'),
        (15, 102, 2, '20181025', '20181121'),
        (16, 103, 2, '20181026', '20181122'),
        (17, 100, 2, '20181027', '20181123'),
        (18, 101, 2, '20181028', '20181124'),
        (19, 102, 2, '20181029', '20181125'),
        (20, 103, 2, '20181030', '20181126'),
        (1, 100, 3, '20181021', '20181117'),
        (2, 101, 3, '20181022', '20181118'),
        (3, 102, 3, '20181023', '20181119'),
        (4, 103, 3, '20181024', '20181120'),
        (5, 100, 3, '20181025', '20181121'),
        (6, 101, 4, '20181026', '20181122'),
        (7, 102, 4, '20181027', '20181123'),
        (8, 103, 4, '20181028', '20181124'),
        (9, 100, 4, '20181029', '20181125'),
        (10, 101, 4, '20181030', '20181126'),
        (11, 102, 5, '20181021', '20181117'),
        (12, 103, 5, '20181022', '20181118'),
        (13, 100, 5, '20181023', '20181119'),
        (14, 101, 5, '20181024', '20181120'),
        (15, 102, 5, '20181025', '20181121'),
        (16, 103, 6, '20181026', '20181122'),
        (17, 100, 6, '20181027', '20181123'),
        (18, 101, 6, '20181028', '20181124'),
        (19, 102, 6, '20181029', '20181125'),
        (20, 103, 6, '20181030', '20181126'),
        (1, 100, 7, '20181021', '20181117'),
        (2, 101, 7, '20181022', '20181118'),
        (3, 102, 7, '20181023', '20181119'),
        (4, 103, 7, '20181024', '20181120'),
        (5, 100, 7, '20181025', '20181121'),
        (6, 101, 7, '20181026', '20181122'),
        (7, 102, 7, '20181027', '20181123'),
        (8, 103, 7, '20181028', '20181124'),
        (9, 100, 7, '20181029', '20181125'),
        (10, 101, 7, '20181030', '20181126')
;

SELECT * FROM tbl_branch;
SELECT * FROM tbl_publisher;
SELECT * FROM tbl_books;
SELECT * FROM tbl_authors;
SELECT * FROM tbl_book_copies;
SELECT * FROM tbl_borrower;
SELECT * FROM tbl_book_loans;