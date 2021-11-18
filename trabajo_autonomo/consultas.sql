/*Mostrar histórico de empleados por departamento anual. En una columna aparecerá el año, en otra columna el 
nombre del departamento, en otra columna el total de empleados que había ese año. 
*/

SELECT
EXTRACT (YEAR FROM FECHA_INICIO) AS AÑO, AREA_DEPARTAMENTO as NOMBRE_DEPARTAMENTO,
TOTAL_EMPLEADO
FROM AREA_DEPARTAMENTO 
where EXTRACT (YEAR FROM FECHA_INICIO) = '2019'

/*Consultar histórico de jefes por departamento. En una columna aparecerá el nombre del departamento, 
en otra columna el número de jefes que ha tenido hasta el momento ese departamento.
*/
SELECT
AREA_DEPARTAMENTO, TOTAL_JEFE
FROM JEFE
INNER JOIN AREA_DEPARTAMENTO ON JEFE.ID_JEFE=AREA_DEPARTAMENTO.ID_JEFE


/*Mostrar histórico de atrasos por año en cada departamento. En una columna deberá aparecer el año,
 en otra columna el nombre del departamento, en otra columna el número de atrasos en ese año
*/

SELECT
EXTRACT (YEAR FROM FECHA_RETRASO) AS AÑO_RETRASO, AREA_DEPARTAMENTO as Nombre_Departamento, 
CANT_RETRASO as NUMERO_RETRASOS
from EMPLEADO
INNER JOIN RETRASO ON EMPLEADO.ID_EMPLEADO=RETRASO.ID_EMPLEADO
INNER JOIN AREA_DEPARTAMENTO ON AREA_DEPARTAMENTO.ID_AREA=EMPLEADO.ID_AREA
ORDER BY FECHA_RETRASO ASC

/*Mostrar histórico de tipos de permiso (maternidad, enfermedad, viáticos, etc) por año.
En una columna aparecerá el año, en otra columna la dirección, en otra columna el número de permisos de ese tipo en ese año
*/

SELECT
EXTRACT (YEAR FROM FECHA_PERMISO) AS año,area_departamento, TIPO_PERMISO,CANT_PERMISO
from permiso 
inner join empleado on permiso.id_empleado=empleado.id_empleado
inner join area_departamento on empleado.id_area=area_departamento.id_area
ORDER BY FECHA_PERMISO ASC
