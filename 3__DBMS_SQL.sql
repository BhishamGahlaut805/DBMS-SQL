USE COLLEGESYSTEM;
----------------------------------------------------------------------------------------------------
SELECT *FROM DEPARTMENT;
SELECT * FROM COURSE;
SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;

-------------------------------------------------------------------------------------------------------
-- Q1. Membership Functions (IN, NOT IN)

-- Q 1.1 Display students enrolled in courses with CourseID IN (201, 202, 203).

SELECT STU_ID,NAME
FROM STUDENT S
WHERE S.STU_ID IN(
SELECT E.STU_ID
FROM ENROLLMENT E
WHERE E.COURSE_ID IN(201,202,203)
);

--------------------------------------------------------------------------------

-- 1.2 Find students who are NOT IN the ENROLLMENT table (not enrolled in any course).

SELECT STU_ID,NAME
FROM STUDENT K
WHERE K.STU_ID NOT IN(
SELECT E.STU_ID 
FROM ENROLLMENT E
WHERE E.STU_ID IS NOT NULL
);
--------------------------------------------------------------------------------

-- 2. Pattern Matching (LIKE)
-- 2.1 Display student names that start with ‘A’.
-- 2.2 List students whose names end with ‘a’.
-- 2.3 Show courses that contain the word ‘Data’ in their name.

-----------------------------------------------------------------------------------------
-- 2.1 Display student names that start with ‘A’.
SELECT NAME,STU_ID
FROM STUDENT
WHERE NAME LIKE 'A%';
-------------------------------------------------------------------------------------------

-- 2.2 List students whose names end with ‘a’.
SELECT NAME,STU_ID
FROM STUDENT
WHERE NAME LIKE '%a';

-----------------------------------------------------------------------------------------------
-- 2.3 Show courses that contain the word ‘Data’ in their name.
SELECT COURSE_NAME
FROM COURSE
WHERE COURSE_NAME LIKE '%Data%';

-------------------------------------------------------------------------------------------------

-- Advanced DBMS Lab Questions (No JOINs)
-- 1.	Find the second highest marks in the ENROLLMENT table using MAX and subquery.
-- 2.	Display departments where the average student age > 21.
-- 3.	List courses having more than 5 students enrolled.
-- 4.	Display student names in reverse order using REVERSE() (or SUBSTR with LENGTH).
-- 5.	Convert all course names to uppercase and display only the first 5 characters.

-------------------------------------------------------------------------------------------------------

-- 1.	Find the second highest marks in the ENROLLMENT table using MAX and subquery.
SELECT MAX(MARKS) AS SECOND_HIGHEST_MARKS
FROM ENROLLMENT
WHERE MARKS <(
SELECT MAX(MARKS)
FROM ENROLLMENT);

-- 3RD HIGHEST MARKS
SELECT MAX(MARKS) AS THIRD_HIGHEST_MARKS
FROM ENROLLMENT
WHERE MARKS <(
SELECT MAX(MARKS)
FROM ENROLLMENT
WHERE MARKS < (
SELECT MAX(MARKS)
FROM ENROLLMENT));
-----------------------------------------------------------------------------------------

-- Display departments where the average student age > 21.-- 
SELECT DEPT_NAME,DEPT_ID,
 (SELECT AVG(S.AGE)
        FROM STUDENT S
        WHERE S.DEPT_ID = D.DEPT_ID) AS AVG_AGE
FROM DEPARTMENT D
WHERE(
SELECT AVG(S.AGE)
FROM STUDENT S
WHERE S.DEPT_ID = D.DEPT_ID
)>21;

