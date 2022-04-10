DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS projects_departments;
DROP TABLE IF EXISTS employees_projects;

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

SELECT *
FROM employees;

SELECT *
FROM employees
WHERE name LIKE '%norena%';
