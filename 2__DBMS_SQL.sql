USE COLLEGESYSTEM;
----------------------------------------------------------------------------------------------------
SELECT *FROM DEPARTMENT;
SELECT * FROM COURSE;
SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;

---------------------------------------------------------------------------------------------------------------------
-- 7.AGGREGATE FUNCTIONS-- ----------------------------------------------------------------------------
-- Q 7.1 Find the average marks obtained by students in each course.

ALTER TABLE ENROLLMENT
ADD Marks INT;

UPDATE ENROLLMENT SET Marks = 95 WHERE Enroll_ID = 301;
UPDATE ENROLLMENT
 SET Marks = 78
 WHERE STU_ID =102;
UPDATE ENROLLMENT
 SET Marks = 78
 WHERE STU_ID =102;
UPDATE ENROLLMENT
 SET Marks = 79
 WHERE STU_ID =103;
 
 UPDATE ENROLLMENT
 SET MARKS=100
 WHERE STU_ID=104;
 
  UPDATE ENROLLMENT
 SET MARKS=10
 WHERE STU_ID=105;
  UPDATE ENROLLMENT
 SET MARKS=90
 WHERE STU_ID=106;
  UPDATE ENROLLMENT
 SET MARKS=70
 WHERE STU_ID=107;
  UPDATE ENROLLMENT
 SET MARKS=45
 WHERE STU_ID=108;
 ---------------------------------------------------------------------------------------------
SELECT AVG(MARKS) AS AVERAGE_MARKS,COURSE_ID AS IDOFCOURSE FROM ENROLLMENT
GROUP BY COURSE_ID;
-------------------------------------------------------------------------------------------------

-- Q 7.2 Display the maximum, minimum, and average age of students department-wise.

ALTER TABLE STUDENT
ADD COLUMN AGE INT;

UPDATE STUDENT
SET AGE = TIMESTAMPDIFF(YEAR, DOB, "2025-09-05")
WHERE Stu_ID IS NOT NULL;


SELECT DEPT_ID AS DEPARTMENT_ID, MIN(AGE) AS MINIMUM_AGE,MAX(AGE) AS MAXIMUM_AGE,AVG(AGE) AS AVERAGE_AGE FROM STUDENT
GROUP BY DEPT_ID;
----------------------------------------------------------------------------------------------------------------------

-- Q 7.3 Count the number of students enrolled in each course.

SELECT COURSE_ID,COUNT(STU_ID)	AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY COURSE_ID;

SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;
----------------------------------------------------------------------------------------------------

-- Q 8 CHARACTER FUNCTIONS--------------------------------------------------------------------------

-- 8.1 Display student names in uppercase.
-- 8.2 Show the length of each course name.
-- 8.3 Display the first three letters of all department names.

SELECT UPPER(NAME) FROM STUDENT;
SELECT COURSE_NAME,
LENGTH(COURSE_NAME) AS LENGTH_OF_COURSE_NAME 
FROM COURSE;
SELECT DEPT_NAME ,LEFT(DEPT_NAME,3) AS FIRST3_CHARACTERS
FROM DEPARTMENT;
----------------------------------------------------------------------------------------
-- Q 9.UNION/SET OPERATIONS

-- 9.1 List the RollNos of students who enrolled in DBMS course.
-- 9.2 List the RollNos of students who enrolled in OS course.
-- 9.3 Use UNION to get RollNos of students who enrolled in either DBMS or OS.
-- 9.4 Use INTERSECT to get RollNos of students who enrolled in both DBMS and OS.

SELECT STU_ID AS ROLLNO,COURSE_ID AS DBMS_COURSE_ID	
FROM ENROLLMENT
WHERE COURSE_ID IN (
	SELECT COURSE_ID 
	FROM COURSE
	WHERE COURSE_NAME="DBMS"
);
------------------------------------------------------------------------------------
-- 9.2 List the RollNos of students who enrolled in OS course.
SELECT STU_ID AS ROLLNO,COURSE_ID AS OS_COURSE_ID	
FROM ENROLLMENT
WHERE COURSE_ID IN (
	SELECT COURSE_ID 
	FROM COURSE
	WHERE COURSE_NAME="OS"
);

