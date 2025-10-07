-- Creating the Database
CREATE DATABASE LIBRARYDB;

USE LIBRARYDB;

SET SQL_SAFE_UPDATES = 0;
CREATE TABLE BOOKS(
BOOKID INT AUTO_INCREMENT PRIMARY KEY,
TITLE VARCHAR(100) NOT NULL,
AUTHOR VARCHAR(50) NOT NULL,
GENRE VARCHAR(50),
PUBLISHEDYEAR INT,
COPIESAVAILABE INT DEFAULT 1
);

ALTER TABLE BOOKS
CHANGE COLUMN COPIESAVAILABE COPIESAVAILABLE INT DEFAULT 1;

CREATE TABLE MEMBERS(
MEMBERID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
AGE INT,
EMAIL VARCHAR(50) UNIQUE,
MEMBERSHIPDATE DATE NOT NULL
);

CREATE TABLE STAFF(
STAFFID INT AUTO_INCREMENT PRIMARY KEY,
NAME VARCHAR(50) NOT NULL,
ROLE VARCHAR(50) NOT NULL,
HIREDATE DATE NOT NULL,
SALARY DECIMAL(10,2)
);

CREATE TABLE BORROWINGS(
BORROWID INT AUTO_INCREMENT PRIMARY KEY,
MEMBERID INT,
BOOKID INT,
BORROWDATE DATE NOT NULL,
RETURNDATE DATE,
FOREIGN KEY (MEMBERID) REFERENCES MEMBERS(MEMBERID),
FOREIGN KEY(BOOKID) REFERENCES BOOKS(BOOKID)
);

INSERT INTO BOOKS(TITLE,AUTHOR,GENRE,PUBLISHEDYEAR,COPIESAVAILABLE)
VALUES
("PROGRAMMING IN C++","BJARRNE STROUSTRUP","ENGINEERING PROGRAMMING",1985,120);

INSERT INTO MEMBERS (NAME, AGE, EMAIL, MEMBERSHIPDATE)
VALUES
('AAKASH SINGH', 19, 'AAKASH234@EMAIL.COM', '2025-03-12');

INSERT INTO STAFF(NAME,ROLE,HIREDATE,SALARY)
VALUES
("VIJAY VEER SINGH","LIBRARIAN","2022-04-29",65000);

INSERT INTO BORROWINGS(MEMBERID,BOOKID,BORROWDATE,RETURNDATE)
VALUES
(1,1,"2025-10-01","2025-10-16");

SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;
SELECT * FROM STAFF;
SELECT * FROM BORROWINGS;

---------------------------------------------------------------------

-- DATABASE TABLE INSERTIONS
INSERT INTO BOOKS (TITLE, AUTHOR, GENRE, PUBLISHEDYEAR, COPIESAVAILABLE) VALUES
('Database Systems', 'Abraham Silberschatz', 'Database', 2010, 50),
('Algorithms Unlocked', 'Thomas Cormen', 'Algorithms', 2013, 70),
('Operating System Concepts', 'Silberschatz', 'Operating Systems', 2014, 60),
('Artificial Intelligence', 'Stuart Russell', 'AI', 2015, 90),
('Data Science Handbook', 'Jake VanderPlas', 'Data Science', 2016, 45),
('Deep Learning', 'Ian Goodfellow', 'AI', 2017, 40),
('Computer Networks', 'Andrew Tanenbaum', 'Networking', 2011, 85),
('Clean Code', 'Robert C. Martin', 'Software Engineering', 2008, 100),
('Java: The Complete Reference', 'Herbert Schildt', 'Programming', 2019, 120),
('Python Crash Course', 'Eric Matthes', 'Programming', 2019, 150),
('Programming in C WITH ADVANCED C++', 'Bjarne Stroustrup', 'Programming', 1985, 120),
('You Don’t Know JS', 'Kyle Simpson', 'JavaScript', 2018, 75),
('Machine Learning Yearning', 'Andrew Ng', 'AI', 2018, 200),
('C Programming Language', 'Dennis Ritchie', 'Programming', 1988, 180),
('Modern Operating Systems', 'Andrew Tanenbaum', 'Operating Systems', 2018, 60),
('Design Patterns', 'Erich Gamma', 'Software Engineering', 1994, 95),
('Compilers: Principles', 'Alfred Aho', 'Compilers', 2007, 50),
('Digital Logic Design', 'M. Morris Mano', 'Electronics', 2006, 70),
('Microprocessor Architecture', 'Ramesh Gaonkar', 'Electronics', 2002, 80),
('Artificial Neural Networks', 'Simon Haykin', 'AI', 2009, 45),
('SQL Cookbook', 'Anthony Molinaro', 'Database', 2016, 40),
('Learning PHP', 'David Sklar', 'Programming', 2015, 55),
('Learning JavaScript', 'Ethan Brown', 'Programming', 2017, 65),
('Learning Python', 'Mark Lutz', 'Programming', 2013, 95),
('Head First Java', 'Kathy Sierra', 'Programming', 2005, 110),
('HTML & CSS', 'Jon Duckett', 'Web Development', 2011, 150),
('JavaScript & JQuery', 'Jon Duckett', 'Web Development', 2014, 125),
('Node.js Design Patterns', 'Mario Casciaro', 'Programming', 2016, 80),
('React Up & Running', 'Stoyan Stefanov', 'Web Development', 2016, 100),
('Vue.js Up & Running', 'Callum Macrae', 'Web Development', 2018, 90),
('Pro Git', 'Scott Chacon', 'Software Tools', 2014, 120),
('Linux Bible', 'Christopher Negus', 'Operating Systems', 2015, 75),
('Hands-On Machine Learning', 'Aurélien Géron', 'AI', 2017, 60),
('Big Data Fundamentals', 'Thomas Erl', 'Data Science', 2016, 85),
('Cloud Computing', 'Rajkumar Buyya', 'Cloud', 2011, 70),
('Cryptography & Network Security', 'William Stallings', 'Security', 2012, 90),
('Information Security', 'Mark Stamp', 'Security', 2015, 60),
('Blockchain Basics', 'Daniel Drescher', 'Blockchain', 2017, 95),
('Kubernetes Up & Running', 'Brendan Burns', 'Cloud', 2019, 75),
('Docker Deep Dive', 'Nigel Poulton', 'Cloud', 2018, 55),
('Hadoop in Action', 'Chuck Lam', 'Big Data', 2011, 45),
('Data Mining Concepts', 'Jiawei Han', 'Data Science', 2012, 80),
('Software Testing', 'Ron Patton', 'Software Engineering', 2006, 65),
('Agile Estimating & Planning', 'Mike Cohn', 'Software Engineering', 2005, 60),
('Scrum Guide', 'Ken Schwaber', 'Software Engineering', 2017, 120),
('Lean Startup', 'Eric Ries', 'Management', 2011, 50),
('Refactoring', 'Martin Fowler', 'Software Engineering', 2018, 110),
('Continuous Delivery', 'Jez Humble', 'DevOps', 2010, 95),
('Site Reliability Engineering', 'Niall Richard Murphy', 'DevOps', 2016, 70),
('DevOps Handbook', 'Gene Kim', 'DevOps', 2016, 90);

