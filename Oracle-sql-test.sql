

SQL> create table Students(StudentID NUMBER PRIMARY KEY, StudentName VARCHAR(20) NOT NULL, Email VARCHAR(50) UNIQUE NOT NULL);

Table created.

SQL> create table Instructors(InstructorID NUMBER PRIMARY KEY, InstructorName VARCHAR(20) NOT NULL,Email VARCHAR(50) UNIQUE NOT NULL);

Table created.

SQL> create table Courses(CourseID NUMBER PRIMARY KEY,CourseName VARCHAR(20) NOT NULL);

Table created.

SQL> create table Enrollments(EnrollmentID NUMBER PRIMARY KEY,StudentID NUMBER REFERENCES Students(StudentID), CourseID NUMBER REFERENCES Courses(CourseID));

Table created.

SQL> create table InstructorCourses(ID NUMBER PRIMARY KEY, InstructorID NUMBER REFERENCES Instructors(InstructorID),CourseID NUMBER REFERENCES Courses(CourseID));

Table created.


SQL> insert into Students VALUES(1,'Berenice uwimpuhwe','berenice@Asome.com');

1 row created.

SQL> insert into Students VALUES(2,'Keza Sandrine','Kezas@Auca.com');

1 row created.

SQL> insert into Courses VALUES(1,'Database Systems');

1 row created.

SQL> insert into Courses VALUES(2,'PL/SQL');

1 row created.

SQL> insert into Instructors VALUES(1,'Dr. Charles','charles23@gmail.com');

1 row created.

SQL> insert into Instructors VALUES(2,'Dr. Pennycoock','Pennycoock1003@gmail.com');

1 row created.

SQL> insert into Instructors VALUES(3,'Pr. Jerome','Jerom23@Auca.rw');

1 row created.

SQL> insert into Enrollments VALUES(1,1,1);

1 row created.

SQL> insert into Enrollments VALUES(2,2,2);

1 row created.

SQL> insert into InstructorCourses VALUES(1,1,1);

1 row created.

SQL> insert into InstructorCourses VALUES(2,2,2);

1 row created.

SQL> UPDATE Students SET Email='Berenice345@gmail.com' WHERE StudentID = 1;

1 row updated.

SQL> DELETE FROM Enrollments WHERE CourseID = 1;

1 row deleted.

SQL> DELETE FROM InstructorCourses WHERE CourseID = 1;

1 row deleted.

SQL> DELETE FROM Courses WHERE CourseID = 1;

1 row deleted. 

SQL> SELECT s.StudentName, c.CourseName FROM Students s JOIN Enrollments e ON s.StudentID = e.StudentID JOIN Courses c ON e.CourseID = c.CourseID;

STUDENTNAME          COURSENAME
-------------------- --------------------
Keza Sandrine        PL/SQL

SQL> SELECT StudentName FROM Students WHERE StudentID IN (SELECT StudentID FROM Enrollments WHERE CourseID = 1);

no rows selected

SQL> SELECT StudentName FROM Students WHERE StudentID IN (SELECT StudentID FROM Enrollments WHERE CourseID = 2);

STUDENTNAME
--------------------
Keza Sandrine

SQL> COMMIT;

Commit complete.
