--PY813. (RABD.3 // CE3f, CE3g, CE3h // 10p) Siguiendo el reto y la actividad de proyecto PY712, en esta actividad nos vamos a centrar en añadir más consultas para explotar nuestra base de datos.
--Autor: Alejandro Rodriguez Blazquez
--Para ello, se pide un informe que detalle:

--Definición de 5 consultas que utilicen subconsultas, tanto escalares, como fila y de tabla.

--Paciente más joven atendido por cada doctor
SELECT d.dni, d.nombre, (
    SELECT MIN(p.fnac)
    from paciente p
    where p.dni_doctor = d.dni
) as paciente_mas_joven
FROM doctor d;

--Última cita de cada paciente (Subconsulta de Fila)
SELECT p.sip, p.nombre, (
    select c.fecha_cita 
    from cita c 
    where c.sip_paciente = p.sip 
    ORDER BY c.fecha_cita DESC 
    LIMIT 1
) as ultima_cita
from paciente p;

--Pacientes con más de un tratamiento activo (Subconsulta de Tabla)
SELECT * FROM paciente
where sip in (
    SELECT sip_paciente 
    from tratamiento 
    GROUP BY sip_paciente 
    having COUNT(*) > 1
);

--Lista de doctores que han recetado un medicamento específico
SELECT DISTINCT d.nombre 
from doctor d 
where d.dni IN (
    select dni_doctor 
    FROM medicamento
    where nombre = 'Ibuprofeno'
);

--Doctores que han atendido a más de 3 pacientes distintos
SELECT d.nombre, COUNT(DISTINCT p.sip) as total_pacientes
from doctor d
JOIN paciente p on d.dni = p.dni_doctor
GROUP BY d.dni, d.nombre
HAVING COUNT(DISTINCT p.sip) > 3;



--Definición de 2 consultas que utilicen CTE

--Número de citas por doctor
WITH CitasPorDoctor as (
    SELECT dni_doctor, COUNT(*) as total_citas
    from cita
    GROUP BY dni_doctor
)
select d.nombre, c.total_citas
FROM doctor d
JOIN CitasPorDoctor c ON d.dni = c.dni_doctor;

--Pacientes con más de una hospitalización
WITH Hospitalizados AS (
    select sip_paciente, COUNT(*) as total_hospitalizaciones
    from hospitalizacion
    GROUP BY sip_paciente
)
SELECT p.nombre, h.total_hospitalizaciones
from paciente p
join Hospitalizados h on p.sip = h.sip_paciente
WHERE h.total_hospitalizaciones > 1;

--Creación de una tabla a partir del resultado de una consulta compleja.

CREATE TABLE HISTORIAL_MEDICO AS
SELECT p.sip, p.nombre, c.fecha_cita, t.fecha_inicio as inicio_tratamiento, h.fecha_ingreso as ingreso_hospital
from paciente p
LEFT JOIN cita c ON p.sip = c.sip_paciente
LEFT JOIN tratamiento t on p.sip = t.sip_paciente
LEFT JOIN hospitalizacion h ON p.sip = h.sip_paciente;

--Definición de dos índices que mejoren el rendimiento de las consultas ya definidas

--Índice en dni_doctor en CITA
CREATE INDEX idx_dni_doctor ON CITA (dni_doctor);

--Índice en sip_paciente en TRATAMIENTO
CREATE INDEX idx_sip_paciente ON TRATAMIENTO (sip_paciente);

--Planes de ejecución, antes y después de la creación de los índices, comprobando su uso
--Comparación de Planes de Ejecución
EXPLAIN SELECT * FROM CITA 
where dni_doctor = '12345678A';
EXPLAIN SELECT * from TRATAMIENTO 
where sip_paciente = 100000001;

--Resolución mediante SQL de cada una de las consultas.
--Resultados de su ejecución sobre el modelo físico.

--Se utilizará una rúbrica para su evaluación en base a la siguiente lista de cotejo:

--Limpieza y calidad de las consultas.
--Variedad de consultas, desde consultas sencilla a más complejas.
--Documentación de las consultas.
--El informe entregado no contiene faltas de ortografía.
--El informe entregado tiene un formato adecuado (portada, apartados, autores, etc...).
--El informe debe indicar cómo se han repartido las tareas y qué ha realizado cada alumno/a.
