-- Creating tables
CREATE TABLE departments (
  department_id NUMBER PRIMARY KEY,
  department_name VARCHAR2(100) NOT NULL
);

CREATE TABLE employees (
  employee_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50) NOT NULL,
  last_name VARCHAR2(50) NOT NULL,
  department_id NUMBER,
  hire_date DATE,
  salary NUMBER(8, 2),
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Inserting data
INSERT INTO departments (department_id, department_name)
VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

-- Update, Delete examples
UPDATE employees SET salary = 55000 WHERE employee_id = 101;
DELETE FROM employees WHERE employee_id = 103;

-- Joins
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
