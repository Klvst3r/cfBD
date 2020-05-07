/*¿Que tipo de entidades / Autores
Nombre: autores

Campos:}

Nombre
Genero
Fecha de nacimiento 
Pais de Origen


clumna y el tipo de dato
*/




nombre VARCHAR(50);
genero CHAR(1) -- M O F
fecha_nacimiento DATE
pais_origen VARCHAR(40)

-- Normalización

-- Dividimos las columnas compuestas

nombre VARCHAR(20)
appaterno VARCHAR(25);
apmaterno VARCHAR(25);
genero CHAR(1) -- M O F
fecha_nacimiento DATE
pais_origen VARCHAR(40)



-- Crear idntificador de autor

autor_id INT
nombre VARCHAR(20)
appaterno VARCHAR(25);
apmaterno VARCHAR(25);
genero CHAR(1) -- M O F
fecha_nacimiento DATE
pais_origen VARCHAR(40)


--Crear tabla

CREATE TABLE autores(
	autor_id INT,
	nombre VARCHAR(20),
	appaterno VARCHAR(25),
	apmaterno VARCHAR(25),
	genero CHAR(1), -- M O F
	fecha_nacimiento DATE,
	pais_origen VARCHAR(40)
);-- 

-- Copiar y pegar en la consola de MySQL

