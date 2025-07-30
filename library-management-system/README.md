# Library Management System (SQL Project)

## Project Description

The Library Management System is a database-driven application designed to manage a library’s book inventory, patron records, and book lending activities. The system allows for efficient tracking of books, authors, patrons, and loan transactions. Key features include database creation, table relationships, data manipulation, automation through stored procedures and triggers, and reporting via SQL queries.

---

## Syllabus & Learning Resources

### SQL Fundamentals

SQL (Structured Query Language) is fundamental in data engineering for managing and querying relational databases. It allows data engineers to retrieve, manipulate, and analyze data efficiently using commands like SELECT, INSERT, UPDATE, and DELETE. SQL is essential for designing and optimizing database schemas, ensuring data integrity, and performing complex queries to support analytics and reporting. Its ability to handle large datasets and integrate with various data platforms makes SQL a critical tool for structuring and managing data in data engineering workflows.

#### Topics & Resources

- **Introduction to RDBMS:** [study.com](https://study.com/academy/course/analytics-103-intro-to-relational-databases-sql.html)
- **SQL:** [Khan Academy](https://www.khanacademy.org/computing/computer-programming/sql)
- **SQL Syntax:** [TutorialsPoint](https://www.tutorialspoint.com/sql/sql-syntax.htm)
- **CRUD Operation:** [JavaTpoint](https://www.javatpoint.com/crud-operations-in-sql)
- **JOIN Operations:** [GeeksforGeeks](https://www.geeksforgeeks.org/sql-join-set-1-inner-left-right-and-full-joins/)
- **Aggregation and Grouping:** [Data Carpentry](https://datacarpentry.org/sql-ecology-lesson/02-sql-aggregation.html)
- **CTE and Window Functions:** [Dev.to](https://dev.to/mrpercival/sql-common-table-expressions-and-window-functions-25ce)
- **View and Materialized View:** [Dev.to](https://dev.to/mrpercival/sql-common-table-expressions-and-window-functions-25ce)
- **Store Procedure, Functions and Triggers:** [Dev.to](https://dev.to/mrpercival/sql-common-table-expressions-and-window-functions-25ce)
- **Indexing in SQL:** [Atlassian](https://www.atlassian.com/data/sql/how-indexing-works)

### Query Writing Pattern and SQL Optimization

- **Query Writing Pattern:** [Metabase](https://www.metabase.com/learn/grow-your-data-skills/learn-sql/working-with-sql/sql-best-practices)
- **SQL Optimization:** [Developer Nation](https://www.developernation.net/blog/12-ways-to-optimize-sql-queries-in-database-management/)

### Practice

- **SQL Tutorials:** [W3Schools](https://www.w3schools.com/sql/)
- **SQL Practice Problems:** [LeetCode](https://leetcode.com/studyplan/top-sql-50/)
- **SQL Windows Functions:** [LearnSQL](https://learnsql.com/blog/sql-window-functions-practice-exercises/)
- **SQL Store Procedure Exercise:** [Wise Owl](https://www.wiseowl.co.uk/sql/exercises/standard/stored-procedures/)
- **SQL Challenge:** [8 Week SQL Challenge](https://8weeksqlchallenge.com/)

---

## Project

### Library Management System

**Objective:**
Develop a database system to manage a library’s book inventory, patron records, and book lending activities. The project will involve database creation, table relationships, data manipulation, and automation.

#### Components

1. **Database Creation:**
   - Create Database: Set up a database named `LibraryManagement`.
   - Create Tables: Define tables for `Books`, `Patrons`, `Loans`, and `Authors`.
2. **Table Structure:**
   - **Books:** BookID, Title, AuthorID, PublicationYear, Genre
   - **Authors:** AuthorID, Name, DateOfBirth
   - **Patrons:** PatronID, Name, MembershipDate
   - **Loans:** LoanID, BookID, PatronID, LoanDate, ReturnDate
3. **Data Insertion:**
   - Insert Sample Data: Populate the tables with sample records for books, authors, patrons, and loans.
4. **Joins and Aggregation:**
   - Query Example: Write SQL queries to:
     - List all books and their authors using JOIN.
     - Find the total number of books borrowed by each patron.
     - Calculate the average number of books loaned per month.
5. **Procedures:**
   - Create Procedure: Write a stored procedure to add a new book to the Books table.
   - Procedure Example: The procedure should insert a book and update the author’s details if the author is new.
6. **Triggers:**
   - Create Trigger: Implement a trigger that automatically updates the ReturnDate in the Loans table when a book is returned.
   - Trigger Example: Update the Loan record with the current date when a ReturnDate is set.

---

## Technology Identification

**Core Technology:**

- **Relational Database Management System (RDBMS):**
  - MySQL (recommended for this project)

**Tools You’ll Need:**

- MySQL Server (local or cloud)
- SQL Client: MySQL Workbench, DBeaver, or MySQL CLI
- (Optional) Scripting language (Python, Node.js, etc.) for automation
- (Optional) Git for version control

---

## How to Approach the Project

1. **Set Up the Database:**

   - Install MySQL.
   - Run the provided SQL script (`library_management.sql`) to create the database and tables.

2. **Design and Create Tables:**

   - Tables: `Books`, `Authors`, `Patrons`, `Loans` with specified columns and relationships.

3. **Insert Sample Data:**

   - Sample records for each table are included in the script.

4. **Write SQL Queries:**

   - Example queries for joins and aggregations are provided.

5. **Create Stored Procedures:**

   - A procedure to add a new book and update author details if needed is included.

6. **Implement Triggers:**
   - A trigger to update the `ReturnDate` in the `Loans` table when a book is returned is included.

---

## What Is This Project?

This is a classic database design and management project, often used to learn and demonstrate skills in:

- Database schema design
- Data manipulation with SQL
- Writing advanced SQL queries (joins, aggregations)
- Automating tasks with stored procedures and triggers

---

## SQL Script Overview

All SQL code for this project is in `library_management.sql`:

- **Database and Table Creation**
- **Sample Data Insertion**
- **Example Queries**
- **Stored Procedure**
- **Trigger**

---

## How to Use

1. Open your SQL client (MySQL Workbench, DBeaver, or CLI).
2. Copy and run the contents of `library_management.sql`.
3. Test the queries and procedures.
4. You can add more sample data or queries as needed.

---

## Example SQL Syllabus Topics Covered

- RDBMS Fundamentals
- SQL Syntax
- CRUD Operations
- JOIN Operations
- Aggregation and Grouping
- Stored Procedures, Functions, and Triggers
- Query Writing Patterns and Optimization

---

## Fellowship Assignment Note

This project is designed for internship/fellowship assignment purposes and focuses on SQL fundamentals and practical query writing. No complex application code is required—just SQL!
