## Grupo 6

Alejandro Rodriguez Blazquez

Alejandro Exposito

Liam Rodriguez Vicente

# Sistema-de-informacion

El hospital atiende a una variedad de pacientes que requieren diferentes servicios médicos. Cada paciente tiene un expediente clínico que contiene su información personal y médica. Los pacientes pueden tener múltiples consultas con diferentes doctores en el hospital, y pueden ser admitidos en el hospital para hospitalización. Información registrada del paciente: Nombre completo, fecha de nacimiento, dirección, teléfono de contacto y correo electrónico. También se incluye información médica como su historial clínico y tratamientos previos.

El hospital cuenta con varios doctores especializados en diferentes áreas de la medicina. Cada doctor tiene una especialidad, puede atender consultas, realizar tratamientos y supervisar hospitalizaciones. Los doctores tienen un horario de atención y pueden estar asignados a distintas áreas o departamentos del hospital. Información registrada del doctor: Nombre, especialidad, teléfono, correo electrónico, y área en la que trabaja (ej. cardiología, pediatría, etc.).

Los pacientes programan citas para ser atendidos por los doctores. Cada cita está asignada a un paciente y un doctor, y tiene una fecha, hora y motivo (como una consulta de seguimiento, chequeo general, entre otros). Las citas son esenciales para gestionar la carga de trabajo de los doctores y organizar la atención a los pacientes. Información registrada de la cita: Fecha, hora, motivo de la cita, y la referencia del paciente y doctor involucrado.

A los pacientes se les prescriben tratamientos según su diagnóstico. Cada tratamiento puede incluir instrucciones, prescripciones de medicamentos, y fechas de inicio y fin. Un tratamiento puede involucrar uno o más medicamentos, y el doctor es responsable de supervisar y ajustar el tratamiento según sea necesario. Información registrada del tratamiento: Nombre del tratamiento, descripción, doctor responsable, paciente tratado, fechas de inicio y fin, y medicamentos asociados.

El hospital mantiene un inventario de medicamentos que se utilizan para los tratamientos de los pacientes. Cada medicamento tiene un nombre, una descripción y un precio, ya que algunos medicamentos son facturados al paciente. Un tratamiento puede incluir múltiples medicamentos, y un medicamento puede ser parte de varios tratamientos. Información registrada del medicamento: Nombre, descripción, precio, y stock (si es necesario controlarlo en inventario).

Algunos pacientes requieren hospitalización. Una hospitalización ocurre cuando un paciente es admitido para recibir atención médica continua, bajo la supervisión de uno o varios doctores. Cada hospitalización tiene una fecha de ingreso, una fecha de alta, y el paciente puede recibir tratamientos durante su estancia. Información registrada de la hospitalización: Fecha de ingreso, fecha de alta, paciente involucrado y doctor responsable.

# Modelo Entidad-Relación:

