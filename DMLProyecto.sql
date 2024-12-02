--DML

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
