use henry;

-- 1

select count(*) as cantidad_carreras
from Carrera;

-- 2
select count(idAlumno) as cantidadAlumnos
from Alumno;

-- 3 
select idCohorte, count(*) as cantidadAlumnos
from Alumno
group by idCohorte;

-- 4
select concat(nombre,' ', apellido) as nombreYapellido, fechaIngreso
from Alumno
order by fechaIngreso desc;

-- 5 
select concat(nombre, ' ', apellido) as nombreYapellido, fechaIngreso
from Alumno
order by fechaIngreso 
limit 1;

-- 6
select date_format(fechaIngreso, '%d/%m/%Y') as fechaIngreso
from Alumno
order by fechaIngreso
limit 1;

-- 7
select concat(nombre, ' ', apellido) as nombreYapellido, fechaIngreso
from Alumno
order by fechaIngreso desc
limit 1;

-- 8
select year(fechaIngreso) as initYear, count(*) as students
from Alumno
group by initYear;

-- 9
select weekofyear(fechaIngreso) as initWeek, count(*) as students
from Alumno
group by initWeek;

-- 10
select year(fechaIngreso) as initYear, count(*) as students
from Alumno
group by initYear
having students > 20
order by 1;

-- 11
select concat(nombre, ' ', apellido) as nombre_completo, 
	timestampdiff(year, fechaNacimiento, curdate()) as age,
    date_add(fechaNacimiento, interval timestampdiff(year, fechaNacimiento, curdate())
    year) as verificacion, fechaNacimiento
from Instructor
order by 2 asc;

-- 12
select concat(nombre,' ',apellido) as nombre_completo,
		timestampdiff(year, fechaNacimiento, curdate()) as age
from Alumno;
-- edad_promedio
select round(avg(timestampdiff(year, fechaNacimiento, curdate()))) as avg_age
from Alumno;
-- edad por cohorte
select round(avg(timestampdiff(year, fechaNacimiento, curdate()))) as avg_age,
		idCohorte
from alumno
group by idCohorte;

-- 13
SELECT CONCAT(nombre,' ',apellido) AS NOMBRE_COMPLETO,
		TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS EDAD
FROM Alumno
WHERE TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) > 
	(SELECT round(avg(timestampdiff(year, fechaNacimiento, curdate())))
		FROM Alumno)
ORDER BY 2;

SELECT idAlumno, concat(nombre, ' ', apellido) as nombre_apellido,
timestampdiff(YEAR, fechaNacimiento, curdate()) AS edad
FROM alumno
WHERE timestampdiff(YEAR, fechaNacimiento, curdate()) >
	(SELECT round(avg(timestampdiff(YEAR, fechaNacimiento, curdate()))) AS edad_promedio
	FROM alumno)
ORDER BY 3;