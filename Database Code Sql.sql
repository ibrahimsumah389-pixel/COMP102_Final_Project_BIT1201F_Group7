CREATE DATABASE Public_Health_Clinic_System;

CREATE TABLE Patient (
    Patient_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(25) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(25) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);

CREATE TABLE Health_Worker (

    Health_Worker_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(25) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Phone VARCHAR(15),
    Age INT NOT NULL

);

CREATE TABLE Appointment (

    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,

    Patient_ID INT NOT NULL,

    Worker_ID INT NOT NULL,

    Date DATE NOT NULL,

    Time TIME NOT NULL,


    FOREIGN KEY(Patient_ID)
    REFERENCES Patient(Patient_ID),


    FOREIGN KEY(Worker_ID)
    REFERENCES Health_Worker(Health_Worker_ID)

);

CREATE TABLE Treatment (

    Treatment_ID INT AUTO_INCREMENT PRIMARY KEY,

    Appointment_ID INT NOT NULL,

    Diagnosis VARCHAR(90) NOT NULL,

    Treatment_Given VARCHAR(85) NOT NULL,


    FOREIGN KEY(Appointment_ID)
    REFERENCES Appointment(Appointment_ID)

);

CREATE TABLE Transaction_Table (

    Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,

    Treatment_ID INT NOT NULL,

    Amount INT NOT NULL DEFAULT 0,

    Payment_Date DATE NOT NULL,

    Status VARCHAR(30) DEFAULT 'Pending',


    FOREIGN KEY(Treatment_ID)
    REFERENCES Treatment(Treatment_ID)

);

CREATE TABLE Salary (

    Salary_ID INT AUTO_INCREMENT PRIMARY KEY,

    Worker_ID INT NOT NULL,

    Amount INT NOT NULL,

    Payment_Month DATETIME DEFAULT CURRENT_TIMESTAMP,

    Status VARCHAR(30) DEFAULT 'Paid',


    FOREIGN KEY(Worker_ID)
    REFERENCES Health_Worker(Health_Worker_ID)

);


INSERT INTO Patient
(Name,Age,Gender,Phone)
VALUES

('John Kamara',30,'Male','076000111'),

('Mary Conteh',25,'Female','076000222'),

('David Bangura',40,'Male','076000333'),

('Fatmata Koroma',28,'Female','076000444'),

('Ibrahim Jalloh',35,'Male','076000555'),

('Sorie Sesay',45,'Male','076000666'),

('Hawa Turay',22,'Female','076000777'),

('Musa Kallon',50,'Male','076000888'),

('Mariama Fofana',32,'Female','076000999'),

('Alieu Sheriff',38,'Male','076001000');



INSERT INTO Health_Worker
(Name,Role,Phone,Age)
VALUES

('Dr Smith','Doctor','077111111',45),

('Dr Johnson','Doctor','077222222',50),

('Sarah Cole','Nurse','077333333',30),

('Emma James','Nurse','077444444',28),

('David White','Pharmacist','077555555',40),

('Paul Green','Lab Technician','077666666',35),

('Linda Brown','Doctor','077777777',38),

('Mark Lee','Nurse','077888888',29),

('Anna Cole','Receptionist','077999999',26),

('Peter King','Doctor','077000000',48);


INSERT INTO Appointment
(Patient_ID,Worker_ID,Date,Time)
VALUES

(1,1,'2026-01-10','09:00:00'),

(2,3,'2026-01-11','10:00:00'),

(3,2,'2026-01-12','11:00:00'),

(4,4,'2026-01-13','12:00:00'),

(5,1,'2026-01-14','13:00:00'),

(6,5,'2026-01-15','14:00:00'),

(7,6,'2026-01-16','15:00:00'),

(8,7,'2026-01-17','16:00:00'),

(9,8,'2026-01-18','17:00:00'),

(10,10,'2026-01-19','18:00:00');


INSERT INTO Treatment
(Appointment_ID,Diagnosis,Treatment_Given)
VALUES

(1,'Malaria','Medication'),

(2,'Fever','Injection'),

(3,'Cold','Tablets'),

(4,'Flu','Syrup'),

(5,'Infection','Antibiotics'),

(6,'Headache','Pain Killers'),

(7,'Blood Pressure','Monitoring'),

(8,'Diabetes','Insulin'),

(9,'Cough','Syrup'),

(10,'Asthma','Inhaler');


INSERT INTO Salary
(Worker_ID,Amount)
VALUES

(1,5000),
(2,5200),
(3,2500),
(4,2400),
(5,3000),
(6,2800),
(7,4500),
(8,2300),
(9,2000),
(10,6000);

UPDATE Patient

SET Phone='079999999'

WHERE Patient_ID=1;

UPDATE Transaction_Table

SET Status='Paid'

WHERE Transaction_ID=3;


