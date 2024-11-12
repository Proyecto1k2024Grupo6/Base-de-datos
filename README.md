# Sistema-de-informacion

El hospital atiende a una variedad de pacientes que requieren diferentes servicios médicos. Cada paciente tiene un expediente clínico que contiene su información personal y médica. Los pacientes pueden tener múltiples consultas con diferentes doctores en el hospital, y pueden ser admitidos en el hospital para hospitalización. Información registrada del paciente: Nombre completo, fecha de nacimiento, dirección, teléfono de contacto y correo electrónico. También se incluye información médica como su historial clínico y tratamientos previos.

El hospital cuenta con varios doctores especializados en diferentes áreas de la medicina. Cada doctor tiene una especialidad, puede atender consultas, realizar tratamientos y supervisar hospitalizaciones. Los doctores tienen un horario de atención y pueden estar asignados a distintas áreas o departamentos del hospital. Información registrada del doctor: Nombre, especialidad, teléfono, correo electrónico, y área en la que trabaja (ej. cardiología, pediatría, etc.).

Los pacientes programan citas para ser atendidos por los doctores. Cada cita está asignada a un paciente y un doctor, y tiene una fecha, hora y motivo (como una consulta de seguimiento, chequeo general, entre otros). Las citas son esenciales para gestionar la carga de trabajo de los doctores y organizar la atención a los pacientes. Información registrada de la cita: Fecha, hora, motivo de la cita, y la referencia del paciente y doctor involucrado.

A los pacientes se les prescriben tratamientos según su diagnóstico. Cada tratamiento puede incluir instrucciones, prescripciones de medicamentos, y fechas de inicio y fin. Un tratamiento puede involucrar uno o más medicamentos, y el doctor es responsable de supervisar y ajustar el tratamiento según sea necesario. Información registrada del tratamiento: Nombre del tratamiento, descripción, doctor responsable, paciente tratado, fechas de inicio y fin, y medicamentos asociados.

El hospital mantiene un inventario de medicamentos que se utilizan para los tratamientos de los pacientes. Cada medicamento tiene un nombre, una descripción y un precio, ya que algunos medicamentos son facturados al paciente. Un tratamiento puede incluir múltiples medicamentos, y un medicamento puede ser parte de varios tratamientos. Información registrada del medicamento: Nombre, descripción, precio, y stock (si es necesario controlarlo en inventario).

Algunos pacientes requieren hospitalización. Una hospitalización ocurre cuando un paciente es admitido para recibir atención médica continua, bajo la supervisión de uno o varios doctores. Cada hospitalización tiene una fecha de ingreso, una fecha de alta, y el paciente puede recibir tratamientos durante su estancia. Información registrada de la hospitalización: Fecha de ingreso, fecha de alta, paciente involucrado y doctor responsable.

# Esquema relaciones

![image](https://github.com/user-attachments/assets/ad45ac8f-0456-42a2-bbc5-04427f0899e3)


# Modelo Relacional:
DOCTOR (dni, nombre, especialidad, telefono, email)


PK: (dni)

PACIENTE (sip, nombre, fnac, telefono, dni)

PK: (sip)

CITA (id, fecha_cita, hora_cita, motivo_cita, dni*, sip*)

PK: (id)

FK: (dni) → DOCTOR

FK: (sip) → PACIENTE

TRATAMIENTO (id, fecha_inicio, fecha_final, duracion, efectos_secundarios, dni_supervisor*, sip*)

PK: (id)

FK: (dni_supervisor) → DOCTOR

FK: (sip) → PACIENTE

HOSPITALIZACION (id, fecha_ingreso, fecha_alta, area, dni_doctor*, sip*)

PK: (id)

FK: (dni_doctor) → DOCTOR

FK: (sip) → PACIENTE

MEDICAMENTO (id, nombre, dosis, frecuencia, observaciones)

PK: (id)

DOCTOR_MEDICAMENTO (dni*, medicamento_id*)

PK: (dni, medicamento_id)

FK: (dni) → DOCTOR

FK: (medicamento_id) → MEDICAMENTO

TRATAMIENTO_MEDICAMENTO (tratamiento_id*, medicamento_id*)

PK: (tratamiento_id, medicamento_id)

FK: (tratamiento_id) → TRATAMIENTO

FK: (medicamento_id) → MEDICAMENTO

ASEGURADO (no_asegurado, aseguradora, sip*)

PK: (no_asegurado)

FK: (sip) → PACIENTE
