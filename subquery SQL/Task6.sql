use data;

DROP TABLE Students;

CREATE TABLE Students(
	student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    marks INT NOT NULL,
    city VARCHAR(100) NOT NULL
);

DESC Students;

CREATE TABLE Fees(
fee_id INT PRIMARY KEY,
student_id INT,
total_fee INT NOT NULL,
fee_paid INT NOT NULL,
due_date DATE,
FOREIGN KEY (student_id) REFERENCES Students (student_id)
);

DESC Fees;

INSERT INTO students VALUES
(1, 'Anil', 'CS', 88, 'Delhi'),
(2, 'Priya', 'CS', 92, 'Mumbai'),
(3, 'Rohan', 'EE', 79, 'Delhi'),
(4, 'Kavita', 'ME', 85, 'Chennai'),
(5, 'Arjun', 'EE', 90, 'Kolkata'),
(6, 'Meena', 'CS', 76, 'Pune'),
(7, 'Vikram', 'ME', 81, 'Delhi'),
(8, 'Sneha', 'EE', 95, 'Mumbai'),
(9, 'Raj', 'CS', 70, 'Kolkata'),
(10, 'Amit', 'ME', 84, 'Chennai'),
(11, 'Divya', 'EE', 89, 'Delhi'),
(12, 'Suresh', 'CS', 91, 'Pune'),
(13, 'Neha', 'ME', 77, 'Kolkata'),
(14, 'Manoj', 'CS', 80, 'Mumbai'),
(15, 'Pooja', 'EE', 87, 'Chennai');

SELECT * FROM students;

INSERT INTO fees VALUES
(1, 1, 50000, 50000, '2025-01-15'),
(2, 2, 50000, 45000, '2025-02-01'),
(3, 3, 55000, 55000, '2025-01-20'),
(4, 4, 60000, 50000, '2025-01-25'),
(5, 5, 55000, 55000, '2025-02-05'),
(6, 6, 50000, 40000, '2025-01-18'),
(7, 7, 60000, 60000, '2025-02-10'),
(8, 8, 55000, 50000, '2025-01-22'),
(9, 9, 50000, 50000, '2025-02-12'),
(10, 10, 60000, 58000, '2025-01-30'),
(11, 11, 55000, 55000, '2025-01-28'),
(12, 12, 50000, 45000, '2025-02-03'),
(13, 13, 60000, 60000, '2025-01-27'),
(14, 14, 50000, 48000, '2025-02-08'),
(15, 15, 55000, 55000, '2025-02-06');

SELECT * FROM Fees;

SELECT student_name,department
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM fees
    WHERE total_fee = fee_paid
);

SELECT student_name, student_id
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM fees
    WHERE fee_paid < (SELECT AVG(fee_paid) FROM fees)
);

SELECT student_name, student_id
FROM students
WHERE city = (
    SELECT city
    FROM students
    WHERE student_name = 'Priya'
)
AND student_name != 'Priya';

SELECT s.student_name, s.department,
       (SELECT total_fee FROM fees f WHERE f.student_id = s.student_id) AS total_fee
FROM students s;

SELECT DISTINCT department
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM fees f
    WHERE f.student_id = s.student_id
    AND f.total_fee > f.fee_paid
);

SELECT s.student_name, s.department, s.marks
FROM students s
WHERE s.marks > (
    SELECT AVG(marks)
    FROM students
    WHERE department = s.department
);

SELECT student_name, student_id
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM fees
    WHERE due_date > (SELECT MIN(due_date) FROM fees)
);

SELECT student_name, marks
FROM students
WHERE marks IN (
    SELECT marks
    FROM students
    ORDER BY marks DESC
    LIMIT 2
);

SELECT student_name, department
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM fees
    WHERE total_fee = (SELECT MAX(total_fee) FROM fees)
);

SELECT student_name, marks
FROM students
WHERE marks > ANY (
    SELECT marks
    FROM students
    WHERE department = 'ME'
);





