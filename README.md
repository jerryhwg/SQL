# SQL-Coding-Projects

### Inner Join

Return data from all rows where there is matching data shared between the two table columns

    ```SQL
    SELECT * 
    FROM table_A 
    INNER JOIN table_B 
    ON table_B.id = table_A.id;
    ```

### Outer Join

Return all records of data from both tables despite whether there is any actual relation link between the two tables
(will query and return all records from both tables, regardless of whether or not the other table has a matching value)

    ```SQL
    SELECT table_A.username, table_A.fullname, table_B.zipcodes
    FROM table_A
    FULL OUTER JOIN table_B
    WHERE table_B.id = table_A.id;
    ```

### Left Join

Return all records of data from the left table and any related data from the right table, and if there happens to be rows of data that is not matching the criteria, then it will be represented by Null values.
(return all rows from the left table, even if there are no matches within the right table)
SELECT table_A.id, table_A.username, table_B.id, table_B.phoneNumber

    ```SQL
    FROM table_A
    LEFT JOIN table_B ON table_B.id = table.A.id
    ```

### Right Join

Return data from the right table and any related data from the left table, and in the event there is data that does not match it will be reflected by a Null value.

    ```SQL
    SELECT table_A.wholesale, table_A.products, table_B.vendor, table_B.contact
    FROM table_A
    RIGHT JOIN table_B ON table_B.id = table_A.id
    WHERE table_A.id LIKE 'de%';
    ```

### Left Outer Join

The result set of a LEFT OUTER join contains all rows from both tables that meet the WHERE clause criteria, same as an INNER join result set. 
In addition, any rows from the left table that do not have a matching row that exists in the right table will also be included in the result set.
The columns being selected from the right side table will return NULL values.
It can also be used to return a result set that contains all rows in the first table that do not exist in the second table by testing in the WHERE clause the value of a NOT NULL column in the second table having a NULL value. Same as using a WHERE NOT EXISTS sub-query.


    ```SQL
    SELECT a1.borrower_name AS "Borrower with no book checked out"
    FROM tbl_borrower a1
    LEFT OUTER JOIN tbl_book_loans a2 ON a1.card_no = a2.card_no
    WHERE a2.card_no IS NULL
    ```

### Right Outer Join

It preserves the unmatched rows from the second (right) table, joining them with a NULL in the shape of the first (left) table. 
A LEFT OUTER JOIN B is equivalent to B RIGHT OUTER JOIN A, with the columns in a different order.

    ```SQL
    SELECT a1.branch_name AS "Branch Name", COUNT(a2.book_id) AS "Books Loaned"
    FROM tbl_branch a1
    RIGHT OUTER JOIN tbl_book_loans a2 ON a1.branch_id = a2.branch_id
    GROUP BY a1.branch_name;
    ```

### HAVING clause

SELECT should return only rows where aggregate values meet the specified conditions