DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS projects_departments;
DROP TABLE IF EXISTS employees_projects;
DROP TABLE IF EXISTS cars;

CREATE TABLE IF NOT EXISTS departments
(
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS projects
(
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    code        VARCHAR UNIQUE NOT NULL,
    description VARCHAR,
    start_at    DATETIME,
    end_at      DATETIME
);

CREATE TABLE IF NOT EXISTS employees
(
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    name   VARCHAR NOT NULL,
    tax_id VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS projects_departments
(
    id             INTEGER PRIMARY KEY AUTOINCREMENT,
    departments_id INTEGER,
    project_id     INTEGER,
    FOREIGN KEY (departments_id) REFERENCES departments (id),
    FOREIGN KEY (project_id) REFERENCES projects (id)
);

CREATE TABLE IF NOT EXISTS employees_projects
(
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    hours       INTEGER,
    employee_id INTEGER,
    project_id  INTEGER,
    FOREIGN KEY (employee_id) REFERENCES employees (id),
    FOREIGN KEY (project_id) REFERENCES projects (id)
);

INSERT INTO employees(name, tax_id)
VALUES ('Javier Norena Garcia', '55225781063'),
       ('Cesar Norena Pachon', '15785359308'),
       ('Camilo Norena Pachon', '98310725108'),
       ('Liliana Pachon Garcia', '98348317309');

INSERT INTO projects(code, description, start_at, end_at)
VALUES ('ABC', 'First project', datetime(), datetime(current_timestamp, '+1 day')),
       ('DEF', 'Second project', datetime(), datetime(current_timestamp, '+1 day')),
       ('GHI', 'Third project', datetime(), datetime(current_timestamp, '+1 day'));

INSERT INTO employees_projects(hours, employee_id, project_id)
VALUES (24, 1, 3),
       (24, 4, 1),
       (8, 2, 1),
       (2, 1, 2),
       (48, 2, 3);

SELECT *
FROM employees;

SELECT *
FROM projects;

SELECT *
FROM employees_projects;

SELECT *
FROM employees
WHERE name LIKE '%norena%';

SELECT COUNT()
from projects;

SELECT project_id, SUM(hours)
FROM employees_projects
GROUP BY project_id;
