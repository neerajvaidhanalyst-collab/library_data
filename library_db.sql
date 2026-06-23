CREATE DATABASE library_db;
USE library_db;
drop database library_db;

CREATE TABLE books (
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    rental_price float,
    status VARCHAR(20),
    author VARCHAR(255),
    publisher VARCHAR(255)
);


CREATE TABLE members (
    member_id VARCHAR(10) PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    member_address VARCHAR(255),
    reg_date DATE
);

CREATE TABLE branch (
    branch_id VARCHAR(10) PRIMARY KEY,
    manager_id VARCHAR(10),
    branch_address VARCHAR(255),
    contact_no VARCHAR(20)
);

CREATE TABLE employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    emp_name VARCHAR(100),
    position VARCHAR(50),
    salary float,
    branch_id VARCHAR(10)
    );
    
CREATE TABLE issued_status (
    issued_id VARCHAR(10) PRIMARY KEY,
    issued_member_id VARCHAR(10),
    issued_book_name VARCHAR(255),
    issued_date DATE,
    issued_book_isbn VARCHAR(20),
    issued_emp_id VARCHAR(10)

    
);

CREATE TABLE return_status (
    return_id VARCHAR(10) PRIMARY KEY,
    issued_id VARCHAR(10), 				-- fk
    return_book_name VARCHAR(255),
    return_date DATE,
    return_book_isbn VARCHAR(20)
);

alter table return_status
add constraint fk_issuede
foreign key (issued_id)
references issued_status(issued_id);


alter table issued_status
add constraint fk_book
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table issued_status
add constraint fk_issued
foreign key (issued_member_id)
references members(member_id );

