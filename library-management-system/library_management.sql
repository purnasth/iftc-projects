-- Library Management System SQL Codebase
-- Author: Fellowship Assignment
-- Date: Week 1 (May 7th - June 3rd, 2025)

-- 1. Database and Table Creation
CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

-- Authors table
CREATE TABLE IF NOT EXISTS Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE
);

-- Books table
CREATE TABLE IF NOT EXISTS Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT,
    PublicationYear INT,
    Genre VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Patrons table
CREATE TABLE IF NOT EXISTS Patrons (
    PatronID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    MembershipDate DATE
);

-- Loans table
CREATE TABLE IF NOT EXISTS Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    PatronID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID)
);

-- 2. Sample Data Insertion
INSERT INTO Authors (Name, DateOfBirth) VALUES
('J.K. Rowling', '1965-07-31'),
('George Orwell', '1903-06-25'),
('Jane Austen', '1775-12-16');

INSERT INTO Books (Title, AuthorID, PublicationYear, Genre) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy'),
('1984', 2, 1949, 'Dystopian'),
('Pride and Prejudice', 3, 1813, 'Romance');

INSERT INTO Patrons (Name, MembershipDate) VALUES
('Alice Smith', '2024-01-15'),
('Bob Johnson', '2024-03-22');

INSERT INTO Loans (BookID, PatronID, LoanDate, ReturnDate) VALUES
(1, 1, '2025-07-01', NULL),
(2, 2, '2025-07-10', '2025-07-20'),
(3, 1, '2025-07-15', NULL);

-- 3. Example Queries
-- a) List all books and their authors
SELECT Books.Title, Authors.Name AS Author
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- b) Find the total number of books borrowed by each patron
SELECT Patrons.Name, COUNT(Loans.LoanID) AS TotalBorrowed
FROM Patrons
LEFT JOIN Loans ON Patrons.PatronID = Loans.PatronID
GROUP BY Patrons.PatronID, Patrons.Name;

-- c) Calculate the average number of books loaned per month
SELECT
    YEAR(LoanDate) AS Year,
    MONTH(LoanDate) AS Month,
    COUNT(*) AS BooksLoaned,
    AVG(COUNT(*)) OVER () AS AvgBooksLoanedPerMonth
FROM Loans
GROUP BY YEAR(LoanDate), MONTH(LoanDate);

-- 4. Stored Procedure to Add a New Book
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

-- 5. Trigger to Update ReturnDate
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
