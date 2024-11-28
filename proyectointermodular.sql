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
