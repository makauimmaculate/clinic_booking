# 🏥 Clinic Booking System

## 📄 Project Description

This project implements a relational database schema for managing a clinic's appointment system. It facilitates:

* **Patient Management**: Storing patient details including contact information and medical history.
* **Doctor Management**: Managing doctor information, including specialization, department, and availability.
* **Appointment Scheduling**: Booking, tracking, and cancelling patient appointments with doctors.
* **Service Management**: Cataloging various services offered by the clinic and associating them with appointments.
* **Department Oversight**: Organizing doctors and services under specific departments (e.g., Cardiology, Pediatrics).

The database is normalized to minimize redundancy and ensure data integrity. Foreign keys are used extensively to maintain relationships among tables.

## ⚙️ Setup Instructions

1. **Database Installation**:

   * Install MySQL or any SQL-compliant database engine.

2. **Schema Creation**:

   * Open your SQL terminal or GUI (like phpMyAdmin, MySQL Workbench).
   * Execute the `clinic_booking_system.sql` file to create all tables and relationships.

3. **Testing (Optional)**:

   * Insert test records using `INSERT` statements to validate the schema.

4. **Query Execution**:

   * Perform SELECT, JOIN, and AGGREGATE queries to analyze appointment schedules, doctor loads, and patient visit history.

## 🧾 Sample Queries

```sql
-- List all appointments for a specific patient
SELECT a.date, a.time, d.name AS doctor, s.name AS service
FROM appointments a
JOIN doctors d ON a.doctor_id = d.id
JOIN services s ON a.service_id = s.id
WHERE a.patient_id = 101;

-- Count appointments per doctor
SELECT d.name, COUNT(a.id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a ON d.id = a.doctor_id
GROUP BY d.name;
```

## 🖼️ Entity-Relationship Diagram (ERD)

![ER Diagram](/clinic_booking_system.jpg)


## 📂 Files Included

* `clinic_booking_system.sql` — SQL script with all table definitions and foreign key constraints.
* `README.md` — Setup guide and documentation.
* `/clinic_booking_system.jpg` — Visual representation of the database schema.
* `sample_data.sql` — Optional test data script .


## 🧠 Author

* Makau Immaculate

