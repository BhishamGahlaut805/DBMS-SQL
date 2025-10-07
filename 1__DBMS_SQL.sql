--------------------------------------------------------------------------------
-- Q0: CREATE AND USE DATABASE
--------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS COLLEGESYSTEM;

USE COLLEGESYSTEM;

--------------------------------------------------------------------------------
-- Q1: CREATE DEPARTMENT TABLE
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DEPARTMENT (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    HOD VARCHAR(100)
);

-- Insert department records
INSERT INTO
    DEPARTMENT (Dept_ID, Dept_Name, HOD)
VALUES (
        1,
        'Computer Science',
        'Dr AJAY'
    ),
    (
        2,
        'Electronics',
        'Mrs SHILPI'
    ),
    (3, 'Mechanical', 'Ms Pooja'),
    (4, 'Civil', 'Mr MANOJ KUMAR'),
    (
        5,
        'Electrical',
        'Dr Seema Dikshit'
    ),
    (
        11,
        'Information technology',
        'Dr AJAY'
    ),
    (
        21,
        'Electrical',
        'Mrs SHILPI'
    ),
    (31, 'Mechanic', 'Ms Pooja'),
    (
        41,
        'Instruments',
        'Mr MANOJ KUMAR'
    ),
    (
        51,
        'Elementary',
        'Dr Seema Dikshit'
    );

--------------------------------------------------------------------------------
-- Q2: CREATE STUDENT TABLE
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS STUDENT (
    Stu_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Dept_ID INT,
    DOB DATE,
    FOREIGN KEY (Dept_ID) REFERENCES DEPARTMENT (Dept_ID)
);

-- Insert student records
INSERT INTO
    STUDENT (Stu_ID, Name, Dept_ID, DOB)
VALUES (101, 'rahul', 1, '2004-05-12'),
    (102, 'aarti', 2, '2003-11-23'),
    (103, 'vijay', 1, '2005-01-17'),
    (104, 'priya', 3, '2004-09-03'),
    (105, 'amit', 4, '2004-12-08'),
    (106, 'neha', 5, '2003-06-22'),
    (107, 'arjun', 2, '2004-03-14'),
    (108, 'sita', 3, '2005-02-26'),
    (109, 'ravi', 1, '2004-07-19'),
    (110, 'kavya', 4, '2003-10-10'),
    (111, 'rahul', 1, '2004-05-12'),
    (112, 'aarti', 2, '2003-11-23'),
    (113, 'vijay', 1, '2005-01-17'),
    (114, 'priya', 3, '2004-09-03'),
    (
        122,
        'rahul',
        NULL,
        '2004-05-12'
    );

--------------------------------------------------------------------------------
-- Q3: CREATE COURSE TABLE
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COURSE (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Dept_ID INT,
    Credits INT,
    FOREIGN KEY (Dept_ID) REFERENCES DEPARTMENT (Dept_ID)
);

-- Insert course records
INSERT INTO
    COURSE (
        Course_ID,
        Course_Name,
        Dept_ID,
        Credits
    )
VALUES (201, 'Data Structures', 1, 4),
    (
        202,
        'Digital Electronics',
        2,
        3
    ),
    (203, 'Thermodynamics', 3, 4),
    (
        204,
        'Structural Analysis',
        4,
        3
    ),
    (205, 'Circuit Theory', 5, 3),
    (206, 'DBMS', 1, 4),
    (
        207,
        'Signals & Systems',
        2,
        3
    ),
    (208, 'Fluid Mechanics', 3, 4),
    (209, 'Concrete Tech', 4, 3),
    (210, 'Power Systems', 5, 4),
    (211, 'Data Structures', 1, 4),
    (
        212,
        'Digital Electronics',
        2,
        3
    ),
    (213, 'Thermodynamics', 3, 4),
    (
        214,
        'Structural Analysis',
        4,
        3
    ),
    (215, 'Circuit Theory', 5, 3),
    (216, 'DBMS', 1, 4),
    (
        217,
        'Signals & Systems',
        2,
        3
    ),
    (218, 'Fluid Mechanics', 3, 4),
    (219, 'Concrete Tech', 4, 3),
    (220, 'Power Systems', 5, 4);

--------------------------------------------------------------------------------
-- Q4: CREATE ENROLLMENT TABLE
--------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ENROLLMENT (
    Enroll_ID INT PRIMARY KEY,
    Stu_ID INT,
    Course_ID INT,
    Grade CHAR(1),
    FOREIGN KEY (Stu_ID) REFERENCES STUDENT (Stu_ID),
    FOREIGN KEY (Course_ID) REFERENCES COURSE (Course_ID)
);

