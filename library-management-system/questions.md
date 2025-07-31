# Library Management System SQL Interview Questions & Answers

**Role:** Data Intern
**Course Duration:** Month 1: SQL Foundations (May 7th - June 3rd, 2025)

This document contains detailed interview questions and answers covering all expectations and extra learning tips from the SQL course and the Library Management System project. Difficulty is rated on a scale of 1 (easy) to 10 (complex).

---

## Questions & Answers

### 1. What is an RDBMS? (Difficulty: 2/10)

**Answer:**
A Relational Database Management System (RDBMS) is a type of database system that stores data in tables with rows and columns. It uses relationships (foreign keys) to link tables and supports SQL for querying and managing data. Examples include MySQL, PostgreSQL, and Oracle.

---

### 2. What are the basic SQL CRUD operations? (Difficulty: 2/10)

**Answer:**
CRUD stands for Create, Read, Update, and Delete. These are the four basic operations in SQL:

- **CREATE:** Adds new records (e.g., `INSERT INTO`)
- **READ:** Retrieves data (e.g., `SELECT`)
- **UPDATE:** Modifies existing records (e.g., `UPDATE`)
- **DELETE:** Removes records (e.g., `DELETE FROM`)

---

### 3. Write a simple SQL query to select all books from the Books table. (Difficulty: 1/10)

**Answer:**

```sql
SELECT * FROM Books;
```

---

### 4. What is a JOIN in SQL? Name its types. (Difficulty: 3/10)

**Answer:**
A JOIN combines rows from two or more tables based on a related column. Types include:

- **INNER JOIN:** Returns matching rows from both tables.
- **LEFT JOIN:** Returns all rows from the left table and matching rows from the right.
- **RIGHT JOIN:** Returns all rows from the right table and matching rows from the left.
- **FULL JOIN:** Returns all rows when there is a match in either table.

---

### 5. Write a query to list all books and their authors. (Difficulty: 3/10)

**Answer:**

```sql
SELECT Books.Title, Authors.Name AS Author
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;
```

---

### 6. What is aggregation in SQL? Give examples. (Difficulty: 3/10)

**Answer:**
Aggregation refers to operations that summarize data, such as `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`. Example:

```sql
SELECT COUNT(*) FROM Loans;
SELECT AVG(PublicationYear) FROM Books;
```

---

### 7. How do you find the total number of books borrowed by each patron? (Difficulty: 4/10)

**Answer:**

```sql
SELECT Patrons.Name, COUNT(Loans.LoanID) AS TotalBorrowed
FROM Patrons
LEFT JOIN Loans ON Patrons.PatronID = Loans.PatronID
GROUP BY Patrons.PatronID, Patrons.Name;
```

---

### 8. What is GROUP BY and why is it used? (Difficulty: 3/10)

**Answer:**
`GROUP BY` is used to group rows that have the same values in specified columns, often for aggregation. For example, grouping loans by patron to count how many books each borrowed.

---

### 9. What is a Common Table Expression (CTE)? (Difficulty: 5/10)

**Answer:**
A CTE is a temporary result set defined within a query using `WITH`. It improves readability and can be referenced multiple times in a query. Example:

```sql
WITH RecentLoans AS (
  SELECT * FROM Loans WHERE LoanDate > '2025-07-01'
)
SELECT * FROM RecentLoans;
```

---

### 10. Explain Window Functions with an example. (Difficulty: 6/10)

**Answer:**
Window functions perform calculations across a set of table rows related to the current row. Example:

```sql
SELECT PatronID, LoanDate,
  COUNT(*) OVER (PARTITION BY PatronID) AS TotalLoans
FROM Loans;
```

---

### 11. What is a View and a Materialized View? (Difficulty: 5/10)

**Answer:**

- **View:** A virtual table based on a SQL query. It does not store data itself.
- **Materialized View:** Stores the result of a query physically and can be refreshed. MySQL does not support materialized views natively, but they can be simulated using tables and scheduled updates.

---

### 12. How do you optimize SQL queries? (Difficulty: 6/10)

**Answer:**

