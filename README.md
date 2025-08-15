
# SQL Developer Internship – Task 6

This repository contains **Task 6** of my SQL Developer Internship project, focused on **Subqueries and Nested Queries**.  
It includes:
- Two sample tables: `students` and `fees`
- 15 records inserted into each table
- 10 unique queries demonstrating **scalar**, **correlated**, and **multi-row subqueries**
- Step-by-step explanations for each query

---

## 📂 Table Structure

### `students`
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(10),
    marks INT,
    city VARCHAR(50)
);

```

### `fees`

```sql
CREATE TABLE fees (
    fee_id INT PRIMARY KEY,
    student_id INT,
    total_fee INT,
    fee_paid INT,
    due_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```

---

## 🛠 How to Run

1. Create the tables using the provided SQL script.
2. Insert sample data (15 records each).
3. Run the queries in your SQL environment (MySQL, SQL Developer, or similar).
4. Check the results.

---

## 📜 Example Queries

### 1️⃣ Students who paid the full fee

```sql
SELECT student_name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM fees
    WHERE total_fee = fee_paid
);
```

**Result:**
![Example 1 Result](https://github.com/user-attachments/assets/52f22c80-9242-4eae-bd6e-fbaf0e382270 )

---

### 2️⃣ Students with marks above their department average

```sql
SELECT s.student_name, s.department, s.marks
FROM students s
WHERE s.marks > (
    SELECT AVG(marks)
    FROM students
    WHERE department = s.department
);
```

**Result:**
![Example 2 Result](https://github.com/user-attachments/assets/9b44f0a7-b64a-42ee-b6cd-2111339c4121)

---

### 3️⃣ Students from the same city as 'Priya'

```sql
SELECT student_name
FROM students
WHERE city = (
    SELECT city
    FROM students
    WHERE student_name = 'Priya'
)
AND student_name <> 'Priya';
```

**Result:**
![Example 3 Result](https://github.com/user-attachments/assets/d2912835-dd77-4bef-b911-63214fe9f7e4)

---

## 📂 Repository Structure

```
📦 sql-task-6
 ┣  📂 Subquery SQL
    ┣ Task6.sql
 ┣ 📂 Screenshots
 ┃ ┣ Ex1.jpg
 ┃ ┣ Ex2.jpg
 ┃ ┗ Ex3.jpg
 ┗ 📜 README.md
```

---

## 📌 Key Concepts Covered

* Scalar subqueries
* Correlated subqueries
* Multi-row subqueries (`IN`, `ANY`, `ALL`)
* Subqueries in `WHERE` and `SELECT` clauses
* Derived tables (subquery in `FROM` clause)

---

## 🏆 Outcome

This task demonstrates practical use of subqueries in SQL for filtering, comparison, and data extraction in real-world scenarios.

```
```