-- Insert enrollment records
INSERT INTO
    ENROLLMENT (
        Enroll_ID,
        Stu_ID,
        Course_ID,
        Grade
    )
VALUES (301, 101, 201, 'A'),
    (302, 102, 202, 'B'),
    (303, 103, 206, 'A'),
    (304, 104, 203, 'C'),
    (305, 105, 204, 'B'),
    (306, 106, 205, 'A'),
    (307, 107, 207, 'C'),
    (308, 108, 208, 'B'),
    (309, 109, 206, 'A'),
    (310, 110, 209, 'B'),
    (311, 101, 201, 'A'),
    (322, 102, 202, 'B'),
    (313, 103, 206, 'A'),
    (324, 104, 203, 'C'),
    (315, 105, 204, 'B'),
    (316, 106, 205, 'A'),
    (317, 107, 207, 'C'),
    (318, 108, 208, 'B'),
    (319, 109, 206, 'A'),
    (320, 110, 209, 'B');

--------------------------------------------------------------------------------
-- Q5: BASIC SELECT QUERIES
--------------------------------------------------------------------------------

-- 5.1 Display all student details
SELECT * FROM STUDENT;

-- 5.2 Names of students in Computer Science department (Dept_ID = 1)
SELECT * FROM STUDENT WHERE Dept_ID = 1;

-- 5.3 List courses having more than 3 credits
SELECT * FROM COURSE WHERE Credits > 3;

-- 5.4 Students born after 2000
SELECT * FROM STUDENT WHERE DOB > '2000-12-31';

-- 5.5 Department names in alphabetical order
SELECT Dept_Name FROM DEPARTMENT ORDER BY Dept_Name ASC;

-- 5.6 Total students in each department
SELECT Dept_ID, COUNT(*) AS TotalStudents
FROM STUDENT
GROUP BY
    Dept_ID;

-- 5.7 Average credits of all courses
SELECT AVG(Credits) AS AverageCredits FROM COURSE;

-- 5.8 Highest and lowest grade in enrollment
SELECT MIN(Grade) AS LowestGrade, MAX(Grade) AS HighestGrade
FROM ENROLLMENT;

-- 5.9 Students not enrolled in any course
SELECT *
FROM STUDENT
WHERE
    Stu_ID NOT IN(
        SELECT Stu_ID
        FROM ENROLLMENT
    );

-- 5.10 Students who have grade 'A' in any course
SELECT S.Name
FROM STUDENT S
    JOIN ENROLLMENT E ON S.Stu_ID = E.Stu_ID
WHERE
    E.Grade = 'A';

-----------------------------------------------------------------------------
-- Q6. Some Functions Testing...AVG,SUM,STDDEV,VARIANCE,COUNT,COUNT*,MIN,MAX
-- Q6.1
SELECT AVG(STU_ID) FROM STUDENT;

SELECT SUM(STU_ID) FROM STUDENT;

-- Q6.2 WHERE,GROUPBY,ORDERBY
SELECT STDDEV(STU_ID), VARIANCE(STU_ID), COUNT(STU_ID), COUNT(*), AVG(STU_ID), SUM(STU_ID), MIN(STU_ID), MAX(STU_ID)
FROM STUDENT
WHERE
    DEPT_ID > 2;

SELECT * FROM COURSE WHERE COURSE_ID + CREDITS > 210 GROUP BY COURSE_ID;

SELECT NAME, STU_ID FROM STUDENT ORDER BY STU_ID DESC;

SELECT COUNT(DISTINCT NAME) FROM STUDENT;

SELECT MIN(GRADE) AS MAXGRADE, MAX(GRADE) AS MINGRADE FROM ENROLLMENT;

SELECT DEPT_NAME
FROM DEPARTMENT
WHERE
    DEPT_ID NOT IN(
        SELECT DEPT_ID
        FROM COURSE
    );

SELECT *
FROM DEPARTMENT
WHERE
    DEPT_ID NOT IN(
        SELECT DEPT_ID
        FROM COURSE
    );

SELECT * FROM STUDENT WHERE DEPT_ID IS NULL;

SELECT * FROM STUDENT;

SELECT * FROM ENROLLMENT;

SELECT * FROM DEPARTMENT;

SELECT * FROM COURSE;

---------------------------------------------------------------------------------------------------------------------
-- 7.AGGREGATE FUNCTIONS-- ----------------------------------------------------------------------------
-- Q 7.1 Find the average marks obtained by students in each course.