INSERT INTO MEMBERS (NAME, AGE, EMAIL, MEMBERSHIPDATE) VALUES
('Aakash Singh', 19, 'aakash1@email.com', '2023-01-12'),
('Rohit Sharma', 21, 'rohit2@email.com', '2023-02-10'),
('Priya Mehta', 20, 'priya3@email.com', '2023-03-05'),
('Karan Verma', 23, 'karan4@email.com', '2023-04-08'),
('Simran Kaur', 22, 'simran5@email.com', '2023-05-01'),
('Anjali Gupta', 19, 'anjali6@email.com', '2023-06-15'),
('Deepak Yadav', 20, 'deepak7@email.com', '2023-07-19'),
('Neha Rathi', 21, 'neha8@email.com', '2023-08-03'),
('Suresh Das', 24, 'suresh9@email.com', '2023-09-21'),
('Alok Jain', 22, 'alok10@email.com', '2023-10-11'),
('Vikram Rana', 25, 'vikram11@email.com', '2023-01-25'),
('Sonali Bhatia', 20, 'sonali12@email.com', '2023-02-14'),
('Rahul Malhotra', 22, 'rahul13@email.com', '2023-03-29'),
('Meena Agarwal', 19, 'meena14@email.com', '2023-04-17'),
('Rajesh Singh', 21, 'rajesh15@email.com', '2023-05-30'),
('Kavita Sharma', 23, 'kavita16@email.com', '2023-06-06'),
('Ramesh Yadav', 24, 'ramesh17@email.com', '2023-07-01'),
('Sneha Iyer', 22, 'sneha18@email.com', '2023-08-13'),
('Amit Chauhan', 20, 'amit19@email.com', '2023-09-09'),
('Pooja Nair', 21, 'pooja20@email.com', '2023-10-22'),
('Ajay Kumar', 25, 'ajay21@email.com', '2023-01-10'),
('Tina Kapoor', 20, 'tina22@email.com', '2023-02-12'),
('Mohit Gupta', 22, 'mohit23@email.com', '2023-03-04'),
('Nisha Patel', 23, 'nisha24@email.com', '2023-04-18'),
('Arjun Singh', 24, 'arjun25@email.com', '2023-05-09'),
('Sunita Rao', 21, 'sunita26@email.com', '2023-06-23'),
('Manish Verma', 22, 'manish27@email.com', '2023-07-15'),
('Geeta Kumari', 19, 'geeta28@email.com', '2023-08-29'),
('Vivek Sinha', 23, 'vivek29@email.com', '2023-09-27'),
('Divya Mishra', 20, 'divya30@email.com', '2023-10-05'),
('Sanjay Kumar', 22, 'sanjay31@email.com', '2023-01-13'),
('Ritika Agarwal', 21, 'ritika32@email.com', '2023-02-27'),
('Raj Malhotra', 24, 'raj33@email.com', '2023-03-22'),
('Mehul Desai', 25, 'mehul34@email.com', '2023-04-12'),
('Pankaj Yadav', 23, 'pankaj35@email.com', '2023-05-20'),
('Komal Bansal', 22, 'komal36@email.com', '2023-06-14'),
('Shubham Tiwari', 19, 'shubham37@email.com', '2023-07-18'),
('Renu Joshi', 21, 'renu38@email.com', '2023-08-04'),
('Dinesh Singh', 20, 'dinesh39@email.com', '2023-09-16'),
('Alka Sharma', 24, 'alka40@email.com', '2023-10-28'),
('Nitin Kapoor', 22, 'nitin41@email.com', '2023-01-30'),
('Shalini Jain', 23, 'shalini42@email.com', '2023-02-06'),
('Harsh Vardhan', 21, 'harsh43@email.com', '2023-03-18'),
('Seema Yadav', 25, 'seema44@email.com', '2023-04-09'),
('Yogesh Chawla', 20, 'yogesh45@email.com', '2023-05-26'),
('Radhika Soni', 19, 'radhika46@email.com', '2023-06-05'),
('Gaurav Mehta', 23, 'gaurav47@email.com', '2023-07-22'),
('Swati Tiwari', 21, 'swati48@email.com', '2023-08-11'),
('Varun Saxena', 22, 'varun49@email.com', '2023-09-14'),
('Neelam Bhatia', 24, 'neelam50@email.com', '2023-10-19');

INSERT INTO STAFF (NAME, ROLE, HIREDATE, SALARY) VALUES
('AJAY KUMAR','Librarian','2022-04-25',65000),
('Ramesh Kumar','Assistant Librarian','2022-05-10',35000),
('Sunita Sharma','Clerk','2021-06-15',28000),
('Arjun Mehta','Manager','2020-07-20',72000),
('Priya Nair','Assistant Librarian','2022-08-12',34000),
('Amit Patel','Librarian','2019-09-05',60000),
('Kavita Joshi','Clerk','2021-10-03',29000),
('Rahul Gupta','Assistant','2023-01-11',25000),
('Neha Verma','Manager','2020-02-16',71000),
('Deepak Yadav','Clerk','2022-03-09',27000),
('Rohit Malhotra','Assistant','2021-04-21',26000),
('Anjali Singh','Librarian','2018-05-13',63000),
('Suresh Rana','Clerk','2020-06-17',28500),
('Meena Iyer','Assistant','2019-07-25',24500),
('Karan Thakur','Manager','2021-08-30',70000),
('Simran Kaur','Clerk','2023-09-14',29500),
('Mohit Jain','Assistant','2020-10-22',25500),
('Sneha Agarwal','Librarian','2019-11-19',61000),
('Alok Rathi','Assistant Librarian','2021-12-05',36000),
('Rajesh Singh','Manager','2017-01-15',73000),
('Ritu Kapoor','Clerk','2018-02-27',28000),
('Vikram Chauhan','Assistant','2020-03-18',25000),
('Pooja Yadav','Clerk','2019-04-08',30000),
('Ajay Sharma','Assistant Librarian','2021-05-26',35500),
('Geeta Bansal','Librarian','2018-06-06',64000),
('Manoj Das','Assistant','2020-07-29',26500),
('Shalini Tiwari','Clerk','2022-08-09',29000),
('Harsh Vardhan','Assistant','2019-09-12',27000),
('Komal Desai','Manager','2020-10-20',71500),
('Yogesh Kumar','Clerk','2021-11-25',27500),
('Seema Gupta','Assistant','2022-12-13',25500),
('Pankaj Sinha','Librarian','2018-01-19',62000),
('Tina Arora','Clerk','2020-02-22',28500),
('Dinesh Yadav','Assistant','2019-03-14',26000),
('Radhika Joshi','Assistant Librarian','2021-04-16',35000),
('Nitin Saxena','Manager','2017-05-23',74000),
('Alka Verma','Clerk','2019-06-11',29500),
('Sanjay Mehra','Assistant','2020-07-27',25000),
('Swati Rao','Clerk','2021-08-30',28000),
('Vivek Sharma','Assistant','2022-09-09',27000),
('Divya Kapoor','Librarian','2019-10-15',60500),
('Raj Malhotra','Assistant Librarian','2021-11-17',36500),
('Mehul Chawla','Clerk','2020-12-05',28500),
('Shubham Tiwari','Assistant','2022-01-28',25000),
('Neelam Bhatia','Clerk','2021-02-14',30000),
('Varun Saxena','Assistant','2019-03-06',26000),
('Gaurav Mehta','Manager','2020-04-25',72500),
('Renu Joshi','Clerk','2021-05-09',29000),
('Rohini Sharma','Assistant','2022-06-18',24500),
('Anand Kumar','Librarian','2018-07-07',61500),
('Monika Singh','Assistant Librarian','2020-08-28',34000);

