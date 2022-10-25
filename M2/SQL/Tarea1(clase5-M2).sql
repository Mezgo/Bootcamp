use henry;

-- Creating tables

create table Carrera(
	idCarrera int not null auto_increment,
    nombre varchar(50) not null,
    primary key (idCarrera) 
);

create table Instructor(
	idInstructor int not null auto_increment,
    cedulaIdentidad varchar(30) not null,
    nombre varchar(40) not null,
    apellido varchar(40) not null,
    fechaNacimiento date not null,
    fechaIncorporacion date not null,
    primary key(idInstructor)
);

create table Cohorte(
	idCohorte int not null auto_increment,
    codigo varchar(30) not null,
    idCarrera int not null,
    idInstructor int not null,
    fechaInicio date,
    fechaFinalizacion date,
    primary key (idCohorte),
    foreign key (idCarrera) references Carrera(idCarrera),
    foreign key(idInstructor) references Instructor(idInstructor)
);

create table Alumno(
	idAlumno int not null auto_increment,
    cedulaIdentidad varchar(30) not null,
	nombre varchar(40) not null,
	apellido varchar(40) not null,
    fechaNacimiento date not null,
    fechaIngreso date,
    idCohorte int,
    primary key (idAlumno),
    foreign key (idCohorte) references Cohorte(idCohorte)
);