---------------------------------------------------------------------------
INSERT INTO COURSE (Course_ID, Course_Name, Dept_ID, Credits) VALUES
(223, 'OS', 1, 4);

INSERT INTO ENROLLMENT (Enroll_ID, Stu_ID, Course_ID, Grade,MARKS) VALUES
(321, 101, 223, 'B',76),
(323, 106, 223, 'D',45);

--------------------------------------------------------------------
-- 9.3 Use UNION to get RollNos of students who enrolled in either DBMS or OS.

SELECT Stu_ID AS ROLLNO, Course_ID AS COURSE_ID
FROM ENROLLMENT
WHERE Course_ID IN (
    SELECT Course_ID 
    FROM COURSE
    WHERE Course_Name = 'DBMS'
)

UNION

SELECT Stu_ID AS ROLLNO, Course_ID AS COURSE_ID
FROM ENROLLMENT
WHERE Course_ID IN (
    SELECT Course_ID 
    FROM COURSE
    WHERE Course_Name = 'OS'
);

------------------------------------------------------------------------------------------
-- APPLY--  UNION-- 

SELECT 
    E.Stu_ID AS ROLLNO,
    E.Course_ID AS COURSE_ID,
    (SELECT C.Course_Name 
     FROM COURSE C 
     WHERE C.Course_ID = E.Course_ID) AS COURSE_NAME,
    (SELECT S.Name 
     FROM STUDENT S 
     WHERE S.Stu_ID = E.Stu_ID) AS STUDENT_NAME
FROM ENROLLMENT E
WHERE E.Course_ID IN (
    SELECT Course_ID 
    FROM COURSE 
    WHERE Course_Name = 'DBMS'
)

UNION

SELECT 
    E.Stu_ID AS ROLLNO,
    E.Course_ID AS COURSE_ID,
    (SELECT C.Course_Name 
     FROM COURSE C 
     WHERE C.Course_ID = E.Course_ID) AS COURSE_NAME,
    (SELECT S.Name 
     FROM STUDENT S 
     WHERE S.Stu_ID = E.Stu_ID) AS STUDENT_NAME
FROM ENROLLMENT E
WHERE E.Course_ID IN (
    SELECT Course_ID 
    FROM COURSE 
    WHERE Course_Name = 'OS'
);

-------------------------------------------------------------------------------------
-- LIKE UNION-bUT NOT UNION IN REAL
SELECT 
    Stu_ID AS ROLLNO,
    Course_ID,
    (SELECT Course_Name FROM COURSE WHERE COURSE.Course_ID = ENROLLMENT.Course_ID) AS COURSE_NAME,
    (SELECT Name FROM STUDENT WHERE STUDENT.Stu_ID = ENROLLMENT.Stu_ID) AS STUDENT_NAME
FROM ENROLLMENT
WHERE Course_ID IN (
    SELECT Course_ID 
    FROM COURSE 
    WHERE Course_Name IN ('DBMS','OS')
);

----------------------------------------------------------------------------------------
INSERT INTO ENROLLMENT (Enroll_ID, Stu_ID, Course_ID, Grade,MARKS) VALUES
(327, 101, 206, 'B',76),
(326, 106, 206, 'D',45);
----------------------------------------------------------------------------

-- 9.4 Use INTERSECT to get RollNos of students who enrolled in both DBMS and OS.

-- ! INTERSECT NOT WORKING IN MYSQL
SELECT Stu_ID, Course_ID
FROM ENROLLMENT
WHERE Course_ID IN (
    SELECT Course_ID FROM COURSE WHERE Course_Name = 'DBMS'
)

INTERSECT

SELECT Stu_ID, Course_ID
FROM ENROLLMENT
WHERE Course_ID IN (
    SELECT Course_ID FROM COURSE WHERE Course_Name = 'OS'
);

SELECT *FROM STUDENT;
SELECT *FROM DEPARTMENT;
SELECT * FROM COURSE;
SELECT * FROM ENROLLMENT;
-----------------------------------------------------------------------------------------------