INSERT INTO BORROWINGS (MEMBERID, BOOKID, BORROWDATE, RETURNDATE) VALUES
(50,10,'2025-01-05','2025-01-20'),
(2,5,'2025-01-08','2025-01-25'),
(3,10,'2025-01-10','2025-01-24'),
(4,12,'2025-01-12','2025-01-26'),
(5,15,'2025-01-15','2025-01-30'),
(6,18,'2025-01-18','2025-02-02'),
(7,20,'2025-01-20','2025-02-05'),
(8,22,'2025-01-22','2025-02-08'),
(9,25,'2025-01-25','2025-02-10'),
(10,28,'2025-01-28','2025-02-12'),
(11,30,'2025-02-02','2025-02-16'),
(12,32,'2025-02-05','2025-02-20'),
(13,35,'2025-02-07','2025-02-21'),
(14,38,'2025-02-09','2025-02-25'),
(15,40,'2025-02-12','2025-02-28'),
(16,42,'2025-02-15','2025-03-01'),
(17,45,'2025-02-18','2025-03-05'),
(18,48,'2025-02-20','2025-03-07'),
(19,50,'2025-02-23','2025-03-10'),
(20,2,'2025-02-25','2025-03-12'),
(21,4,'2025-02-28','2025-03-14'),
(22,6,'2025-03-03','2025-03-17'),
(23,8,'2025-03-05','2025-03-20'),
(24,11,'2025-03-08','2025-03-22'),
(25,14,'2025-03-11','2025-03-25'),
(26,16,'2025-03-13','2025-03-28'),
(27,19,'2025-03-15','2025-03-30'),
(28,21,'2025-03-18','2025-04-02'),
(29,23,'2025-03-20','2025-04-05'),
(30,26,'2025-03-22','2025-04-06'),
(31,29,'2025-03-25','2025-04-10'),
(32,31,'2025-03-28','2025-04-12'),
(33,33,'2025-04-01','2025-04-15'),
(34,36,'2025-04-03','2025-04-18'),
(35,39,'2025-04-06','2025-04-20'),
(36,41,'2025-04-08','2025-04-23'),
(37,43,'2025-04-11','2025-04-25'),
(38,46,'2025-04-13','2025-04-27'),
(39,49,'2025-04-15','2025-04-29'),
(40,3,'2025-04-18','2025-05-02'),
(41,7,'2025-04-20','2025-05-05'),
(42,9,'2025-04-22','2025-05-07'),
(43,13,'2025-04-25','2025-05-10'),
(44,17,'2025-04-27','2025-05-12'),
(45,24,'2025-04-29','2025-05-15'),
(46,27,'2025-05-02','2025-05-17'),
(47,34,'2025-05-04','2025-05-19'),
(48,37,'2025-05-07','2025-05-22'),
(49,44,'2025-05-09','2025-05-24'),
(50,47,'2025-05-12','2025-05-26');

------------------------------------------------------------------------------------
SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;
SELECT * FROM STAFF;
SELECT * FROM BORROWINGS;

-------------------------------------------------------------------------------------
## *SQL Practice Questions – LibraryDB*

-- ### *Section 1: Easy – Basic DDL & DML (10 Questions)*

-- 1. Insert 5 books into the Books table.
INSERT INTO BOOKS (TITLE, AUTHOR, GENRE, PUBLISHEDYEAR, COPIESAVAILABLE) VALUES
('ANALOG ELECTRONICS', 'S.KUMAR', 'ELECTRONICS', 1985, 120),
('FORMAL LANGUAGES AND AUTOMATA', 'PETER LINZ', 'COMPILER', 2010, 50),
('Algorithms Unlocked', 'Thomas Cormen', 'Algorithms', 2013, 70),
('Operating System Concepts', 'Silberschatz', 'Operating Systems', 2014, 60),
('Artificial Intelligence BY KLP MISHRA', 'KLP MISHRA SINGH', 'AI', 2015, 90);
SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;
SELECT * FROM STAFF;
SELECT * FROM BORROWINGS;
---------------------------------------------------------------------------------

-- 2. Insert 5 members into the Members table.
INSERT INTO MEMBERS (NAME, AGE, EMAIL, MEMBERSHIPDATE) VALUES
('AMIT', 19, 'aakash12@email.com', '2023-01-12'),
('Rohit', 21, 'rohit23@email.com', '2023-02-10'),
('Pankaj', 20, 'priya33@email.com', '2023-03-05'),
('Karan Verma', 23, 'karan43@email.com', '2023-04-08'),
('Simran Kaur', 22, 'simran53@email.com', '2023-05-01');

----------------------------------------------------------------------------------
-- 3. Insert 3 staff members into the Staff table.
INSERT INTO STAFF (NAME, ROLE, HIREDATE, SALARY) VALUES
('Vijeta Signgh','Librarian','2022-04-29',65000),
('Ramkesh','Assistant Librarian','2022-05-10',35000),
('Sunita Sharma','Clerk','2021-06-15',28000);
----------------------------------------------------------------------------------

-- 4. Insert 5 borrowings for different members and books.
INSERT INTO BORROWINGS (MEMBERID, BOOKID, BORROWDATE, RETURNDATE) VALUES
(1,1,'2025-01-05','2025-01-20'),
(2,5,'2025-01-08','2025-01-25'),
(3,10,'2025-01-10','2025-01-24');
-------------------------------------------------------------------------------
-- 5. Update the CopiesAvailable for a book when a member borrows it.
   INSERT INTO BORROWINGS (MEMBERID, BOOKID, BORROWDATE, RETURNDATE)
VALUES (11, 11, '2025-10-01', '2025-10-16');
UPDATE BOOKS
SET COPIESAVAILABLE=COPIESAVAILABLE-1
WHERE BOOKID=11;
-----------------------------------------------------------------------
-- 6. Update the salary of staff whose role is 'Librarian' by 10%.
UPDATE STAFF
SET SALARY=SALARY*1.10
WHERE ROLE ="LIBRARIAN";
------------------------------------------------------------------
-- 7. Delete books that have never been borrowed.
DELETE FROM BOOKS
WHERE BOOKID NOT IN
(SELECT BOOKID FROM BORROWINGS);

--------------------------------------------------------------------

-- 8. Delete members whose age is less than 12.
DELETE FROM MEMBERS
WHERE AGE<12;

----------------------------------------------------------------------------------
-- 9. Select all books with their Title, Author, and Genre.
SELECT TITLE,AUTHOR,GENRE
FROM BOOKS;

----------------------------------------------------------------------------------
-- 10. Select all members ordered by MembershipDate descending.
SELECT * FROM MEMBERS
ORDER BY MEMBERSHIPDATE DESC;

----------------------------------------------------------------------------------
SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;
SELECT * FROM STAFF;
SELECT * FROM BORROWINGS;

----------------------------------------------------------------------------------
-- ### *Section 2: Medium – Aggregate Functions, WHERE, and Pattern Matching (20 Questions)*

-- 11. Count the total number of books in the library.
SELECT COUNT(*) AS COUNT,COUNT(TITLE) AS NOTNULLCOUNT
 FROM BOOKS;
----------------------------------------------------------------------------------
-- 12. Count the number of members in each age group.
SELECT AGE,COUNT(*) AS MEMBERSCOUNT
FROM MEMBERS
GROUP BY AGE;

----------------------------------------------------------------------------------
-- 13. Find the average age of members.
SELECT AVG(AGE) AS AVERAGEAGE
FROM MEMBERS;
----------------------------------------------------------------------------------
-- 14. Find the maximum and minimum salary of staff.
SELECT MAX(SALARY),MIN(SALARY)
FROM STAFF;
----------------------------------------------------------------------------------
-- 15. Count the number of books borrowed by each member.
SELECT MEMBERID,COUNT(MEMBERID),
(SELECT NAME FROM MEMBERS
WHERE MEMBERS.MEMBERID=BORROWINGS.MEMBERID) AS MEMBERNAME
FROM BORROWINGS
GROUP BY MEMBERID;
----------------------------------------------------------------------------------
-- 16. List books where the title contains 'Data'.
SELECT * FROM BOOKS
WHERE TITLE LIKE ("%DATA%");
----------------------------------------------------------------------------------
-- 17. List members whose name starts with 'A'.
SELECT * FROM MEMBERS
WHERE NAME LIKE("A%");
----------------------------------------------------------------------------------
-- 18. Find books published after 2015.
SELECT * FROM BOOKS
WHERE PUBLISHEDYEAR >= "2015";
----------------------------------------------------------------------------------
-- 19. Find members who joined in the last 1 year.
SELECT * FROM MEMBERS
WHERE MEMBERSHIPDATE>="2024-10-02";
----------------------------------------------------------------------------------
-- 20. List staff with salary greater than 40,000.
SELECT * FROM STAFF
WHERE SALARY >40000;
----------------------------------------------------------------------------------
SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;
SELECT * FROM STAFF;
SELECT * FROM BORROWINGS;
-----------------------------------------------------------------------------------
-- 21. Find total copies available per genre.
SELECT GENRE,SUM(COPIESAVAILABLE) AS TOTALAVAILABLE
FROM BOOKS
GROUP BY GENRE;
----------------------------------------------------------------------------------
-- 22. Display books whose CopiesAvailable < 3.
SELECT * FROM BOOKS
WHERE COPIESAVAILABLE <3;
----------------------------------------------------------------------------------
-- 23. Find members who borrowed more than 2 books.
SELECT M.MEMBERID, M.NAME, M.AGE, M.EMAIL, M.MEMBERSHIPDATE, COUNT(B.BORROWID) AS TotalBorrowed
FROM MEMBERS M
JOIN BORROWINGS B ON M.MEMBERID=B.MEMBERID
GROUP BY M.MEMBERID, M.NAME, M.AGE, M.EMAIL, M.MEMBERSHIPDATE
HAVING COUNT(B.BORROWID) > 2;