- Use proper indexes on columns used in WHERE, JOIN, and ORDER BY.
- Avoid SELECT \*; select only needed columns.
- Use LIMIT for large result sets.
- Analyze queries with EXPLAIN.
- Avoid unnecessary subqueries and use JOINs efficiently.

**Tip:** Use `EXPLAIN` to analyze query performance and learn about indexing strategies.

---

### 13. What is indexing in SQL and why is it important? (Difficulty: 5/10)

**Answer:**
Indexing creates a data structure that improves the speed of data retrieval operations. It is important for optimizing query performance, especially on large tables. However, excessive indexing can slow down write operations.

---

### 14. What is a stored procedure? Write one to add a new book. (Difficulty: 5/10)

**Answer:**
A stored procedure is a set of SQL statements that can be executed as a program. Example:

```sql
DELIMITER //
CREATE PROCEDURE AddNewBook(
    IN bookTitle VARCHAR(200),
    IN authorName VARCHAR(100),
    IN authorDOB DATE,
    IN pubYear INT,
    IN genre VARCHAR(50)
)
BEGIN
    DECLARE authorId INT;
    SELECT AuthorID INTO authorId FROM Authors WHERE Name = authorName LIMIT 1;
    IF authorId IS NULL THEN
        INSERT INTO Authors (Name, DateOfBirth) VALUES (authorName, authorDOB);
        SET authorId = LAST_INSERT_ID();
    END IF;
    INSERT INTO Books (Title, AuthorID, PublicationYear, Genre)
    VALUES (bookTitle, authorId, pubYear, genre);
END //
DELIMITER ;
```

---

### 15. What is a trigger in SQL? Give an example from the project. (Difficulty: 6/10)

**Answer:**
A trigger is a database object that automatically executes a specified action in response to certain events on a table. Example:

```sql
DELIMITER //
CREATE TRIGGER UpdateReturnDate
BEFORE UPDATE ON Loans
FOR EACH ROW
BEGIN
    IF NEW.ReturnDate IS NOT NULL AND OLD.ReturnDate IS NULL THEN
        SET NEW.ReturnDate = CURDATE();
    END IF;
END //
DELIMITER ;
```

---

### 16. How would you migrate this project to another RDBMS like PostgreSQL? (Difficulty: 7/10)

**Answer:**

- Review SQL syntax differences (e.g., auto-increment vs. serial).
- Adjust stored procedure and trigger syntax.
- Test queries and schema in the new RDBMS.
- Use tools like pgloader or manual export/import for data migration.

**Tip:** Research compatibility and features of the target RDBMS before migration.

---

### 17. What is an SQL Explain Plan and how do you use it? (Difficulty: 6/10)

**Answer:**
An Explain Plan shows how the SQL engine executes a query, including table scans, index usage, and join methods. Use `EXPLAIN SELECT ...` to analyze and optimize queries.

---

### 18. How do you handle query performance issues with large joins? (Difficulty: 7/10)

**Answer:**

- Use indexes on join columns.
- Limit result sets with WHERE and LIMIT.
- Break complex joins into smaller queries if possible.
- Use EXPLAIN to analyze query execution.

**Tip:** Investigate query plans and indexing strategies for large datasets.

---

### 19. What are the benefits of using stored procedures and triggers in a project? (Difficulty: 5/10)

**Answer:**

- Encapsulate business logic in the database.
- Improve performance by reducing client-server communication.
- Ensure data integrity and automate repetitive tasks.

---

### 20. How would you present and explain your Library Management System project in an interview? (Difficulty: 4/10)

**Answer:**

- Describe the schema design and table relationships.
- Explain how CRUD operations, joins, aggregations, procedures, and triggers are implemented.
- Demonstrate sample queries and discuss optimization techniques.
- Highlight learning outcomes and any extra research (e.g., indexing, migration).

---

## Extra Learning Tips

- Explore different SQL dialects (MySQL, PostgreSQL).
- Learn about database indexing and query optimization.
- Investigate query performance and SQL Explain Plans.
- Research advanced indexing and partitioning strategies.
- Consider how the project would translate to other database management systems.
