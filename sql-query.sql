CREATE TABLE Faculties(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    CONSTRAINT chk_faculties_name CHECK(LEN(Name) > 0)
);

CREATE TABLE Departments(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Financing MONEY NOT NULL DEFAULT 0.0,
    CONSTRAINT chk_departments_financing CHECK(Financing >= 0),
    CONSTRAINT chk_departments_name CHECK(LEN(Name) > 0)
);

CREATE TABLE [Groups](
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL UNIQUE,
    Rating INT NOT NULL,
    Year INT NOT NULL,
    CONSTRAINT chk_name CHECK(LEN(Name) > 0),
    CONSTRAINT chk_rating CHECK(Rating BETWEEN 0 AND 5),
    CONSTRAINT chk_year CHECK(Year BETWEEN 1 AND 5)
);

CREATE TABLE Teachers(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    EmploymentDate DATE NOT NULL,
    Name NVARCHAR(MAX) NOT NULL,
    Premium MONEY NOT NULL DEFAULT 0.0,
    Salary MONEY NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    CONSTRAINT chk_employment_date CHECK(
        EmploymentDate > '1990-01-01'
        AND EmploymentDate <= CAST(GETDATE() AS DATE)
    ),
    CONSTRAINT chk_teachers_name CHECK(LEN(Name) > 0),
    CONSTRAINT chk_teacher_premium CHECK(Premium >= 0),
    CONSTRAINT chk_teacher_salary CHECK(Salary > 0),
    CONSTRAINT chk_teachers_surname CHECK(LEN(Surname) > 0)
);

INSERT INTO Faculties (Name) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('History');

INSERT INTO Departments (Name, Financing) VALUES
('IT Department', 50000),
('Math Department', 30000),
('Physics Department', 40000),
('History Department', 20000);

INSERT INTO [Groups] (Name, Rating, Year) VALUES
('CS-101', 5, 1),
('CS-102', 4, 2),
('MATH-201', 3, 2),
('PHYS-101', 4, 1),
('HIST-101', 5, 1);

INSERT INTO Teachers (EmploymentDate, Name, Surname, Salary, Premium) VALUES
('2010-09-01', 'Ivan', 'Ivanov', 1000, 100),
('2015-01-15', 'Olena', 'Petrenko', 1200, 150),
('2020-02-20', 'Mykola', 'Shevchenko', 900, 50),
('2005-08-10', 'Anna', 'Koval', 1500, 200);