-- or
SELECT NAME,EMAIL,
(SELECT COUNT(BORROWID)
 FROM BORROWINGS B
 WHERE B.MEMBERID=M.MEMBERID) AS TOTALBORROWED
 FROM MEMBERS M
HAVING TOTALBORROWED>2;
----------------------------------------------------------------------------------
-- 24. Count how many times each book has been borrowed.
SELECT BOOKID,COUNT(BOOKID)
FROM BORROWINGS
GROUP BY BOOKID;

-- OR
SELECT B.BOOKID,B.TITLE AS NAMEOFBOOK ,COUNT(B1.BORROWID) AS TIMESBORROWED
FROM BOOKS B
JOIN BORROWINGS B1 ON B1.BOOKID=B.BOOKID
GROUP BY BOOKID;
----------------------------------------------------------------------------------
-- 25. Find books that were never borrowed using NOT EXISTS.
-- 25. Find books that were never borrowed
SELECT B.BOOKID, B.TITLE AS NameOfBook
FROM BOOKS B
WHERE NOT EXISTS (
    SELECT 1
    FROM BORROWINGS BO
    WHERE BO.BOOKID = B.BOOKID
);


----------------------------------------------------------------------------------
-- 26. List members whose email contains 'gmail.com'.
SELECT * FROM MEMBERS
WHERE EMAIL LIKE "%GMAIL.COM";
----------------------------------------------------------------------------------
-- 27. Find books authored by 'J.K. Rowling'.
SELECT * FROM BOOKS
WHERE AUTHOR ='J.K. Rowling';
----------------------------------------------------------------------------------
-- 28. Find staff whose name ends with 'n'.
SELECT * FROM STAFF
WHERE NAME LIKE '%N';

----------------------------------------------------------------------------------
-- 29. Find books published between 2000 and 2010.
SELECT * FROM BOOKS
WHERE PUBLISHEDYEAR >"2000" AND
PUBLISHEDYEAR<"2010";
----------------------------------------------------------------------------------
-- 30. Display all books sorted by PublishedYear descending.
SELECT * FROM BOOKS
ORDER BY PUBLISHEDYEAR DESC;
----------------------------------------------------------------------------------

-- ---
SELECT * FROM MEMBERS;
SELECT * FROM STAFF;
----------------------------------------------------------------------------------

-- ### *Section 3: Medium – JOINS (20 Questions)*
SELECT * FROM MEMBERS;
SELECT * FROM STAFF;
SELECT * FROM BORROWINGS;
SELECT * FROM BOOKS;

-- 31. List all members along with the books they borrowed (INNER JOIN).
SELECT M.MEMBERID, M.NAME AS MEMBERNAME, B.BOOKID, B.TITLE AS BOOKTITLE
FROM MEMBERS M
JOIN BORROWINGS BO ON M.MEMBERID = BO.MEMBERID
JOIN BOOKS B ON BO.BOOKID = B.BOOKID
ORDER BY M.MEMBERID;
----------------------------------------------------------------------------------
-- 32. List all borrowings including members who have not borrowed any book (LEFT JOIN).
SELECT M.MEMBERID,M.NAME AS NAMEOFMEMBER,
B.BOOKID,B.TITLE AS NAMEOFBOOK,
BO.BORROWDATE,BO.RETURNDATE
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON M.MEMBERID=BO.MEMBERID
LEFT JOIN BOOKS B ON BO.BOOKID=B.BOOKID ;

----------------------------------------------------------------------------------
-- 33. List all books including members who have not borrowed them (RIGHT JOIN).
SELECT M.MEMBERID as MEMBERID,
       M.NAME AS MEMBERNAME,
       B.BOOKID AS BOOKID,
       B.TITLE AS BOOKTITLE
FROM MEMBERS M
RIGHT JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
RIGHT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
ORDER BY M.MEMBERID;
----------------------------------------------------------------------------------
-- 34. Show all members with the number of books they borrowed (JOIN + GROUP BY).
SELECT M.NAME AS NAMEOFMEMBER,
       COUNT(BO.BORROWID)
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID;
---------------------------------------------------------------------------------------
-- 35. Show all staff and the total number of books borrowed while they were employed (JOIN Borrowings + Staff + Members).
SELECT S.STAFFID AS STAFFID,
S.NAME AS STAFFNAME,
S.ROLE AS STAFFROLE,
COUNT(BO.BORROWID) AS BOOKSBORROWED
FROM STAFF S
LEFT JOIN BORROWINGS BO ON BO.BORROWDATE>=S.HIREDATE
LEFT JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
GROUP BY S.STAFFID,S.NAME,S.ROLE;

-----------------------------------------------------------------------------------------
-- 36. List members and the titles of books they borrowed where ReturnDate is NULL.
SELECT M.NAME AS MEMBERNAME,
B.TITLE AS BOOKTITLE
FROM BOOKS B
RIGHT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
LEFT JOIN MEMBERS M ON M.MEMBERID=B.BOOKID
WHERE BO.RETURNDATE IS NOT NULL;

-------------------------------------------------------------------------------------
-- 37. List members who borrowed more than 3 books (JOIN + GROUP BY + HAVING).
SELECT M.NAME AS MEMBERNAME,
M.MEMBERID AS MEMBERID,
COUNT(BO.BORROWID) AS TOTALBORROWED
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(BO.MEMBERID) > 3;

------------------------------------------------------------------------------------------
-- 38. List all books borrowed along with the borrowing date and member name.
SELECT B.TITLE AS BOOKNAME,
BO.BORROWDATE AS BORROWDATE,
M.NAME AS MEMBERNAME
FROM BORROWINGS BO
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
LEFT JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID;

------------------------------------------------------------------------------------------
-- 39. Display members and the staff who assisted them if tracked in another table.

CREATE TABLE ASSISTANCE(
    ASSISTID INT PRIMARY KEY AUTO_INCREMENT,
    MEMBERID INT,
    STAFFID INT,
    ASSISTDATE DATE,
    FOREIGN KEY (MEMBERID) REFERENCES MEMBERS(MEMBERID),
    FOREIGN KEY (STAFFID) REFERENCES STAFF(STAFFID)
);
INSERT INTO ASSISTANCE (MEMBERID, STAFFID, ASSISTDATE) VALUES
(1, 1, '2025-01-05'),
(2, 2, '2025-01-08'),
(3, 3, '2025-01-10'),
(4, 4, '2025-01-12'),
(5, 5, '2025-01-15');

SELECT
    M.NAME AS MEMBERNAME,
    S.NAME AS STAFFNAME,
    S.ROLE AS STAFFROLE
FROM MEMBERS M
LEFT JOIN ASSISTANCE A ON A.MEMBERID=M.MEMBERID
LEFT JOIN STAFF S ON S.STAFFID=A.STAFFID;

