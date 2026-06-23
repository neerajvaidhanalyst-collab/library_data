

# 📚 Library Management System (SQL Project)

## 📖 Project Overview

This project is a **Library Management System Database** built using SQL. It demonstrates database design, table creation, relationships, and query operations commonly used in real-world library management systems.

The database stores information about:

* Books
* Members
* Employees
* Library Branches
* Book Issuance Records
* Book Return Records

The project also includes various SQL queries for data manipulation, reporting, and analysis.

---

## 🛠️ Technologies Used

* SQL
* MySQL

---

## 📂 Database Structure

### Books Table

Stores information about books available in the library.

| Column       | Description            |
| ------------ | ---------------------- |
| isbn         | Unique Book Identifier |
| book_title   | Title of the Book      |
| category     | Book Category          |
| rental_price | Rental Cost            |
| status       | Availability Status    |
| author       | Author Name            |
| publisher    | Publisher Name         |

---

### Members Table

Stores registered library members.

| Column         | Description       |
| -------------- | ----------------- |
| member_id      | Member ID         |
| member_name    | Member Name       |
| member_address | Address           |
| reg_date       | Registration Date |

---

### Branch Table

Stores branch details.

| Column         | Description    |
| -------------- | -------------- |
| branch_id      | Branch ID      |
| manager_id     | Branch Manager |
| branch_address | Branch Address |
| contact_no     | Contact Number |

---

### Employees Table

Stores employee information.

| Column    | Description       |
| --------- | ----------------- |
| emp_id    | Employee ID       |
| emp_name  | Employee Name     |
| position  | Job Position      |
| salary    | Salary            |
| branch_id | Branch Assignment |

---

### Issued Status Table

Stores book issuance records.

| Column           | Description          |
| ---------------- | -------------------- |
| issued_id        | Issue Transaction ID |
| issued_member_id | Member ID            |
| issued_book_name | Book Name            |
| issued_date      | Issue Date           |
| issued_book_isbn | Book ISBN            |
| issued_emp_id    | Employee ID          |

---

### Return Status Table

Stores returned book records.

| Column           | Description           |
| ---------------- | --------------------- |
| return_id        | Return Transaction ID |
| issued_id        | Linked Issue ID       |
| return_book_name | Returned Book         |
| return_date      | Return Date           |
| return_book_isbn | Book ISBN             |

---

## 🔗 Database Relationships

* One member can issue multiple books.
* One employee can process multiple book issuances.
* One branch can have multiple employees.
* Each issued book can have a corresponding return record.
* Foreign key constraints ensure data integrity.

---

## 🚀 SQL Tasks Performed

### Data Manipulation (DML)

* Insert a new book record.
* Update member information.
* Delete issued book records.

### Data Retrieval

* Retrieve books issued by a specific employee.
* Find books belonging to a specific category.
* List books that have not yet been returned.

### Aggregation & Analysis

* Count books issued.
* Calculate rental income by category.
* Find members who issued multiple books.

### Advanced SQL Operations

* JOIN operations.
* GROUP BY and HAVING clauses.
* Summary table creation using CTAS (Create Table As Select).
* Foreign Key implementation.

---

## 📊 Sample Queries Included

### Find Books Issued by an Employee

```sql
SELECT *
FROM issued_status
WHERE issued_emp_id = 'E101';
```

### Books Not Yet Returned

```sql
SELECT *
FROM issued_status ist
LEFT JOIN return_status rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;
```

### Rental Income by Category

```sql
SELECT
    b.category,
    SUM(b.rental_price)
FROM issued_status ist
JOIN books b
ON b.isbn = ist.issued_book_isbn
GROUP BY b.category;
```

---

## 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Database Design
* SQL DDL Commands
* SQL DML Commands
* Joins
* Aggregate Functions
* Constraints and Foreign Keys
* Data Analysis using SQL
* Real-world Relational Database Modeling

---

## 📁 Files Included

```text
library_db.sql
│
├── Database Creation
├── Table Creation
├── Primary Keys
└── Foreign Key Constraints

library_db_question_solution.sql
│
├── Data Manipulation Queries
├── Data Retrieval Queries
├── Reporting Queries
└── Analytical SQL Queries