------------------------------------------------------------------------------------
--  3.	List courses having more than 5 students enrolled.
SELECT E.COURSE_ID ,COUNT(E.STU_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT E
GROUP BY E.COURSE_ID
HAVING COUNT(E.STU_ID)>5;

-------------------------------------------------------------------------------------------
-- 4. Display student names in reverse order using REVERSE() (or SUBSTR with LENGTH).
SELECT UPPER(REVERSE(NAME)) FROM STUDENT;
SELECT REVERSE(NAME) FROM STUDENT;

SELECT NAME,
       CONCAT(
         SUBSTR(NAME, LENGTH(NAME), 1),
         SUBSTR(NAME, LENGTH(NAME)-1, 1),
         SUBSTR(NAME, LENGTH(NAME)-2, 1),
         SUBSTR(NAME, LENGTH(NAME)-3, 1),
         SUBSTR(NAME,LENGTH(NAME)-4,1)
       ) AS REVERSED_NAME
FROM STUDENT;

-----------------------------------------------------------------------------------------------------

-- 5.	Convert all course names to uppercase and display only the first 5 characters.

SELECT COURSE_ID,
       UPPER(SUBSTR(COURSE_NAME, 1, 5)) AS SHORT_NAME
FROM COURSE;

--------------------------------------------------------------------------------------------------
-- 6. Display RollNos of students who enrolled in DBMS or OS but not both (use UNION and MINUS).
-- Students in DBMS but not OS

SELECT STU_ID AS ROLL_NO
FROM ENROLLMENT
WHERE COURSE_ID IN (
    SELECT COURSE_ID FROM COURSE WHERE COURSE_NAME = 'DBMS'
)
AND STU_ID NOT IN (
    SELECT STU_ID
    FROM ENROLLMENT
    WHERE COURSE_ID IN (
        SELECT COURSE_ID FROM COURSE WHERE COURSE_NAME = 'OS'
    )
)

UNION

-- Students in OS but not DBMS
SELECT STU_ID AS ROLL_NO
FROM ENROLLMENT
WHERE COURSE_ID IN (
    SELECT COURSE_ID FROM COURSE WHERE COURSE_NAME = 'OS'
)
AND STU_ID NOT IN (
    SELECT STU_ID
    FROM ENROLLMENT
    WHERE COURSE_ID IN (
        SELECT COURSE_ID FROM COURSE WHERE COURSE_NAME = 'DBMS'
    )
);

-----------------------------------------------------------------------------------------------------------------
-- 7.Show students whose names have exactly 5 characters using LENGTH().
SELECT NAME 
FROM STUDENT
WHERE LENGTH(NAME)=5;
-----------------------------------------------------------------------------------------------------------------
-- 8.Get the list of all CourseIDs that belong either to CSE students or to ECE students (use UNION).

SELECT COURSE_ID
FROM ENROLLMENT
WHERE STU_ID IN(
SELECT STU_ID
FROM STUDENT 
WHERE DEPT_ID IN(
SELECT DEPT_ID
FROM DEPARTMENT D
WHERE D.DEPT_NAME="Computer Science"
)
)
UNION

SELECT COURSE_ID
FROM ENROLLMENT
WHERE STU_ID IN(
SELECT STU_ID
FROM STUDENT 
WHERE DEPT_ID IN(
SELECT DEPT_ID
FROM DEPARTMENT D
WHERE D.DEPT_NAME="ELECTRONICS"
)
);

-------------------------------
-- GETTING WITH NAMES-- OTHER APPROACH
SELECT COURSE_ID,
(SELECT COURSE_NAME
FROM COURSE C
WHERE E.COURSE_ID =C.COURSE_ID) AS COURSE_NAME
FROM ENROLLMENT E
WHERE STU_ID IN(
SELECT STU_ID
FROM STUDENT 
WHERE DEPT_ID IN(
SELECT DEPT_ID
FROM DEPARTMENT D
WHERE D.DEPT_NAME IN ("Computer Science","Electronics")
)
);

---------------------------------------------------------------------------------------------------------------

-- Find students who are in both Semester 3 and Semester 5 lists (use INTERSECT).
-- CREATING A TABLE FOR SEMESTER 3 HAVING STU_ROLL NO

CREATE TABLE IF NOT EXISTS SEM3 (
    STU_ID INT PRIMARY KEY,
    FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID)
);
INSERT INTO SEM3 (Stu_ID)
VALUES (101), (102), (103), (104);

CREATE TABLE IF NOT EXISTS SEM5 (
    STU_ID INT PRIMARY KEY,
    FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID)
);
INSERT INTO SEM5 (Stu_ID)
VALUES (107), (106), (108), (109);
INSERT INTO SEM5 (Stu_ID)
VALUES (110), (111), (101), (103);
-------------------------------------------------------------------------------------------------

-- 9.Find students who are in both Semester 3 and Semester 5 lists (use INTERSECT).
-- MYSQL DOES NOT SUPPORT INTERSECT
SELECT STU_ID,
(SELECT NAME
FROM STUDENT S
WHERE S.STU_ID=SEM3.STU_ID) AS NAME
FROM SEM3 
WHERE SEM3.STU_ID IN(
SELECT STU_ID FROM SEM5);

-----------------------------------------------------------------------------------------------------
-- 10.Find students whose marks are greater than the average marks of their own course.