------------------------------------------------------------------------------------------
-- 40. List books and the number of times each has been borrowed (LEFT JOIN + GROUP BY).
SELECT B.TITLE AS BOOKTITLE ,
COUNT(BO.BOOKID)AS NUMBEROFTIMESBORROWED
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
GROUP BY B.TITLE;
---------------------------------------------------------------------------------------------------------

-- 41. List all members who borrowed books in the 'Fantasy' genre.
SELECT M.NAME,M.MEMBERID
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.GENRE ="FANTASY"
ORDER BY M.MEMBERID;

----------------------------------------------------------------------------------------------------------------
-- 42. Display all borrowings with member name, book title, and staff name handling it (complex JOIN).
CREATE TABLE BORROWINGS_HANDLED (
    BORROWID INT,
    STAFFID INT,
    FOREIGN KEY (BORROWID) REFERENCES BORROWINGS (BORROWID),
    FOREIGN KEY (STAFFID) REFERENCES STAFF (STAFFID)
);
-- Sample data: BorrowID from BORROWINGS and StaffID from STAFF
INSERT INTO
    BORROWINGS_HANDLED (BORROWID, STAFFID)
VALUES (1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 1),
    (6, 2),
    (7, 3),
    (8, 2),
    (9, 1),
    (10, 3);
SELECT BO.BORROWID AS BORROWID,M.NAME AS MEMBER_NAME,
B.TITLE AS BOOK_TITLE ,S.NAME AS STAFF_NAME,S.ROLE AS STAFF_ROLE
FROM BORROWINGS BO
LEFT JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
LEFT JOIN borrowings_handled BH ON BH.BORROWID=BO.BORROWID
LEFT JOIN STAFF S ON S.STAFFID=BH.STAFFID
ORDER BY BO.BORROWDATE DESC;

-------------------------------------------------------------------------------------------------

-- 43. List members who borrowed books published before 2010.

SELECT M.MEMBERID AS MEMBERID,M.NAME AS MEMBER_NAME,
BO.BORROWID AS BORROW_ID,
B.TITLE AS BOOK_NAME
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE BO.BORROWDATE<"2011-01-01";

----------------------------------------------------------------------------------------
-- 44. Find members who borrowed books in multiple genres.
-- USE HAVING CLAUSE WITH COUNT,SUM,AVG,ETC. AND NORMAL ->GROUP BY
SELECT M.MEMBERID AS MEMBER_ID ,
M.NAME AS MEMBER_NAME,
COUNT(B.GENRE) AS NUMBER_OF_GENERS
FROM BOOKS B
RIGHT JOIN BORROWINGS BO ON BO.BOOKID =B.BOOKID
RIGHT JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
GROUP BY MEMBER_ID,MEMBER_NAME
HAVING COUNT(DISTINCT B.GENRE)>1;

-------------------------------------------------------------------------------------------------
-- 45. Show books borrowed along with member names who borrowed more than once.

SELECT
    M.MEMBERID,
    M.NAME AS MemberName,
    B.BOOKID,
    B.TITLE AS BookTitle,
    COUNT(BO.BORROWID) AS NumberOfTimesBorrowed
FROM
    BORROWINGS BO
    JOIN MEMBERS M ON M.MEMBERID = BO.MEMBERID
    JOIN BOOKS B ON B.BOOKID = BO.BOOKID
GROUP BY
    M.MEMBERID,
    M.NAME,
    B.BOOKID,
    B.TITLE
HAVING
    COUNT(BO.BORROWID) > 1;

----------------------------------------------------------------------------------------------------
-- 46. Display books with average member age who borrowed them.
SELECT B.TITLE AS BOOK_TITLE,
       AVG(M.AGE) AS MEMBER_AVG_AVG
FROM BORROWINGS BO
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
LEFT JOIN MEMBERS M ON M.MEMBERID =BO.MEMBERID
GROUP BY B.TITLE;

------------------------------------------------------------------------------------------------------
-- 47. List staff who joined before 2020 and members who borrowed books under their supervision.
-- 47. List staff who joined before 2020 and members who borrowed books under their supervision
SELECT
    S.NAME AS StaffName,
    M.NAME AS MemberName,
    BO.BORROWDATE AS DateOfBorrow
FROM
    STAFF S
    JOIN BORROWINGS_HANDLED BH ON BH.STAFFID = S.STAFFID
    JOIN BORROWINGS BO ON BO.BORROWID = BH.BORROWID
    JOIN MEMBERS M ON M.MEMBERID = BO.MEMBERID
WHERE
    S.HIREDATE < '2020-01-01'
ORDER BY S.NAME, BO.BORROWDATE;

--------------------------------------------------------------------------------------------------

-- 48. Display all borrowings where books are from a certain author, along with member names.
SELECT DISTINCT B.TITLE AS BOOK_TITLE,
B.AUTHOR AS BOOK_AUTHOR,
 M.NAME AS MEMBER_NAME
FROM BOOKS B
RIGHT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
LEFT JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
WHERE B.AUTHOR="BJARRNE STROUSTRUP"
ORDER BY MEMBER_NAME DESC;

---------------------------------------------------------------------------------------------------------------
-- 49. Find members who borrowed all books of a particular genre.
SELECT M.NAME AS MEMBER_NAME,
B.TITLE AS BOOK_TITLE
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE GENRE="PROGRAMMING"
ORDER BY MEMBER_NAME DESC;

------------------------------------------------------------------------------------------------------------------------

-- 50. List top 3 members with most borrowings.
--INNER JOINS ENSURES BEING MIN COUNT 1 (NOT 0)
SELECT M.NAME AS MEMBER_NAME,
M.MEMBERID AS MEMBER_ID,
COUNT(BO.MEMBERID) AS TOTAL_BORROWINGS
FROM MEMBERS M
INNER JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY MEMBER_ID
ORDER BY TOTAL_BORROWINGS DESC
LIMIT 3;

----------------------------------------------------------------------------------------------------------

-- ---

-- ### *Section 4: Hard – Subqueries & Advanced Aggregates (20 Questions)*

-- 51. Find members who borrowed more books than the average number of books borrowed by all members.
SELECT M.MEMBERID AS MEMBER_ID,
M.NAME AS MEMBER_NAME,
COUNT(BO.BORROWID) AS BORROWINGS_OF_MEMBER
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY MEMBER_ID,MEMBER_NAME
HAVING COUNT(BO.BORROWID)>(
    SELECT AVG(BORROWCOUNT)
    FROM (
        SELECT COUNT(BO2.BORROWID)AS BORROWCOUNT
        FROM BORROWINGS BO2
        GROUP BY BO2.MEMBERID
    ) AS AVG_TABLE
);

----------------------------------------------------------------------------------------------------------

-- 52. Find books borrowed by members older than the average age.
SELECT B.TITLE AS BOOK_NAME,
M.NAME AS MEMBER_NAME,
M.AGE AS MEMBER_AGE
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
LEFT JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
HAVING M.AGE >(
    SELECT AVG(M1.AGE)
    FROM MEMBERS M1
);

--------------------------------------------------------------------------------------------
-- 53. Find the member who borrowed the highest number of books.
SELECT M.NAME AS MEMBER_NAME,
COUNT(BO.BORROWID)AS BOOKS_BORROWED
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID
HAVING BOOKS_BORROWED = (
    SELECT MAX(BORROW_COUNT)
    FROM(
        SELECT COUNT(BO1.BORROWID) AS BORROW_COUNT
        FROM BORROWINGS BO1
        GROUP BY BO1.MEMBERID
    ) AS COUNT
);

----------------------------------------------------------------------------------------------------
-- 54. Find the book borrowed most frequently.
SELECT B.BOOKID AS BOOK_ID,
B.TITLE AS BOOK_NAME,
COUNT(BO.BORROWID) AS NUMBER_OF_TIMES_BORROWED
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
GROUP BY B.BOOKID
HAVING COUNT(BO.BORROWID)=(
    SELECT MAX(BORROWCOUNT)
    FROM(
        SELECT COUNT(BO1.BORROWID)AS BORROWCOUNT
        FROM BORROWINGS BO1
        GROUP BY BO1.BOOKID
    ) AS ALIAS_NAME_REQUIRED
);

