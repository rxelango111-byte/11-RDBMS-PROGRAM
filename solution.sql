create database elango;
use elango;
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Physics');


-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    DepartmentID INT
);

INSERT INTO Student (StudentID, StudentName, DepartmentID)
VALUES
(1001, 'Arun', 101),
(1002, 'Divya', 102),
(1003, 'Karthik', 101);


-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(30)
);

INSERT INTO Course (CourseID, CourseName)
VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');


-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT
);

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES
(1, 1001, 201),
(2, 1002, 203),
(3, 1003, 202);


-- Create View
CREATE VIEW Student_Details AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
INNER JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
INNER JOIN Course
    ON Enrollment.CourseID = Course.CourseID
INNER JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;


-- Display the View
SELECT * FROM Student_Details;
