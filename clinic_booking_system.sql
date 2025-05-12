-- Create Database
CREATE DATABASE  clinic_booking;
USE clinic_booking;

-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    contact_number VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- Create Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    contact_number VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Create Services Table
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL UNIQUE,
    service_cost DECIMAL(10, 2) NOT NULL
);

-- Create Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Create Appointment_Services Table (Many-to-Many)
CREATE TABLE Appointment_Services (
    appointment_id INT,
    service_id INT,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

-- Sample Data

-- Departments
INSERT INTO Departments (department_name) VALUES 
('Cardiology'), ('Neurology'), ('Pediatrics');

-- Patients
INSERT INTO Patients (first_name, last_name, dob, gender, contact_number, email) VALUES 
('John', 'Doe', '1990-05-20', 'Male', '0712345678', 'john.doe@example.com'),
('Jane', 'Smith', '1985-08-15', 'Female', '0723456789', 'jane.smith@example.com');

-- Doctors
INSERT INTO Doctors (first_name, last_name, specialization, contact_number, email, department_id) VALUES 
('Emily', 'Clark', 'Cardiologist', '0734567890', 'emily.clark@example.com', 1),
('Mark', 'Brown', 'Neurologist', '0745678901', 'mark.brown@example.com', 2);

-- Services
INSERT INTO Services (service_name, service_cost) VALUES 
('General Consultation', 50.00),
('Blood Test', 30.00),
('MRI Scan', 200.00);

-- Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES 
(1, 1, '2025-04-28', '10:00:00', 'Scheduled'),
(2, 2, '2025-04-29', '11:00:00', 'Scheduled');

-- Appointment_Services
INSERT INTO Appointment_Services (appointment_id, service_id) VALUES 
(1, 1),
(1, 2),
(2, 3);

```mermaid
erDiagram
    Patients {
        INT patient_id PK
        VARCHAR first_name
        VARCHAR last_name
        DATE dob
        ENUM gender
        VARCHAR contact_number UNIQUE
        VARCHAR email UNIQUE
    }

    Departments {
        INT department_id PK
        VARCHAR department_name UNIQUE
    }

    Doctors {
        INT doctor_id PK
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR specialization
        VARCHAR contact_number UNIQUE
        VARCHAR email UNIQUE
        INT department_id FK
    }

    Services {
        INT service_id PK
        VARCHAR service_name UNIQUE
        DECIMAL service_cost
    }

    Appointments {
        INT appointment_id PK
        INT patient_id FK
        INT doctor_id FK
        DATE appointment_date
        TIME appointment_time
        ENUM status
    }

    Appointment_Services {
        INT appointment_id FK
        INT service_id FK
        PK (appointment_id, service_id)
    }

    Patients ||--o{ Appointments : "has"
    Doctors ||--o{ Appointments : "handles"
    Departments ||--o{ Doctors : "employs"
    Appointments ||--o{ Appointment_Services : "includes"
    Services ||--o{ Appointment_Services : "offered in"
```