--------------------------------------------------------------------------------------------------

-- 55. List books never borrowed and authored by 'Stephen King'.
SELECT B.BOOKID AS BOOKID,
B.TITLE AS BOOK_NAME,
B.AUTHOR AS BOOK_AUTHOR
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
WHERE BO.BOOKID IS NULL
AND B.AUTHOR ="STEPHEN KING";

--------------------------------------------------------------------------------------------------------------------
-- 56. Display members whose borrowed books’ total copies exceed 5.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBERNAME,
B.TITLE AS BOOK_TITLE,
B.COPIESAVAILABLE AS COPIESAVAILABLE
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.COPIESAVAILABLE>5;

----------------------------------------------------------------------------------------------------
-- 57. Find staff with salary above the average salary of all staff.
SELECT S.STAFFID AS STAFFID,
S.NAME AS STAFFNAME,
S.SALARY AS STAFF_SLARY
FROM STAFF S
WHERE S.SALARY>(
    SELECT AVG(S1.SALARY)
    FROM STAFF S1
);

-------------------------------------------------------------------------------------------------------------

-- 58. List members who borrowed all books published after 2015.
SELECT M.MEMBERID AS MEMBER_ID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON M.MEMBERID=BO.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.PUBLISHEDYEAR>2015
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(DISTINCT B.BOOKID)=(
    SELECT COUNT(*)
    FROM BOOKS
    WHERE PUBLISHEDYEAR>2015
);
-----------------------------------------------------------------------------------------------

-- 59. Display books where all borrowers are under 25 years of age.
SELECT B.BOOKID AS BOOKID,
B.TITLE AS BOOK_TITLE
FROM BOOKS B
WHERE NOT EXISTS(
    SELECT 1
    FROM BORROWINGS BO
    JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
    WHERE BO.BOOKID=B.BOOKID
    AND M.AGE>=25
);

-------------------------------------------------------------------------------------------------------
-- 60. Find members who borrowed the same book as member 'M101'.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
WHERE BO.BOOKID IN (
    SELECT BO1.BOOKID
    FROM BORROWINGS BO1
    WHERE BO1.MEMBERID=3
)
AND M.MEMBERID <> 3;

--------------------------------------------------------------------------------------------------------------
-- 61. Find books borrowed by exactly 2 members.
SELECT B.BOOKID AS BOOK_ID,
B.TITLE AS BOOK_TITLE,
COUNT(BO.BORROWID) AS NUMBER_OF_BORROWERS
FROM BOOKS B
JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
GROUP BY B.BOOKID,B.TITLE
HAVING COUNT(BO.BORROWID)=2;

-----------------------------------------------------------------------------

-- 62. Display members whose age is above the department average (if departments exist in extension).
CREATE TABLE DEPARTMENTS (
    DEPTID INT AUTO_INCREMENT PRIMARY KEY,
    DEPTNAME VARCHAR(50) NOT NULL
);
ALTER TABLE MEMBERS ADD DEPTID INT;
INSERT INTO
    DEPARTMENTS (DEPTNAME)
VALUES ('Computer Science'),
    ('Mechanical'),
    ('Electrical'),
    ('Civil');

UPDATE MEMBERS SET DEPTID = 1 WHERE MEMBERID <= 10;
UPDATE MEMBERS SET DEPTID = 2 WHERE MEMBERID BETWEEN 11 AND 20;
UPDATE MEMBERS SET DEPTID = 3 WHERE MEMBERID BETWEEN 21 AND 30;
UPDATE MEMBERS SET DEPTID = 4 WHERE DEPTID IS NULL;

SELECT M.MEMBERID,
M.NAME AS MEMBER_NAME,
M.AGE AS MEMBER_AGE,
D.DEPTNAME
FROM MEMBERS M
JOIN DEPARTMENTS D ON D.DEPTID=M.DEPTID
WHERE M.AGE>(
    SELECT AVG(M1.AGE)
    FROM MEMBERS M1
    WHERE M1.DEPTID=D.DEPTID
);

-------------------------------------------------------------------------------------------------------

-- 63. Find members who borrowed the second most borrowed book.
SELECT M.MEMBERID AS MEMBER_ID,
M.NAME AS MEMBER_NAME,
B.BOOKID AS BOOK_ID,
B.TITLE AS BOOK_TITLE
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.BOOKID =(
    SELECT BOOKID FROM(
        SELECT BOOKID,COUNT(*) AS BORROW_COUNT
        FROM BORROWINGS
        GROUP BY BOOKID
        ORDER BY BORROW_COUNT DESC
        LIMIT 1 OFFSET 1
    ) AS T
);
----------------------------------------------------------------------------------------------
-- 64. Find members who borrowed books by multiple authors.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
COUNT(DISTINCT B.AUTHOR) AS NUMBER_OF_AUTHORS
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON BO.BOOKID=B.BOOKID
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(DISTINCT B.AUTHOR)>1;

--------------------------------------------------------------------------------------------

-- 65. List books borrowed in all months of the current year.
SELECT B.BOOKID AS BOOKID,
B.TITLE AS BOOK_TITLE
FROM BOOKS B
JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
WHERE YEAR(BO.BORROWDATE)=2025
GROUP BY B.BOOKID,B.TITLE
HAVING COUNT(DISTINCT MONTH(BO.BORROWDATE))=12;

---------------------------------------------------------------------------------------------------
-- 66. Find members who borrowed books that no other member borrowed.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
B.TITLE AS BOOK_TITLE_UNIQUELY_BORROWED
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.BOOKID IN (
    SELECT BOOKID
    FROM BORROWINGS
    GROUP BY BOOKID
    HAVING COUNT(DISTINCT MEMBERID)=1
);
-----------------------------------------------------------------------------------------------------------
-- 67. List books borrowed by members who joined in the same year as staff joined.

SELECT B.BOOKID AS BOOKID,
M.MEMBERID AS MEMBERID,
B.TITLE AS BOOK_TITLE,
M.NAME AS MEMBER_NAME
FROM BOOKS B
JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
JOIN BORROWINGS_HANDLED BH ON BH.BORROWID = BO.BORROWID
JOIN STAFF S ON S.STAFFID = BH.STAFFID
JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
WHERE YEAR(M.MEMBERSHIPDATE)=YEAR(S.HIREDATE);

--------------------------------------------------------------------------------------------------------
-- 68. Find members who never returned a book on time (assume ReturnDate vs BorrowDate + 14 days).
SELECT DISTINCT M.MEMBERID AS MEMBER_ID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID,M.NAME
HAVING SUM(
    CASE
    WHEN BO.RETURNDATE<= DATE_ADD(BO.BORROWDATE,INTERVAL 14 DAY)THEN 1
    ELSE 0
    END
)=0;

---------------------------------------------------------------------------------------------------------------------------

-- 69. Find members who borrowed books but never borrowed the same book twice.
SELECT DISTINCT M.MEMBERID AS MEMBER_ID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID,BO.BOOKID
HAVING COUNT(BO.BORROWID)=1
ORDER BY M.MEMBERID;

------------------------------------------------------------------------------------------------------------------------------
-- 70. Display members with total borrowed books exceeding the average per member.
SELECT M.MEMBERID,
M.NAME,
COUNT(BO.BORROWID)
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID
HAVING COUNT(BO.BORROWID)>(
    SELECT AVG(TOTAL_BORROWS)
    FROM(
        SELECT COUNT(BO1.BORROWID) as TOTAL_BORROWS
        FROM BORROWINGS BO1
        GROUP BY BO1.MEMBERID
    ) AS T
)
ORDER BY COUNT(BO.BORROWID);

---------------------------------------------------------------------------------------------------

-- ---

-- ### *Section 5: Hard – Set Operations & Joins (15 Questions)*