![image](https://github.com/user-attachments/assets/ad45ac8f-0456-42a2-bbc5-04427f0899e3)


# Modelo Relacional:

![image](https://github.com/user-attachments/assets/503e1264-3736-47ce-b432-8bfc074cc8e5)

DOCTOR (dni, nombre, especialidad, telefono, email)

PK: (dni)

PACIENTE (sip, nombre, fnac, telefono, dni, dni_doctor*)

PK: (sip)

FK: (dni_doctor) → DOCTOR

ASEGURADO (sip*, aseguradora)

PK: (sip)

FK: (sip) → PACIENTE

NO_ASEGURADO (sip*)

PK: (sip)

FK: (sip) → PACIENTE

CITA (id, fecha_cita, hora_cita, motivo_cita, dni*, sip*)

PK: (id)

FK: (dni) → DOCTOR

FK: (sip) → PACIENTE

TRATAMIENTO (id, fecha_inicio, fecha_final, efectos_secundarios, dni_supervisor*, sip*)

PK: (id)

FK: (dni_supervisor) → DOCTOR

FK: (sip) → PACIENTE

HOSPITALIZACION (id, fecha_ingreso, fecha_alta, area, dni_doctor*, sip*)

PK: (id)

FK: (dni_doctor) → DOCTOR

FK: (sip) → PACIENTE

MEDICAMENTO (id, nombre, dosis, frecuencia, observaciones, dni_doctor*, sip*)

PK: (id)

FK: (dni_doctor) → DOCTOR

FK: (sip) → PACIENTE

## Modelo Fisico-DDL

CREATE TABLE DOCTOR (

    dni VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(50),
    especialidad VARCHAR(30),
    telefono INT(9),
    email VARCHAR(41)
);

CREATE TABLE PACIENTE (

    sip INT(9) PRIMARY KEY,
    nombre VARCHAR(50),
    fnac DATE,
    telefono INT(9),
    dni VARCHAR(9),    
    dni_doctor VARCHAR(9),
    FOREIGN KEY (dni_doctor) REFERENCES DOCTOR(dni)
);

CREATE TABLE ASEGURADO (

    sip INT(9) PRIMARY KEY,
    aseguradora VARCHAR(100) NOT NULL,
    FOREIGN KEY (sip) REFERENCES PACIENTE(sip)
);

CREATE TABLE NO_ASEGURADO (

    sip INT(9) PRIMARY KEY,
    FOREIGN KEY (sip) REFERENCES PACIENTE(sip)
);

CREATE TABLE CITA (

    id INT AUTO_INCREMENT PRIMARY KEY ,
    fecha_cita DATE,
    hora_cita TIME,
    motivo_cita VARCHAR(255),
    dni_doctor VARCHAR(9),
    sip_paciente INT(9),
    FOREIGN KEY (dni_doctor) REFERENCES DOCTOR(dni),
    FOREIGN KEY (sip_paciente) REFERENCES PACIENTE(sip)
);

CREATE TABLE TRATAMIENTO (

    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_inicio DATE,
    fecha_final DATE,
    efectos_secundarios TEXT,
    dni_supervisor VARCHAR(9),
    sip_paciente INT(9),
    FOREIGN KEY (dni_supervisor) REFERENCES DOCTOR(dni),
    FOREIGN KEY (sip_paciente) REFERENCES PACIENTE(sip)
);

CREATE TABLE HOSPITALIZACION (

    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_ingreso DATE,
    fecha_alta DATE,
    area VARCHAR(100),
    dni_doctor VARCHAR(9),
    sip_paciente INT (9),
    FOREIGN KEY (dni_doctor) REFERENCES DOCTOR(dni),
    FOREIGN KEY (sip_paciente) REFERENCES PACIENTE(sip)
);

CREATE TABLE MEDICAMENTO (

    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    dosis VARCHAR(50),
    frecuencia VARCHAR(50),
    observaciones TEXT,
    dni_doctor VARCHAR(9),
    sip_paciente INT(9),
    FOREIGN KEY (dni_doctor) REFERENCES DOCTOR(dni),
    FOREIGN KEY (sip_paciente) REFERENCES PACIENTE(sip)
);

## Modelo Fisico-DML

INSERT INTO DOCTOR (dni, nombre, especialidad, telefono, email) VALUES

('12345678A', 'Dr. Juan Pérez', 'Cardiología', 600123456, 'juan.perez@hospital.com'),

('23456789B', 'Dra. Ana Gómez', 'Pediatría', 610234567, 'ana.gomez@hospital.com'),

('34567890C', 'Dr. Luis Martínez', 'Neurología', 620345678, 'luis.martinez@hospital.com'),

('45678901D', 'Dra. Laura Rodríguez', 'Dermatología', 630456789, 'laura.rodriguez@hospital.com'),

('56789012E', 'Dr. Carlos Fernández', 'Ortopedia', 640567890, 'carlos.fernandez@hospital.com'),

('67890123F', 'Dra. María Sánchez', 'Oncología', 650678901, 'maria.sanchez@hospital.com'),

('78901234G', 'Dr. Javier López', 'Endocrinología', 660789012, 'javier.lopez@hospital.com'),

('89012345H', 'Dra. Elena Torres', 'Psiquiatría', 670890123, 'elena.torres@hospital.com'),

('90123456I', 'Dr. Pedro Gutiérrez', 'Ginecología', 680901234, 'pedro.gutierrez@hospital.com'),

('01234567J', 'Dra. Sofía Morales', 'Neumología', 690012345, 'sofia.morales@hospital.com');


INSERT INTO PACIENTE (sip, nombre, fnac, telefono, dni_doctor) VALUES

(100000001, 'Carlos Ruiz', '1985-05-10', 690123456, '12345678A'),

(100000002, 'Ana López', '1990-09-15', 691234567, '23456789B'),

(100000003, 'Miguel García', '1978-12-01', 692345678, '34567890C'),

(100000004, 'Laura Torres', '1995-07-20', 693456789, '45678901D'),

(100000005, 'Diego Martínez', '2000-02-28', 694567890, '56789012E'),

(100000006, 'Lucía Sánchez', '1983-03-25', 695678901, '67890123F'),

(100000007, 'Santiago Herrera', '1975-11-30', 696789012, '78901234G'),

(100000008, 'María Gómez', '1999-01-14', 697890123, '89012345H'),

(100000009, 'Raúl Fernández', '1992-06-18', 698901234, '90123456I'),

(100000010, 'Elena Díaz', '1987-04-05', 699012345, '01234567J');


INSERT INTO ASEGURADO (sip, aseguradora) VALUES

(100000001, 'Mapfre'),

(100000002, 'Sanitas'),

(100000003, 'Adeslas'),

(100000004, 'Asisa'),

(100000005, 'DKV'),

(100000006, 'Cigna'),

(100000007, 'Axa'),

(100000008, 'Generali'),

(100000009, 'Allianz'),

(100000010, 'Caser');

--En la tabla no asegurado no he insertado nada ya que todos estan asegurados


INSERT INTO CITA (fecha_cita, hora_cita, motivo_cita, dni_doctor, sip_paciente) VALUES

('2024-12-10', '10:00:00', 'Chequeo general', '12345678A', 100000001),

('2024-12-11', '11:00:00', 'Control pediátrico', '23456789B', 100000002),

('2024-12-12', '12:00:00', 'Dolor de cabeza', '34567890C', 100000003),

('2024-12-13', '09:00:00', 'Consulta de piel', '45678901D', 100000004),

('2024-12-14', '15:00:00', 'Dolor de rodilla', '56789012E', 100000005),

('2024-12-15', '14:00:00', 'Revisión oncología', '67890123F', 100000006),

('2024-12-16', '13:00:00', 'Chequeo diabetes', '78901234G', 100000007),

('2024-12-17', '08:30:00', 'Consulta psiquiátrica', '89012345H', 100000008),

('2024-12-18', '16:00:00', 'Revisión ginecológica', '90123456I', 100000009),

('2024-12-19', '17:00:00', 'Consulta respiratoria', '01234567J', 100000010);


INSERT INTO TRATAMIENTO (fecha_inicio, fecha_final, efectos_secundarios, dni_supervisor, sip_paciente) VALUES

('2024-11-01', '2025-01-01', 'Náuseas y mareos', '12345678A', 100000001),

('2024-11-02', '2025-02-01', 'Fatiga', '23456789B', 100000002),

('2024-11-03', '2025-03-01', 'Dolor de cabeza', '34567890C', 100000003),

('2024-11-04', '2025-04-01', 'Erupción cutánea', '45678901D', 100000004),

('2024-11-05', '2025-05-01', 'Insomnio', '56789012E', 100000005),

('2024-11-06', '2025-06-01', 'Diarrea', '67890123F', 100000006),

('2024-11-07', '2025-07-01', 'Dolor abdominal', '78901234G', 100000007),

('2024-11-08', '2025-08-01', 'Visión borrosa', '89012345H', 100000008),

('2024-11-09', '2025-09-01', 'Aumento de peso', '90123456I', 100000009),

('2024-11-10', '2025-10-01', 'Tos persistente', '01234567J', 100000010);



INSERT INTO HOSPITALIZACION (fecha_ingreso, fecha_alta, area, dni_doctor, sip_paciente) VALUES

('2024-10-01', '2024-10-10', 'Cardiología', '12345678A', 100000001),

('2024-10-05', '2024-10-15', 'Pediatría', '23456789B', 100000002),

('2024-10-10', '2024-10-20', 'Neurología', '34567890C', 100000003),

('2024-10-15', '2024-10-25', 'Dermatología', '45678901D', 100000004),

('2024-10-20', '2024-10-30', 'Ortopedia', '56789012E', 100000005),

('2024-10-25', '2024-11-05', 'Oncología', '67890123F', 100000006),

('2024-10-30', '2024-11-10', 'Endocrinología', '78901234G', 100000007),

('2024-11-01', '2024-11-11', 'Psiquiatría', '89012345H', 100000008),

('2024-11-05', '2024-11-15', 'Ginecología', '90123456I', 100000009),

('2024-11-10', '2024-11-20', 'Neumología', '01234567J', 100000010);



INSERT INTO MEDICAMENTO (nombre, dosis, frecuencia, observaciones, dni_doctor, sip_paciente) VALUES

('Ibuprofeno', '200mg', 'Cada 8 horas', 'Tomar después de las comidas', '12345678A', 100000001),

('Paracetamol', '500mg', 'Cada 6 horas', 'No exceder la dosis recomendada', '23456789B', 100000002);



