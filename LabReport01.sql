DROP DATABASE IF EXISTS library_lab;
CREATE DATABASE library_lab;
USE library_lab;


CREATE TABLE MEMBER (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Age INT CHECK (Age >= 12),
    Gender ENUM('Male','Female')
);

-- Insert 5 members
INSERT INTO MEMBER VALUES
(1,'Rahim Uddin','rahim@gmail.com',22,'Male'),
(2,'Karim Ahmed','karim@gmail.com',25,'Male'),
(3,'Ayesha Khan','ayesha@gmail.com',21,'Female'),
(4,'Fatima Noor','fatima@gmail.com',23,'Female'),
(5,'Tanvir Hasan','tanvir@gmail.com',20,'Male');

-- Error example: duplicate email
-- INSERT INTO MEMBER VALUES (6,'Rahim  Khan','rahim@gmail.com',24,'Male');


CREATE TABLE BOOK (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(50) NOT NULL UNIQUE,
    Price DECIMAL(6,2) CHECK (Price >= 0),
    Status ENUM('AVAILABLE','BORROWED') DEFAULT 'AVAILABLE'
);


INSERT INTO BOOK VALUES
(101,'Database Systems','ISBN101',450.50,'AVAILABLE'),
(102,'C Programming','ISBN102',350.00,'AVAILABLE'),
(103,'Data Structures','ISBN103',500.75,'AVAILABLE'),
(104,'Algorithms','ISBN104',600.00,'AVAILABLE'),
(105,'Operating Systems','ISBN105',550.20,'AVAILABLE');

-- Error example: negative price
-- INSERT INTO BOOK VALUES(106,'Test Book','ISBN106',-50,'AVAILABLE');







CREATE TABLE LOAN (
    LoanID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    FOREIGN KEY (MemberID) REFERENCES MEMBER(MemberID),
    FOREIGN KEY (BookID) REFERENCES BOOK(BookID)
);

INSERT INTO LOAN VALUES  (1,1,101),
						 (2,2,102),
						 (3,3,103),
						 (4,4,104),
						 (5,5,105),
						 (6,1,103);

-- Error example: missing MemberID
-- INSERT INTO LOAN VALUES(7,20,101);










-- Add phone column in MEMBER table
ALTER TABLE MEMBER   ADD Phone VARCHAR(15) NOT NULL DEFAULT 'N/A';
DESCRIBE MEMBER;


-- Modify price type in BOOK table
ALTER TABLE BOOK  MODIFY Price DECIMAL(8,2);
SELECT * FROM BOOK;

-- Status column to Availability
ALTER TABLE BOOK  CHANGE Status Availability ENUM('AVAILABLE','BORROWED') DEFAULT 'AVAILABLE';
SELECT * FROM BOOK;

-- Drop Gender column from MEMBER table 
ALTER TABLE MEMBER  DROP COLUMN Gender;
SELECT * FROM  MEMBER;

-- Add check constraint for phone
ALTER TABLE MEMBER ADD CONSTRAINT Member_Phone CHECK (Phone <> '');
SELECT * FROM MEMBER;
DESCRIBE MEMBER;

-- Rename table LOAN to BORROW
RENAME TABLE LOAN TO BORROW;
SELECT * FROM BORROW;