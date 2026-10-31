CREATE DATABASE city_care_hospital;
USE city_care_hospital;
SELECT DATABASE();

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1),
    date_of_birth DATE NOT NULL,
    blood_group VARCHAR(3),
    city VARCHAR(50),
    phone VARCHAR(15),
    CHECK (gender IN ('M', 'F', 'O')
    ));
    
    DESCRIBE patients;
    
    CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    experience_years INT,
    consultation_fee DECIMAL(8,2),
    CHECK (consultation_fee > 0)
);

DESCRIBE doctors;

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    status VARCHAR(20),
    diagnosis VARCHAR(100),

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);

DESCRIBE appointments;

CREATE TABLE bills (
    bill_id INT PRIMARY KEY,
    appointment_id INT UNIQUE,
    total_amount DECIMAL(10,2),
    payment_mode VARCHAR(20),
    payment_status VARCHAR(10),

    FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id),

    CHECK (total_amount >= 0)
);

DESCRIBE bills;

SHOW TABLES;

#Data insert into patient table
INSERT INTO patients
(patient_id, first_name, last_name, gender, date_of_birth,
 blood_group, city, phone)
VALUES
(1, 'Aarav', 'Sharma', 'M', '1958-04-12', 'B+', 'Jaipur', '9800000001'),
(2, 'Ishita', 'Meena', 'F', '2015-09-30', 'O-', 'Ajmer', '9800000002'),
(3, 'Rahul', 'Verma', 'M', '1995-06-15', 'A+', 'Jaipur', '9800000003'),
(4, 'Priya', 'Gupta', 'F', '1988-03-22', 'AB+', 'Kota', '9800000004'),
(5, 'Aman', 'Singh', 'M', '2000-11-10', 'O+', 'Jaipur', '9800000005'),
(6, 'Sneha', 'Jain', 'F', '1960-07-18', 'A-', 'Jodhpur', '9800000006'),
(7, 'Karan', 'Mehta', 'M', '2018-02-05', 'AB-', 'Jaipur', '9800000007'),
(8, 'Pooja', 'Yadav', 'F', '1992-12-25', 'B-', 'Ajmer', '9800000008'),
(9, 'Rohan', 'Joshi', 'M', '1975-08-09', 'O+', 'Jaipur', '9800000009'),
(10, 'Neha', 'Agarwal', 'F', '1985-05-14', 'B+', 'Kota', '9800000010'),
(11, 'Vikas', 'Choudhary', 'M', '1962-10-20', 'A+', 'Jaipur', '9800000011'),
(12, 'Ananya', 'Soni', 'F', '2005-01-30', 'O-', 'Udaipur', '9800000012');

SELECT * FROM patients;

#Data insert into doctors table
INSERT INTO doctors
(doctor_id, doctor_name, specialization, experience_years, consultation_fee)
VALUES
(101, 'Dr. Neha Gupta', 'Cardiology', 15, 1200.00),
(102, 'Dr. Rakesh Singh', 'Paediatrics', 6, 500.00),
(103, 'Dr. Amit Sharma', 'Orthopaedics', 12, 1000.00),
(104, 'Dr. Priya Jain', 'General Medicine', 5, 400.00),
(105, 'Dr. Suresh Mehta', 'Dermatology', 20, 1500.00),
(106, 'Dr. Kavita Rao', 'Cardiology', 2, 800.00);

SELECT * FROM doctors;

#Data insert into appointments table
INSERT INTO appointments
(appointment_id, patient_id, doctor_id, appointment_date, status, diagnosis)
VALUES
(1001, 1, 101, '2025-08-14', 'Completed', 'Hypertension'),
(1002, 2, 102, '2026-01-20', 'Scheduled', NULL),
(1003, 3, 103, '2025-09-10', 'Completed', 'Fracture'),
(1004, 4, 104, '2025-10-05', 'Cancelled', NULL),
(1005, 5, 101, '2026-02-12', 'Completed', 'Viral Fever'),
(1006, 6, 105, '2025-11-18', 'Completed', 'Skin Allergy'),
(1007, 7, 102, '2026-03-15', 'No-show', NULL),
(1008, 8, 103, '2026-04-10', 'Completed', 'Knee Pain'),
(1009, 1, 104, '2026-05-12', 'Completed', 'Diabetes'),
(1010, 3, 105, '2025-12-01', 'Scheduled', NULL),
(1011, 5, 103, '2026-06-08', 'Completed', 'Back Pain'),
(1012, 9, 101, '2025-07-22', 'Completed', 'Hypertension'),
(1013, 10, 102, '2026-07-11', 'Cancelled', NULL),
(1014, 11, 104, '2025-08-30', 'Completed', 'Fever'),
(1015, 12, 105, '2026-08-19', 'Completed', 'Dermatitis'),
(1016, 2, 101, '2025-09-25', 'Completed', 'Anaemia'),
(1017, 4, 103, '2026-09-05', 'No-show', NULL),
(1018, 6, 102, '2025-10-15', 'Completed', 'Migraine'),
(1019, 8, 104, '2026-09-20', 'Scheduled', NULL),
(1020, 9, 105, '2025-11-25', 'Completed', 'Skin Infection');

