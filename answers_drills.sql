/* DRILL 1 - 67 
All information from the habitat table.
*/
SELECT * FROM tbl_habitat;

/* DRILL 2 - 68
Retrieve all names from the species_name column that have a species_order value of 3.
*/
SELECT species_name FROM tbl_species WHERE species_order = 3;

/* DRILL 3 - 69
Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.
*/
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;

/* DRILL 4 - 70
Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.
*/
SELECT a1.species_name, a2.nutrition_id 
FROM tbl_species a1
INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
WHERE nutrition_id BETWEEN 2202 AND 2206 ORDER BY nutrition_id
;

/* INNERT JOIN: all rows where directly matching between the two table columns */

/* DRILL 5 - 71
Retrieve all names within the species_name column using the alias "Species Name:" from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table.
*/

SELECT a1.species_name AS "Species Name:", a2.nutrition_type AS "Nutrition Type:"
FROM tbl_species a1
LEFT JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
;

/* LEFT JOIN: all records of data from the left table (tbl_species) and any related data from the right table (tbl_nutrition) */

/* DRILL 6 - 72
From the specialist table, retrieve the first and last name and contact number of those that provide care for the penguins from the species table.
*/

SELECT a1.species_name AS "Species Name:", a3.specialist_fname AS "First Name:", a3.specialist_lname AS "Last Name:", a3.specialist_contact AS "CONTACT:"
FROM tbl_species a1
INNER JOIN tbl_care a2 ON a2.care_id = a1.species_care
INNER JOIN tbl_specialist a3 ON a3.specialist_id = a2.care_specialist
WHERE a1.species_name = 'penguin'
;

/* Join three tables using inner join chains */

/* DRILL 7 - 73
Create a database with two tables. Assign a foreign key constraint on one table that shares related data with the primary key on the second table. Finally, create a statement that queries data from both tables.
Table A: first name, last name
Table B: phone number, address
*/

CREATE DATABASE db_contact

USE db_contact

CREATE TABLE tbl_info (
    info_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    phone_number VARCHAR(50) NOT NULL,
    home_address VARCHAR(100) NOT NULL
);

INSERT INTO tbl_info
    (phone_number, home_address)
    VALUES
    ('123-1234', 'Seattle, WA'),
    ('124-1245', 'Renton, WA'),
    ('125-1256', 'Bellevue, WA')
;

CREATE TABLE tbl_person (
    person_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
    person_fname VARCHAR(50) NOT NULL,
    person_lname VARCHAR(50) NOT NULL,
    person_info INT NOT NULL CONSTRAINT fk_info_id FOREIGN KEY REFERENCES tbl_info(info_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_person
    (person_fname, person_lname, person_info)
    VALUES
    ('james', 'lee', 1),
    ('jane', 'stacy', 2),
    ('mary', 'anne', 3)
;

SELECT * FROM tbl_person;
SELECT * FROM tbl_info;

SELECT a1.person_fname, a1.person_lname, a2.phone_number, a2.home_address
FROM tbl_person a1
INNER JOIN tbl_info a2 ON a2.info_id = a1.person_info
;