----------------------------------------------------------
-------------------------CONSULTAS------------------------
--1---
/*Mostrar histórico de accidentes laborales por departamento anual.
En una columna aparecerá el año, en otra columna el nombre del departamento, 
en otra columna la descripción del accidente y en otra columna el total de 
accidentes que hubo en ese año. 
*/
SELECT
EXTRACT (YEAR FROM FECHA_ACCIDENTE) AS AÑO,AREA,DESCRIPCION_ACCIDENTE,
CANT_ACCIDENTE AS TOTAL_ACCIDENTE
FROM ACCIDENTE_LABORAL
INNER JOIN EMPLEADO ON ACCIDENTE_LABORAL.ID_EMPLEADO=EMPLEADO.ID_EMPLEADO
INNER JOIN AREA_DEPARTAMENTO ON EMPLEADO.ID_AREA=AREA_DEPARTAMENTO.ID_AREA
ORDER BY FECHA_ACCIDENTE DESC

--2---
/*Mostrar histórico de empleados que han trabajado horas extra. 
En una columna aparecerá el nombre del empleado, en otra columna el departamento 
al que pertenece,y en otra la cantidad de veces que ha laborado horas extras.*/

SELECT
(NOMBRE_EMPLEADO || ' ' || APELLIDO_EMPLEADO) AS NOMBRE, AREA AS DEPARTAMENTO,
CANT_HORAE 
FROM EMPLEADO
INNER JOIN AREA_DEPARTAMENTO ON EMPLEADO.ID_AREA=AREA_DEPARTAMENTO.ID_AREA
INNER JOIN HORARIO ON AREA_DEPARTAMENTO.ID_AREA=HORARIO.ID_AREA
INNER JOIN HORA_EXTRA ON HORARIO.ID_HORARIO=HORA_EXTRA.ID_HORARIO
ORDER BY CANT_HORAE DESC

--3--
/*Mostrar histórico de tipos de permiso (maternidad, enfermedad, viáticos, etc) 
por año. En una columna aparecerá el año, en otra columna el departamento en el 
que labora, en otra columna el número de permisos de ese tipo en ese año
*/
SELECT 
EXTRACT (YEAR FROM FECHA_PERMISO) AS AÑO, AREA, TIPO_PERMISO, CANT_PERMISO
FROM PERMISO
INNER JOIN EMPLEADO ON PERMISO.ID_EMPLEADO= EMPLEADO.ID_EMPLEADO
INNER JOIN AREA_DEPARTAMENTO ON EMPLEADO.ID_AREA=AREA_DEPARTAMENTO.ID_AREA 
ORDER BY FECHA_PERMISO ASC

--4--

/*Mostrar histórico de empleados que más atrasos han tenido a lo largo del año. En
una columna aparecerá el nombre del empleado, en otra columna el tipo de retraso, 
en otra columna la observación que se le dio y en otra columna el total de retrasos
que ha tenido.   
*/

SELECT 
EXTRACT (YEAR FROM FECHA_RETRASO) AS AÑO, 
(NOMBRE_EMPLEADO || ' ' || APELLIDO_EMPLEADO) AS NOMBRE, TIPO_RETRASO,
OBSERVACION_,CANT_RETRASO AS TOTAL_RETRASO
FROM RETRASO
INNER JOIN EMPLEADO ON RETRASO.ID_EMPLEADO=EMPLEADO.ID_EMPLEADO
ORDER BY CANT_RETRASO DESC