ALTER TABLE ENROLLMENT ADD Marks INT;

UPDATE ENROLLMENT SET Marks = 95 WHERE Enroll_ID = 301;

UPDATE ENROLLMENT SET Marks = 78 WHERE STU_ID = 102;

UPDATE ENROLLMENT SET Marks = 78 WHERE STU_ID = 102;

UPDATE ENROLLMENT SET Marks = 79 WHERE STU_ID = 103;

UPDATE ENROLLMENT SET MARKS = 100 WHERE STU_ID = 104;

UPDATE ENROLLMENT SET MARKS = 10 WHERE STU_ID = 105;

UPDATE ENROLLMENT SET MARKS = 90 WHERE STU_ID = 106;

UPDATE ENROLLMENT SET MARKS = 70 WHERE STU_ID = 107;

UPDATE ENROLLMENT SET MARKS = 45 WHERE STU_ID = 108;
---------------------------------------------------------------------------------------------
SELECT
    AVG(MARKS) AS AVERAGE_MARKS,
    COURSE_ID AS IDOFCOURSE
FROM ENROLLMENT
GROUP BY
    COURSE_ID;
-------------------------------------------------------------------------------------------------

-- Q 7.2 Display the maximum, minimum, and average age of students department-wise.

ALTER TABLE STUDENT ADD COLUMN AGE INT;

UPDATE STUDENT
SET
    AGE = TIMESTAMPDIFF(YEAR, DOB, "2025-09-05")
WHERE
    Stu_ID IS NOT NULL;

SELECT
    DEPT_ID AS DEPARTMENT_ID,
    MIN(AGE) AS MINIMUM_AGE,
    MAX(AGE) AS MAXIMUM_AGE,
    AVG(AGE) AS AVERAGE_AGE
FROM STUDENT
GROUP BY
    DEPT_ID;
----------------------------------------------------------------------------------------------------------------------

-- Q 7.3 Count the number of students enrolled in each course.