SELECT E.Stu_ID, 
       (SELECT S.Name FROM STUDENT S WHERE S.Stu_ID = E.Stu_ID) AS StudentName,
       MARKS,
       E.Course_ID,
	(SELECT AVG(E3.Marks)
    FROM ENROLLMENT E3
    WHERE E3.Course_ID = E.Course_ID) AS AVERAGE_MARKS_OF_COURSE
FROM ENROLLMENT E
WHERE E.Marks > (
    SELECT AVG(E2.Marks)
    FROM ENROLLMENT E2
    WHERE E2.Course_ID = E.Course_ID
);

-------------------------------------------------------------------------------------------------------

-- 11. Display the name of the student who has the minimum marks overall.

SELECT NAME, STU_ID
FROM STUDENT S
WHERE S.STU_ID IN (
    SELECT STU_ID 
    FROM ENROLLMENT E
    WHERE MARKS = (
        SELECT MIN(MARKS) 
        FROM ENROLLMENT
    )
);

 ------------------------------------------------------------------------------------------------
 -- 12.List students whose RollNo is in the set of students who scored highest marks in any course.
SELECT NAME,STU_ID AS ROLL_NO
FROM STUDENT
WHERE STU_ID IN (
SELECT STU_ID
FROM ENROLLMENT E
WHERE MARKS =(
SELECT MAX(MARKS)
FROM ENROLLMENT E2
WHERE E2.COURSE_ID =E.COURSE_ID)
);

--------------------------------------------------------------------------------------------

-- 13. Display students whose marks are between 70 and 90 and age is not 21
SELECT 
    S.NAME,
    S.STU_ID AS ROLL_NO,
    S.AGE
FROM STUDENT S
WHERE S.AGE <> 21
  AND S.STU_ID IN (
      SELECT E.STU_ID
      FROM ENROLLMENT E
      WHERE E.MARKS BETWEEN 70 AND 90
  );

-----------------------------------------------------------------------------------------------------

-- 14. Find students with marks < 40 OR Age > 22, sorted by marks descending.
SELECT NAME, STU_ID, AGE,
       (SELECT MAX(MARKS) 
        FROM ENROLLMENT E 
        WHERE E.STU_ID = S.STU_ID) AS MARKS
FROM STUDENT S
WHERE AGE > 22 
   OR STU_ID IN (
       SELECT STU_ID
       FROM ENROLLMENT E2
       WHERE E2.MARKS < 40
   )
ORDER BY MARKS DESC;

------------------------------------------------------------------------------------------------
-- 15.Show all students where Age * 2 is greater than Marks.

SELECT NAME, STU_ID, AGE
FROM STUDENT S
WHERE AGE * 2 > ANY (
    SELECT MARKS
    FROM ENROLLMENT E
    WHERE E.STU_ID = S.STU_ID
);

----------------------------------------------------------------------------------------------------------

-- 16. Find students who are enrolled in at least one course
SELECT NAME, STU_ID
FROM STUDENT S
WHERE EXISTS (
    SELECT 1
    FROM ENROLLMENT E
    WHERE E.STU_ID = S.STU_ID
);

---------------------------------------------------------------------------------------------
-- 17. List students who are not enrolled in any course using NOT IN
SELECT NAME, STU_ID
FROM STUDENT S
WHERE STU_ID NOT IN (
    SELECT STU_ID
    FROM ENROLLMENT E
);

--------------------------------------------------------------------------------------------------
-- 18.Display courses where CourseID is IN the set of courses taken by '101'
SELECT *
FROM COURSE
WHERE COURSE_ID IN(
SELECT COURSE_ID 
FROM ENROLLMENT
WHERE STU_ID=101
);

-------------------------------------------------------------------------------------------------
-- 19.Find students whose names start with ‘S’ and end with ‘a’.
SELECT * 
FROM STUDENT
WHERE NAME LIKE 'S%a';
-----------------------------------------------------------------------------------------------------
-- 20.Display all courses whose names contain the word ‘System’.
SELECT *
FROM COURSE
WHERE COURSE_NAME LIKE '%System%';

--------------------------------------------------------------------------------------------------------
INSERT INTO STUDENT(STU_ID,NAME,DEPT_ID,DOB,AGE)
VALUES
(124,'ANIL',NULL,'2003-09-26',21);

-- 21. List students whose names have ‘an’ anywhere in them.
SELECT *
FROM STUDENT
WHERE NAME LIKE '%an%';

-------------------------------------------------------------------------------

SELECT *FROM DEPARTMENT;
SELECT * FROM COURSE;
SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;
SELECT * FROM SEM3;
SELECT * FROM SEM5;

