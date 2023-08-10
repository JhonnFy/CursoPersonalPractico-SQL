--Create Database
Create Database UniversalidadDeLosProcesos
--Use Database
Use UniversalidadDeLosProcesos

--Open 'CreateTable'
/*Table#1*/Create Table Escuela(
IdEscuela Int Primary Key Not Null,
Nombre Varchar(45) Not Null,
Logo Varchar(45) Not Null,
Direccion Varchar(45) Not Null,
Telefono Varchar(45) Not Null,
Correo Varchar(45) Not Null
);
/*Table#2*/Create Table Carrera(
IdCarrera Int Primary Key Not Null,
Nombre Varchar(45) Not Null,
Area Varchar(45) Not Null,
);
/*Table#3*/Create Table Grupo(
IdGrupo Int Primary Key Not Null,
Nombre Varchar(45) Not Null,
Capacidad Varchar(45) Not Null,
);
/*Table#4*/Create Table Semestre(
IdSemestre Int Primary Key Not Null,
Nombre Varchar(45) Not Null,
PeriodoEscolar Varchar(45) Not Null,
);
/*Table#5*/Create Table Materia(
IdMateria Int Primary Key Not Null,
Nombre Varchar(45) Not Null,
Creditos Varchar(45) Not Null,
);
/*Table#6*/Create Table Persona(
IdPersona Int Primary Key Not Null,
Nombre Varchar(45) Not Null,
Apaterno Varchar(45) Not Null,
Amaterno Varchar(45) Not Null,
Sexo Varchar(45) Not Null,
Direccion Varchar(45) Not Null,
Telefono Varchar(45) Not Null,
Email Varchar(45) Not Null,
);
/*Table#7*/Create Table Profesor(
Cedula Varchar(45) Not Null,
GradoAcademico Varchar(45) Not Null,
Especialidad Varchar(45) Not Null,
);
/*Table#8*/Create Table Alumno(
Clave Varchar(45) Not Null
);
/*Table#9*/Create Table Empleado(
Usuario Varchar(45) Not Null,
Passwrd Varchar(45) Not Null,
Tipo Varchar(45) Not Null,
Estado Varchar(45) Not Null,
FechaAcceso Date Not Null
);
/*Table#10*/Create Table Inscripcion(
IdFicha Int Primary Key Not Null,
IdAlumno Int Not Null,
IdGrupo Int Not Null,
);
--Exit 'CreateTable'

--Open 'Atributos Para Fk Tablas 1-10'
ALTER TABLE Carrera ADD FkIdEscuela Int Not Null;
ALTER TABLE Grupo ADD FkIdCarrera Int Not Null;
ALTER TABLE Semestre ADD FkIdCarrera Int Not Null;
ALTER TABLE Semestre ADD FKIdMateria Int Not Null;
ALTER TABLE Profesor ADD IdPersona Int Not Null;
ALTER TABLE Alumno ADD IdPersona Int Not Null;
ALTER TABLE Empleado ADD IdPersona Int Not Null;
ALTER TABLE Inscripcion ADD IdEmpleado Int Not Null;
--Exit 'Atributos Para Fk Tablas 1-10'

--Open 'Crear Las Relaciones (1.1)'
ALTER TABLE Profesor ADD Constraint FkProfesorPersona Foreign Key (IdPersona) References Persona(IdPersona);
ALTER TABLE Profesor ADD Constraint UkProfesor Unique(IdPersona);

ALTER TABLE Alumno ADD Constraint FkAlumnoPersona Foreign Key (IdPersona) References Persona(IdPersona);
ALTER TABLE Alumno ADD Constraint UkAlumno Unique(IdPersona);

ALTER TABLE Empleado ADD Constraint FkEmpleadoPersona Foreign Key (IdPersona) References Persona(IdPersona);
ALTER TABLE Empleado ADD Constraint UkEmpleado Unique(IdPersona);
--Exit 'Crear Las Relaciones (1.1)'


--Open 'Crear Las Relaciones (N.N)'
Create Table ProfesorMateria(
IdPersona Int Not Null,
IdMateria Int Not Null,
Periodo Varchar(45) Not Null,
Years Date Not Null,
Primary Key (IdPersona,IdMateria)
);
ALTER TABLE ProfesorMateria ADD Constraint FkPersona Foreign Key (IdPersona) References Profesor(IdPersona); 
ALTER TABLE ProfesorMateria ADD Constraint FkMateria Foreign Key (IdMateria) References Materia(IdMateria);

Create Table AlumnoMateria(
IdMateria Int Not Null,
IdAlumno Int Not Null
Primary Key (IdAlumno,IdMateria),
);
ALTER TABLE AlumnoMateria ADD Constraint FkMateriaAlumno Foreign Key (IdMateria) References Materia(IdMateria);
ALTER TABLE AlumnoMateria ADD Constraint FkAlumnoMateria Foreign Key (IdAlumno)  References Alumno(IdPersona);
--Exit 'Crear Las Relaciones (N.N)'

--Open 'Crear Las Relaciones (1.N)'
ALTER TABLE Carrera ADD Constraint FkCarreraEscuela Foreign Key (FkIdEscuela) References Escuela(IdEscuela);
ALTER TABLE Grupo ADD Constraint FkGrupoCarrera Foreign Key (FkIdCarrera) References Carrera(IdCarrera);
ALTER TABLE Semestre ADD Constraint FkSemestreCarrera Foreign Key (FkIdCarrera ) References Carrera(IdCarrera);
ALTER TABLE Semestre ADD Constraint FkSemestreMateria Foreign Key (FKIdMateria) References Materia(IdMateria);
ALTER TABLE Inscripcion ADD Constraint FkInscripcionEmpleado Foreign KEy(IdEmpleado) References Empleado(IdPersona);
--Exit 'Crear Las Relaciones (1.N)'  