SELECT COURSE_ID, COUNT(STU_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY
    COURSE_ID;

SELECT * FROM STUDENT;

SELECT * FROM ENROLLMENT;
----------------------------------------------------------------------------------------------------

-- Q 8 CHARACTER FUNCTIONS--------------------------------------------------------------------------

-- 8.1 Display student names in uppercase.
-- 8.2 Show the length of each course name.
-- 8.3 Display the first three letters of all department names.

SELECT UPPER(NAME) FROM STUDENT;

SELECT
    COURSE_NAME,
    LENGTH(COURSE_NAME) AS LENGTH_OF_COURSE_NAME
FROM COURSE;

SELECT DEPT_NAME, LEFT(DEPT_NAME, 3) AS FIRST3_CHARACTERS
FROM DEPARTMENT;
----------------------------------------------------------------------------------------
-- Q 9.UNION/SET OPERATIONS

-- 9.1 List the RollNos of students who enrolled in DBMS course.
-- 9.2 List the RollNos of students who enrolled in OS course.
-- 9.3 Use UNION to get RollNos of students who enrolled in either DBMS or OS.
-- 9.4 Use INTERSECT to get RollNos of students who enrolled in both DBMS and OS.

SELECT
    STU_ID AS ROLLNO,
    COURSE_ID AS DBMS_COURSE_ID
FROM ENROLLMENT
WHERE
    COURSE_ID IN (
        SELECT COURSE_ID
        FROM COURSE
        WHERE
            COURSE_NAME = "DBMS"
    );
------------------------------------------------------------------------------------
-- 9.2 List the RollNos of students who enrolled in OS course.
SELECT
    STU_ID AS ROLLNO,
    COURSE_ID AS OS_COURSE_ID
FROM ENROLLMENT
WHERE
    COURSE_ID IN (
        SELECT COURSE_ID
        FROM COURSE
        WHERE
            COURSE_NAME = "OS"
    );

---------------------------------------------------------------------------
INSERT INTO
    COURSE (
        Course_ID,
        Course_Name,
        Dept_ID,
        Credits
    )
VALUES (223, 'OS', 1, 4);

INSERT INTO
    ENROLLMENT (
        Enroll_ID,
        Stu_ID,
        Course_ID,
        Grade,
        MARKS
    )
VALUES (321, 101, 223, 'B', 76),
    (323, 106, 223, 'D', 45);

--------------------------------------------------------------------
-- 9.3 Use UNION to get RollNos of students who enrolled in either DBMS or OS.

SELECT
    Stu_ID AS ROLLNO,
    Course_ID AS COURSE_ID
FROM ENROLLMENT
WHERE
    Course_ID IN (
        SELECT Course_ID
        FROM COURSE
        WHERE
            Course_Name = 'DBMS'
    )
UNION
SELECT
    Stu_ID AS ROLLNO,
    Course_ID AS COURSE_ID
FROM ENROLLMENT
WHERE
    Course_ID IN (
        SELECT Course_ID
        FROM COURSE
        WHERE
            Course_Name = 'OS'
    );

------------------------------------------------------------------------------------------
-- APPLY--  UNION--

SELECT
    E.Stu_ID AS ROLLNO,
    E.Course_ID AS COURSE_ID,
    (
        SELECT C.Course_Name
        FROM COURSE C
        WHERE
            C.Course_ID = E.Course_ID
    ) AS COURSE_NAME,
    (
        SELECT S.Name
        FROM STUDENT S
        WHERE
            S.Stu_ID = E.Stu_ID
    ) AS STUDENT_NAME
FROM ENROLLMENT E
WHERE
    E.Course_ID IN (
        SELECT Course_ID
        FROM COURSE
        WHERE
            Course_Name = 'DBMS'
    )
UNION
SELECT
    E.Stu_ID AS ROLLNO,
    E.Course_ID AS COURSE_ID,
    (
        SELECT C.Course_Name
        FROM COURSE C
        WHERE
            C.Course_ID = E.Course_ID
    ) AS COURSE_NAME,
    (
        SELECT S.Name
        FROM STUDENT S
        WHERE
            S.Stu_ID = E.Stu_ID
    ) AS STUDENT_NAME
FROM ENROLLMENT E
WHERE
    E.Course_ID IN (
        SELECT Course_ID
        FROM COURSE
        WHERE
            Course_Name = 'OS'
    );

-------------------------------------------------------------------------------------
-- LIKE UNION-bUT NOT UNION IN REAL
SELECT
    Stu_ID AS ROLLNO,
    Course_ID,
    (
        SELECT Course_Name
        FROM COURSE
        WHERE
            COURSE.Course_ID = ENROLLMENT.Course_ID
    ) AS COURSE_NAME,
    (
        SELECT Name
        FROM STUDENT
        WHERE
            STUDENT.Stu_ID = ENROLLMENT.Stu_ID
    ) AS STUDENT_NAME
FROM ENROLLMENT
WHERE
    Course_ID IN (
        SELECT Course_ID
        FROM COURSE
        WHERE
            Course_Name IN ('DBMS', 'OS')
    );

----------------------------------------------------------------------------------------
INSERT INTO
    ENROLLMENT (
        Enroll_ID,
        Stu_ID,
        Course_ID,
        Grade,
        MARKS
    )
VALUES (327, 101, 206, 'B', 76),
    (326, 106, 206, 'D', 45);
----------------------------------------------------------------------------

-- 9.4 Use INTERSECT to get RollNos of students who enrolled in both DBMS and OS.

-- ! INTERSECT NOT WORKING IN MYSQL
SELECT Stu_ID, Course_ID
FROM ENROLLMENT
WHERE
    Course_ID IN (
        SELECT Course_ID
        FROM COURSE
        WHERE
            Course_Name = 'DBMS'
    ) INTERSECT

SELECT Stu_ID, Course_ID
FROM ENROLLMENT
WHERE
    Course_ID IN (
        SELECT Course_ID
        FROM COURSE
        WHERE
            Course_Name = 'OS'
    );

SELECT * FROM STUDENT;

SELECT * FROM DEPARTMENT;

SELECT * FROM COURSE;

SELECT * FROM ENROLLMENT;
-----------------------------------------------------------------------------------------------

-- 9.4 Use INTERSECT to get RollNos of students who enrolled in both DBMS and OS.
-- USING GROUP BY,HAVING FOR INTERSECTION--
SELECT STU_ID, (
        SELECT NAME
        FROM STUDENT
        WHERE
            STUDENT.STU_ID = ENROLLMENT.STU_ID
    ) AS NAME_OF_STUDENT
FROM ENROLLMENT
WHERE
    COURSE_ID IN (
        SELECT COURSE_ID
        FROM COURSE
        WHERE
            COURSE_NAME IN ("DBMS", "OS")
    )
GROUP BY
    STU_ID
HAVING
    COUNT(DISTINCT COURSE_ID) = 2;

-----------------------------------------------------------------------------------------------

-- Q 10 SUBQUERIES--------------------------------------------------

-- 10.1 Find students who scored above the average marks in DBMS.

-- 10.2 Display the name of the student who scored the highest marks in any course.

-- 10.3 List students who belong to the same department as student 'S101'.

-- 10.1 Find students who scored above the average marks in DBMS.
SELECT STU_ID, (
        SELECT NAME
        FROM STUDENT
        WHERE
            STUDENT.STU_ID = ENROLLMENT.STU_ID
    ) AS NAME
FROM ENROLLMENT
WHERE
    Marks > (
        SELECT AVG(Marks)
        FROM ENROLLMENT
    );

----------------------------------------------------------------------
-- USING SUBQUERIES
SELECT Stu_ID
FROM STUDENT
WHERE
    Stu_ID IN (
        SELECT Stu_ID
        FROM ENROLLMENT
        WHERE
            Marks > (
                SELECT AVG(Marks)
                FROM ENROLLMENT
            )
    );

-------------------------------------------------------------------------------------

-- 10.2 Display the name of the student who scored the highest marks in any course.

SELECT Name
FROM STUDENT
WHERE
    Stu_ID IN (
        SELECT Stu_ID
        FROM ENROLLMENT
        WHERE
            Marks = (
                SELECT MAX(Marks)
                FROM ENROLLMENT
            )
    );
-----------------------------------------------------------------------

-- 10.3 List students who belong to the same department as student '101'

-- STUDENTS IN SAME DEPARTMENT
SELECT
    Name,
    Stu_ID,
    Dept_ID,
    (
        SELECT DEPT_NAME
        FROM DEPARTMENT
        WHERE
            STUDENT.DEPT_ID = DEPARTMENT.DEPT_ID
    ) AS DEPARTMENT_NAME
FROM STUDENT
WHERE
    Dept_ID IN (
        SELECT DEPT_ID
        FROM STUDENT
        WHERE
            STU_ID = 101
    );
--------------------------------------------------------------------------------------------
-- 10.3 List students who belong to the same department as student '102'.
SELECT
    Name,
    Stu_ID,
    Dept_ID,
    (
        SELECT DEPT_NAME
        FROM DEPARTMENT
        WHERE
            DEPARTMENT.Dept_ID = STUDENT.Dept_ID
    ) AS DEPARTMENT_NAME
FROM STUDENT
WHERE
    STU_ID = 102;

-------------------------------------------------------------------------------------------

SELECT * FROM DEPARTMENT;

SELECT * FROM COURSE;

SELECT * FROM STUDENT;

SELECT * FROM ENROLLMENT;
---------------------------------------------------------------------------------------------

-- Q 11. Operators

-- 11.1 Display students whose marks are between 60 and 80.
-- 11.2 Show details of students with Age >= 20 AND Dept = 'CSE'.
-- 11.3 List students with marks < 40 OR Age > 22.
--------------------------------------------------------------------
-- 11.1 Display students whose marks are between 60 and 80.
SELECT STU_ID, (
        SELECT NAME
        FROM STUDENT S
        WHERE
            S.STU_ID = E.STU_ID
    ) AS NAME
FROM ENROLLMENT E
WHERE
    E.MARKS BETWEEN 60 AND 80;

--------------------------------------------

SELECT STU_ID, MARKS, (
        SELECT NAME
        FROM STUDENT S
        WHERE
            S.STU_ID = E.STU_ID
    ) AS NAME
FROM ENROLLMENT E
WHERE
    E.MARKS BETWEEN 60 AND 80;

-----------------------------------------------------------------------------------

-- 11.2 Show details of students with Age >= 20 AND Dept = 'CSE'.
SELECT S.Stu_ID, S.Name
FROM STUDENT S
WHERE
    S.Age >= 20
    AND EXISTS (
        SELECT 1 -- Just Dummy usage
        FROM DEPARTMENT D
        WHERE
            D.Dept_ID = S.Dept_ID
            AND D.Dept_Name = 'Computer Science'
    );

-- Q 11.3 List students with marks < 40 OR Age > 22.
SELECT S.Stu_ID, S.Name
FROM STUDENT S
WHERE
    S.Age > 22
    OR EXISTS (
        SELECT 1
        FROM ENROLLMENT E
        WHERE
            E.Stu_ID = S.Stu_ID
            AND E.Marks < 40
    );

----------------------------------------------------------------------------------------------------
SELECT * FROM DEPARTMENT;

SELECT * FROM COURSE;

SELECT * FROM STUDENT;

SELECT * FROM ENROLLMENT;