# LabReport01-Constraints-Alter

## Overview

This project creates a simple **library database** using MySQL.
It includes tables for **members, books, and loans**. Different constraints such as **PRIMARY KEY, UNIQUE, FOREIGN KEY, and CHECK** are used to maintain data integrity.

---

## Database

The database used in this project is:

```
library_lab
```

---

## Tables

### MEMBER

Stores information about library members.

Columns:

* MemberID – Primary Key
* FullName – Cannot be NULL
* Email – Must be unique
* Age – Must be 12 or above
* Gender – Male or Female

5 member records are inserted.

---

### BOOK

Stores information about books.

Columns:

* BookID – Primary Key
* Title – Cannot be NULL
* ISBN – Unique identifier for each book
* Price – Must be greater than or equal to 0
* Status – AVAILABLE or BORROWED

5 book records are inserted.

---

### LOAN

Stores information about borrowed books.

Columns:

* LoanID – Primary Key
* MemberID – References MEMBER table
* BookID – References BOOK table

6 loan records are inserted.

---

## Error Examples

Some queries are commented in the script to show constraint errors.

Examples:

* Duplicate Email in MEMBER
* Negative Price in BOOK
* Invalid MemberID in LOAN

These queries demonstrate how constraints prevent invalid data.

---

## Table Modifications

Several changes are made using `ALTER TABLE`.

* Add **Phone** column in MEMBER with default value `N/A`
* Change **Price** data type to `DECIMAL(8,2)`
* Rename **Status** column to **Availability**
* Remove **Gender** column from MEMBER
* Add **CHECK constraint** for Phone
* Rename **LOAN table** to **BORROW**

---

## Final Tables

After all operations, the database contains:

* MEMBER
* BOOK
* BORROW

This project demonstrates basic **database creation, constraints, data insertion, and table modification in MySQL**.