-- 71. List members who borrowed either 'Harry Potter' or 'Data Structures'.
SELECT M.MEMBERID,
M.NAME,
B.TITLE
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.TITLE = 'HARRY POTTER'
OR
B.TITLE = 'DATA STRUCTRES';
--------------------------------------------------------------------------------------------------------------

-- 72. List members who borrowed both 'Harry Potter' AND 'Data Structures'.
SELECT M.MEMBERID, M.NAME, B.TITLE
FROM
    MEMBERS M
    JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
    JOIN BOOKS B ON B.BOOKID = BO.BOOKID
WHERE
    B.TITLE = 'HARRY POTTER'
    AND B.TITLE = 'DATA STRUCTURES';

-------------------------------------------------------------------------------------------------------------

-- 73. Find books borrowed by members who never borrowed 'Data Structures' (EXCEPT / NOT IN).
SELECT DISTINCT B.BOOKID AS BOOKID,
B.TITLE AS BOOK_NAME
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
WHERE BO.MEMBERID NOT IN(
    SELECT MEMBERID
    FROM BORROWINGS BO1
    JOIN BOOKS B1 ON B1.BOOKID=BO1.BOOKID
    WHERE B1.TITLE='DATA STRUCTRES'
);

----------------------------------------------------------------------------------------------------------------

-- 74. List members who borrowed books in January and February (INTERSECT).
SELECT MEMBERID, NAME
FROM MEMBERS
WHERE
    MEMBERID IN (
        SELECT MEMBERID
        FROM BORROWINGS
        WHERE
            MONTH(BORROWDATE) = 1
    )
INTERSECT
SELECT MEMBERID, NAME
FROM MEMBERS
WHERE
    MEMBERID IN (
        SELECT MEMBERID
        FROM BORROWINGS
        WHERE
            MONTH(BORROWDATE) = 2
    );
    -------------------------------------------------------------------------------------------------------------
-- 75. List members who borrowed books in January or February (UNION).

SELECT MEMBERID, NAME
FROM MEMBERS
WHERE
    MEMBERID IN (
        SELECT MEMBERID
        FROM BORROWINGS
        WHERE
            MONTH(BORROWDATE) = 1
    )
UNION
SELECT MEMBERID, NAME
FROM MEMBERS
WHERE
    MEMBERID IN (
        SELECT MEMBERID
        FROM BORROWINGS
        WHERE
            MONTH(BORROWDATE) = 2
    );

    ----------------------------------------------------------------------------------------------------
-- 76. Display members who borrowed books but no member borrowed 'Fantasy' books (EXCEPT).
SELECT M.MEMBERID,
M.NAME,B.TITLE
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.GENRE<>'FANTASY';

----------------------------------------------------------------------------------------------------------
-- 77. Find members who borrowed at least 2 books in the same genre.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
B.GENRE,
COUNT(B.BOOKID)
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
GROUP BY M.MEMBERID,M.NAME,B.GENRE
HAVING COUNT(B.BOOKID)>1;
-----------------------------------------------------------------------------------------------------
-- 78. List books borrowed by members who borrowed books authored by 'J.K. Rowling'.
SELECT M.NAME,M.MEMBERID,
B.TITLE,B.AUTHOR
FROM BOOKS B
JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
JOIN MEMBERS M ON M.MEMBERID=BO.MEMBERID
WHERE M.MEMBERID IN(
    SELECT M1.MEMBERID
    FROM MEMBERS M1
    JOIN BORROWINGS BO1 ON BO1.MEMBERID=M1.MEMBERID
    JOIN BOOKS B1 ON B1.BOOKID=BO1.BOOKID
    WHERE B1.AUTHOR ='Abraham Silberschatz'
)
-- EXCLUDE THOSE OF COMPARING ONE
AND B.AUTHOR<>'Abraham Silberschatz'
ORDER BY M.MEMBERID;

-------------------------------------------------------------------------------------------------
-- 79. Find members who borrowed books with more than 1 copy available.
SELECT M.MEMBERID,M.NAME,
B.COPIESAVAILABLE,
BO.BORROWDATE,
BO.BORROWID
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.COPIESAVAILABLE>1
ORDER BY B.COPIESAVAILABLE;

---------------------------------------------------------------------------------------------------------------
-- 80. Find members who borrowed books but not authored by 'Stephen King'.
SELECT DISTINCT M.MEMBERID, M.NAME, B.TITLE,B.AUTHOR
FROM
    MEMBERS M
    LEFT JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
    LEFT JOIN BOOKS B ON B.BOOKID = BO.BOOKID
where B.AUTHOR<>'STEPHEN KING'
ORDER BY M.MEMBERID;

---------------------------------------------------------------------------------------------------------

-- 81. List members who borrowed books published in 2020 but not 2021.
SELECT M.MEMBERID, M.NAME, B.TITLE, B.PUBLISHEDYEAR
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
JOIN BOOKS B ON B.BOOKID = BO.BOOKID
WHERE B.PUBLISHEDYEAR = 2020
AND M.MEMBERID NOT IN (
    SELECT M1.MEMBERID
    FROM MEMBERS M1
    JOIN BORROWINGS BO1 ON BO1.MEMBERID = M1.MEMBERID
    JOIN BOOKS B1 ON B1.BOOKID = BO1.BOOKID
    WHERE B1.PUBLISHEDYEAR = 2021
)
ORDER BY M.MEMBERID;
--------------------------------------------------------------------------------------------------------------

-- 82. Find members who borrowed all books authored by 'George Orwell'.
SELECT M.MEMBERID,
M.NAME
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID =BO.BOOKID
WHERE B.AUTHOR="GEORGE ORWELL"
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(DISTINCT BO.BORROWID)=(
    SELECT COUNT(*)
    FROM BOOKS B2
    WHERE B2.AUTHOR="GEORGE ORWELL"
);

----------------------------------------------------------------------------------------------------------
-- 83. List top 5 books by the number of borrowings.
SELECT B.BOOKID AS BOOKID,
B.TITLE AS BOOK_TITLE,
COUNT(BO.BORROWID) AS NUMBER_OF_BORROWINGS
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
GROUP BY B.BOOKID,B.TITLE
ORDER BY NUMBER_OF_BORROWINGS DESC
LIMIT 5;

-------------------------------------------------------------------------------------------------
-- 84. Display members and books where member borrowed the highest-rated book (if ratings added).
ALTER TABLE BOOKS ADD RATING FLOAT;
UPDATE BOOKS
SET RATING=4.5
WHERE BOOKID BETWEEN 1 AND 12;
UPDATE BOOKS
SET RATING=4.0
WHERE BOOKID BETWEEN 13 AND 24;
UPDATE BOOKS
SET RATING=3.5
WHERE BOOKID BETWEEN 25 AND 36;
UPDATE BOOKS
SET RATING=3.0
WHERE BOOKID BETWEEN 37 AND 48;
UPDATE BOOKS
SET RATING=5.0
WHERE BOOKID BETWEEN 49 AND 60;

SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
B.TITLE AS BOOK_TITLE,
B.RATING AS BOOK_RATING
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
LEFT JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.RATING=(
    SELECT MAX(RATING)
    FROM BOOKS
)
ORDER BY M.MEMBERID;

-------------------------------------------------------------------------------------------------
-- 85. Find members who borrowed books of every genre available.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(DISTINCT B.GENRE)=(
    SELECT COUNT(DISTINCT GENRE)
    FROM BOOKS
)
ORDER BY M.MEMBERID;

-------------------------------------------------------------------------------------------------
-- ---

-- ### *Section 6: Competitive / Placement / GATE Style Questions (15 Questions)*

-- 86. Find the second highest salary among staff.
SELECT MAX(SALARY) AS SECOND_HIGHEST_SALARY
FROM STAFF
WHERE SALARY<(
    SELECT MAX(SALARY)
    FROM STAFF
);

