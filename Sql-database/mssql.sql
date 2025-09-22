-- Create Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name NVARCHAR(100),
    Course NVARCHAR(50)
);

-- Insert Sample Data
INSERT INTO Students VALUES (1, 'Asha', 'Azure');
INSERT INTO Students VALUES (2, 'Ravi', 'DevOps');
INSERT INTO Students VALUES (3, 'John', 'AI/ML');

-- Retrieve Data
SELECT * FROM Students;
