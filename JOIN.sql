SELECT * FROM milandb2.members;

-- DROP TABLE IF EXISTS branch; 
CREATE TABLE branch(
branch_id VARCHAR(10) PRIMARY KEY,
	manager_id VARCHAR(10),
	branch_address	VARCHAR(55),
    contact_no VARCHAR(10)
    );

CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(25),
    position VARCHAR(15),
    salary INT,
    branch_id VARCHAR(25)
);
-- select *from branch;

-- ALTER TABLE branch
-- MODIFY COLUMN contact_no VARCHAR(20);
USE milandb2;




--  ALTER TABLE books
--  ALTER COLUMN category  TYPE VARCHAR(20);employees

 -- DROP TABLE IF EXISTS books
CREATE TABLE books (
    isbn VARCHAR(25) PRIMARY KEY,
    book_title VARCHAR(75),
    category VARCHAR(10),
    rental_price FLOAT,
    status VARCHAR(15),
    author VARCHAR(35),
    publisher VARCHAR(55)
);
SELECT
    b.isbn,
    b.book_title,
    i.issued_member_id,
    i.issued_book_name,
    b.publisher
FROM books b
INNER JOIN issued_status i
    ON b.isbn = i.issued_book_isbn;



CREATE TABLE members (

member_id VARCHAR(10) PRIMARY KEY,
member_name VARCHAR(25),
member_address VARCHAR(75),
reg_date DATE

);









CREATE TABLE issued_status  (
issued_id	VARCHAR(10)PRIMARY KEY,
issued_member_id VARCHAR(27),	-- fk
issued_book_name VARCHAR(75),
issued_date DATE,
issued_book_isbn VARCHAR(25), -- fk
issued_emp_id VARCHAR(10)-- fk
);






CREATE TABLE return_status (
return_id	VARCHAR(10) PRIMARY KEY,
issued_id	VARCHAR(10),
return_book_name VARCHAR(75),
return_date	 DATE,
return_book_isbn VARCHAR(20)

);

-- FOREIGN KEY

ALTER TABLE issued_status 
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members(member_id);
 


ALTER TABLE issued_status 
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn )
REFERENCES books(isbn);



ALTER TABLE issued_status 
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn )
REFERENCES books(isbn);


ALTER TABLE issued_status 
ADD CONSTRAINT fk_emploees
FOREIGN KEY (issued_emp_id)
REFERENCES employees(emp_id);



ALTER TABLE employees
ADD CONSTRAINT fk_branch 
FOREIGN KEY (branch_id )
REFERENCES branch(branch_id);


ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id )
REFERENCES issued_status(issued_id);








SELECT 
    i.issued_id,
    m.member_name,
    b.book_title
FROM issued_status i
INNER JOIN members m
    ON i.issued_member_id = m.member_id
INNER JOIN books b
    ON i.issued_book_isbn = b.isbn;



SELECT
    e.emp_id,
    e.emp_name,
    e.position,
    e.salary,
    b.branch_id,
    b.branch_address,
    b.contact_no
FROM employees e
INNER JOIN branch b
    ON e.branch_id = b.branch_id;


SELECT 
    m.member_id,
    m.member_name,
    i.issued_id
FROM members m
LEFT JOIN issued_status i
    ON m.member_id = i.issued_member_id;
    
    
    
    
    
    
    
    SELECT 
    m.member_id,
    m.member_name,
    i.issued_id
FROM members m
right JOIN issued_status i
    ON m.member_id = i.issued_member_id;
    
    
   SELECT *
FROM employees e
FULL JOIN branch b
ON e.branch_id = b.branch_id;
    
    