SELECT * FROM appointments;

# Data insert into billing table
INSERT INTO bills
(bill_id, appointment_id, total_amount, payment_mode, payment_status)
VALUES
(5001, 1001, 2450.00, 'Insurance', 'Pending'),
(5002, 1003, 3500.00, 'UPI', 'Paid'),
(5003, 1005, 1800.00, 'Cash', 'Paid'),
(5004, 1006, 2200.00, 'Card', 'Pending'),
(5005, 1008, 2800.00, 'UPI', 'Paid'),
(5006, 1009, 1900.00, 'Insurance', 'Pending'),
(5007, 1011, 3200.00, 'Card', 'Paid'),
(5008, 1012, 2600.00, 'Cash', 'Paid'),
(5009, 1014, 1500.00, 'UPI', 'Pending'),
(5010, 1015, 2400.00, 'Insurance', 'Paid'),
(5011, 1016, 1700.00, 'Card', 'Paid'),
(5012, 1018, 2100.00, 'Cash', 'Pending');

SELECT * FROM bills;

#Part B — SQL 13 Queries
# SELECT and WHERE
#Sabhi patients ka first name, last name, gender aur blood group
SELECT first_name, last_name, gender, blood_group
FROM patients;

#Jaipur mein rehne wale patients
SELECT *
FROM patients
WHERE city = 'Jaipur';

#Doctors jinki consultation fee ₹800 se zyada aur experience 10 years se kam nahi hai
SELECT *
FROM doctors
WHERE consultation_fee > 800
AND experience_years >= 10;

#O- ya AB- blood group wale patients
SELECT *
FROM patients
WHERE blood_group IN ('O-', 'AB-');

#Doctors ko highest consultation fee se lowest tak arrange
SELECT *
FROM doctors
ORDER BY consultation_fee DESC;

#Patients ko city ke alphabetical order mein aur har city ke andar oldest se youngest tak arrange
SELECT *
FROM patients
ORDER BY city ASC, date_of_birth ASC;

#GROUP BY and HAVING
#Har blood group mein kitne patients hain?
SELECT blood_group, COUNT(*) AS total_patients
FROM patients
GROUP BY blood_group;

#Har appointment status ke kitne records hain?
SELECT status, COUNT(*) AS total_appointments
FROM appointments
GROUP BY status;

#Un doctors ki IDs aur appointment counts, jinhone 2 se zyada appointments handle ki hain
SELECT doctor_id, COUNT(*) AS total_appointments
FROM appointments
GROUP BY doctor_id
HAVING COUNT(*) > 2;

#Appointment date, patient ka full name, doctor ka name aur specialization
SELECT
    a.appointment_date,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    d.doctor_name,
    d.specialization
FROM appointments a
INNER JOIN patients p
    ON a.patient_id = p.patient_id
INNER JOIN doctors d
    ON a.doctor_id = d.doctor_id;
    
#Sabhi patients aur unki appointment dates, including those who never booked appointments
SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    a.appointment_date
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id;
    
    #Jin patients ki appointment nahi hogi, unke liye appointment_date mein NULL show hoga.

#Jin patient ki appointment nahi hogi unke liye appointment date me null show hoga
#Sirf aise patients identify karne ke liye:
SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name
FROM patients p
LEFT JOIN appointments a
    ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;
    
    
#Pending bills wale patients, diagnosis aur bill amount
SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    a.diagnosis,
    b.total_amount,
    b.payment_status
FROM patients p
INNER JOIN appointments a
    ON p.patient_id = a.patient_id
INNER JOIN bills b
    ON a.appointment_id = b.appointment_id
WHERE b.payment_status = 'Pending';

#Har specialization se total billed revenue
SELECT
    d.specialization,
    SUM(b.total_amount) AS total_revenue
FROM doctors d
INNER JOIN appointments a
    ON d.doctor_id = a.doctor_id
INNER JOIN bills b
    ON a.appointment_id = b.appointment_id
GROUP BY d.specialization
ORDER BY total_revenue DESC;

#Har table ka output verify karo
SELECT * FROM patients;

SELECT * FROM doctors;

SELECT * FROM appointments;

SELECT * FROM bills;