-------------------------------------------------------------------------------------------------
-- 87. Find the second most borrowed book.
SELECT B.BOOKID AS BOOKID,
B.TITLE AS BOOK_TITLE,
COUNT(BO.BORROWID) AS NUMBER_OF_BORROWINGS
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
GROUP BY B.BOOKID,B.TITLE
HAVING COUNT(BO.BORROWID)=(
    SELECT BORROW_COUNT FROM(
        SELECT COUNT(BO1.BORROWID) AS BORROW_COUNT
        FROM BORROWINGS BO1
        GROUP BY BO1.BOOKID
        ORDER BY BORROW_COUNT DESC
        LIMIT 1 OFFSET 1
    ) AS T
);

-------------------------------------------------------------------------------------------------
-- 88. Find members who borrowed more books than 'M102'.
SELECT M.MEMBERID AS MEMBER_ID,
M.NAME AS MEMBER_NAME,
COUNT(BO.BORROWID) AS BOOKS_BORROWED
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(DISTINCT BO.BORROWID)>(
    SELECT COUNT(BO1.BORROWID)
    FROM BORROWINGS BO1
    WHERE BO1.MEMBERID='M102'
);
--------------------------------------------------------------------------------------------------------

-- 89. Find members who borrowed the least number of books.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
COUNT(BO.BORROWID) AS NUMBER_OF_BOOKS_BORROWED
FROM MEMBERS M
LEFT JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(BO.BORROWID)=(
    SELECT MIN(BORROW_COUNT)
    FROM(
        SELECT COUNT(BO1.BORROWID) AS BORROW_COUNT
        FROM BORROWINGS BO1
        GROUP BY BO1.MEMBERID
    ) AS T
);
-------------------------------------------------------------------------------------------------
-- 90. Display members who borrowed books in all genres with at least one copy.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBERNAME
FROM MEMBERS M
 JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
 JOIN BOOKS B ON B.BOOKID=BO.BOOKID
GROUP BY M.MEMBERID,M.NAME
HAVING COUNT(DISTINCT B.GENRE)=(
    SELECT COUNT(GENRE)
    FROM BOOKS
);

----------------------------------------------------------------------------------------------------------
-- 91. Find members who borrowed books in the same genre as 'M101'.
SELECT M.MEMBERID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.GENRE IN (
    SELECT B1.GENRE
    FROM BOOKS B1
    JOIN BORROWINGS BO1 ON BO1.BOOKID=B1.BOOKID
    WHERE BO1.MEMBERID='M101'
)AND M.MEMBERID<>'M101'
GROUP BY M.MEMBERID,M.NAME;

----------------------------------------------------------------------------------------------------------------

-- 92. List books borrowed in all months of a year.
SELECT B.BOOKID,
B.TITLE
FROM BOOKS B
JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID
WHERE YEAR(BO.BORROWDATE)=2025
GROUP BY B.BOOKID,B.TITLE
HAVING COUNT(DISTINCT MONTH(BO.BORROWDATE))=12;

-------------------------------------------------------------------------------------------------
-- 93. Find members who borrowed books, all published after 2010.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
B.PUBLISHEDYEAR
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.PUBLISHEDYEAR>2010
GROUP BY M.MEMBERID,M.NAME,B.PUBLISHEDYEAR
ORDER BY B.PUBLISHEDYEAR;

-------------------------------------------------------------------------------------------------
-- 94. Display the average number of borrowings per member per year.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
AVG(YEARLY_BORROWED) AS AVERAGE_BORROWINGS_PER_YEAR
FROM MEMBERS M
JOIN (
    SELECT MEMBERID,YEAR(BORROWDATE) AS YEAR,
    COUNT(*) AS YEARLY_BORROWED
    FROM BORROWINGS
    GROUP BY MEMBERID,YEAR(BORROWDATE)
) AS T
ON M.MEMBERID=T.MEMBERID
GROUP BY M.MEMBERID,M.NAME
ORDER BY M.MEMBERID;

--------------------------------------------------------------------------------------------------------------

-- 95. Find members who borrowed more books than the median borrowings.
SET @rownum := 0;
SET @total := (SELECT COUNT(DISTINCT MEMBERID) FROM BORROWINGS);

SELECT M.MEMBERID AS MEMBERID,
       M.NAME AS MEMBER_NAME,
       COUNT(BO.BORROWID) AS TOTAL_BORROWED
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID = M.MEMBERID
GROUP BY M.MEMBERID, M.NAME
HAVING COUNT(BO.BORROWID) > (
    SELECT AVG(middle_vals) AS MEDIAN_BORROWED FROM (
        SELECT t.BORROWCOUNT AS middle_vals
        FROM (
            SELECT COUNT(BO1.BORROWID) AS BORROWCOUNT
            FROM BORROWINGS BO1
            GROUP BY BO1.MEMBERID
            ORDER BY BORROWCOUNT
        ) t,
        (SELECT @rownum := @rownum + 1 AS rn FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) x LIMIT 1000) r
        WHERE r.rn BETWEEN FLOOR((@total + 1) / 2) AND CEIL((@total + 1) / 2)
        LIMIT 2
    ) AS median_table
);
-------------------------------------------------------------------------------------------------


-- 96. Find members who borrowed books by authors with more than 5 books in library.
SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME,
B.AUTHOR,
COUNT(B.BOOKID) AS BOOKS_BY_AUTHOR
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
GROUP BY M.MEMBERID,M.NAME,B.AUTHOR
HAVING COUNT(B.BOOKID)>5;

-------------------------------------------------------------------------------------------------

-- 97. Display members who borrowed the first book added to library.
ALTER TABLE BOOKS ADD ADDED_DATE DATE;
UPDATE BOOKS
SET ADDED_DATE = '2020-01-01'
WHERE BOOKID BETWEEN 1 AND 12;

UPDATE BOOKS
SET ADDED_DATE = '2020-06-01'
WHERE BOOKID BETWEEN 13 AND 24;

UPDATE BOOKS
SET ADDED_DATE = '2021-01-01'
WHERE BOOKID BETWEEN 25 AND 36;
UPDATE BOOKS
SET ADDED_DATE = '2021-06-01'
WHERE BOOKID BETWEEN 37 AND 48;
UPDATE BOOKS
SET ADDED_DATE = '2022-01-01'
WHERE BOOKID BETWEEN 49 AND 60;


SELECT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
JOIN BOOKS B ON B.BOOKID=BO.BOOKID
WHERE B.ADDED_DATE = (SELECT MIN(ADDED_DATE) FROM BOOKS)
ORDER BY M.MEMBERID;

-------------------------------------------------------------------------------------------------

-- 98. List books that were never borrowed in the last 2 years.
SELECT B.BOOKID AS BOOKID,
B.TITLE AS BOOK_TITLE
FROM BOOKS B
LEFT JOIN BORROWINGS BO ON BO.BOOKID=B.BOOKID AND BO.BORROWDATE >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
WHERE BO.BORROWID IS NULL;

-------------------------------------------------------------------------------------------------

-- 99. Find members who borrowed books but no staff assigned (if Staff tracking implemented).
SELECT DISTINCT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
LEFT JOIN BORROWINGS_HANDLED BH ON BH.BORROWID=BO.BORROWID
WHERE BH.STAFFID IS NULL
ORDER BY M.MEMBERID;

-------------------------------------------------------------------------------------------------
-- 100. Display members who borrowed the same book as the top borrower.
SELECT DISTINCT M.MEMBERID AS MEMBERID,
M.NAME AS MEMBER_NAME
FROM MEMBERS M
JOIN BORROWINGS BO ON BO.MEMBERID=M.MEMBERID
WHERE BO.BOOKID IN(
    SELECT BO1.BOOKID
    FROM BORROWINGS BO1
    WHERE BO1.MEMBERID=(
        SELECT BO2.MEMBERID
        FROM BORROWINGS BO2
        GROUP BY BO2.MEMBERID
        ORDER BY COUNT(BO2.MEMBERID)DESC
        LIMIT 1
    )
)
ORDER BY M.MEMBERID;
-------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