-- 9.4 Use INTERSECT to get RollNos of students who enrolled in both DBMS and OS.
-- USING GROUP BY,HAVING FOR INTERSECTION--  
SELECT STU_ID,
(SELECT NAME 
FROM STUDENT
WHERE STUDENT.STU_ID =ENROLLMENT.STU_ID 
) AS NAME_OF_STUDENT
FROM ENROLLMENT
WHERE COURSE_ID IN (
SELECT COURSE_ID FROM COURSE
WHERE COURSE_NAME IN("DBMS","OS")
)
GROUP BY STU_ID
HAVING COUNT(DISTINCT COURSE_ID)=2;

-----------------------------------------------------------------------------------------------

-- Q 10 SUBQUERIES--------------------------------------------------

-- 10.1 Find students who scored above the average marks in DBMS.

-- 10.2 Display the name of the student who scored the highest marks in any course.

-- 10.3 List students who belong to the same department as student 'S101'.

-- 10.1 Find students who scored above the average marks in DBMS.
SELECT STU_ID,
(SELECT NAME FROM STUDENT 
WHERE STUDENT.STU_ID = ENROLLMENT.STU_ID) AS NAME
 FROM ENROLLMENT
  WHERE Marks > (SELECT AVG(Marks) FROM ENROLLMENT);
	
----------------------------------------------------------------------
-- USING SUBQUERIES
SELECT Stu_ID
FROM STUDENT
WHERE Stu_ID IN (
    SELECT Stu_ID
    FROM ENROLLMENT
    WHERE Marks > (SELECT AVG(Marks) FROM ENROLLMENT)
);

-------------------------------------------------------------------------------------

-- 10.2 Display the name of the student who scored the highest marks in any course.

SELECT Name
FROM STUDENT
WHERE Stu_ID IN (
    SELECT Stu_ID
    FROM ENROLLMENT
    WHERE Marks = (SELECT MAX(Marks) FROM ENROLLMENT)
);
-----------------------------------------------------------------------

-- 10.3 List students who belong to the same department as student '101'

-- STUDENTS IN SAME DEPARTMENT
SELECT Name, Stu_ID, Dept_ID,
(SELECT DEPT_NAME
FROM DEPARTMENT
WHERE STUDENT.DEPT_ID=DEPARTMENT.DEPT_ID)  AS DEPARTMENT_NAME 
FROM STUDENT
WHERE Dept_ID IN (
    SELECT DEPT_ID
    FROM STUDENT
    WHERE STU_ID = 101
);
--------------------------------------------------------------------------------------------
-- 10.3 List students who belong to the same department as student '102'.
SELECT 
    Name, 
    Stu_ID, 
    Dept_ID,
    (SELECT DEPT_NAME 
     FROM DEPARTMENT 
     WHERE DEPARTMENT.Dept_ID = STUDENT.Dept_ID) AS DEPARTMENT_NAME
FROM STUDENT
WHERE STU_ID = 102;

-------------------------------------------------------------------------------------------

SELECT *FROM DEPARTMENT;
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
SELECT STU_ID,
(SELECT NAME
FROM STUDENT S
WHERE S.STU_ID =E.STU_ID) 
AS NAME
FROM ENROLLMENT E
WHERE E.MARKS BETWEEN  60 AND 80;

--------------------------------------------

SELECT STU_ID,MARKS,
(SELECT NAME
FROM STUDENT S
WHERE S.STU_ID =E.STU_ID) 
AS NAME
FROM ENROLLMENT E
WHERE E.MARKS BETWEEN  60 AND 80;

-----------------------------------------------------------------------------------

-- 11.2 Show details of students with Age >= 20 AND Dept = 'CSE'.
SELECT S.Stu_ID, S.Name
FROM STUDENT S
WHERE S.Age >= 20
  AND EXISTS (
      SELECT 1		-- Just Dummy usage
      FROM DEPARTMENT D
      WHERE D.Dept_ID = S.Dept_ID
        AND D.Dept_Name = 'Computer Science'
  );

-- Q 11.3 List students with marks < 40 OR Age > 22.
SELECT S.Stu_ID, S.Name
FROM STUDENT S
WHERE S.Age > 22
   OR EXISTS (
       SELECT 1
       FROM ENROLLMENT E
       WHERE E.Stu_ID = S.Stu_ID
         AND E.Marks < 40
   );

----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
SELECT *FROM DEPARTMENT;
SELECT * FROM COURSE;
SELECT * FROM STUDENT;
SELECT * FROM ENROLLMENT;