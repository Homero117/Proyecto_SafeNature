use master
go

create database Integrador_Safe_segurity2
go

use Integrador_Safe_segurity2
go

/*Definir las tablas a usar*/

create table Proyecto(
	ProyectoID int primary key,
	NombreProyecto varchar(100) not null,
	DescripcionProyecto text not null,
	FechaInicioProyecto date not null,
	fechaFinProyecto date not null,
	EstadoProyecto varchar(20) not null,
	TotalProyecto money not null
)

create table ProyectosAsignados(
	AsignacionProyectoID int primary key,
	ProyectoID int not null,
	TrabajadorID int not null,
	FechaInicioAsignacion date not null,
	FechaFinAsignacion date not null
)

create table Trabajadores(
	TrabajadorID int primary key,
	NombreTrabajador varchar(25) not null,
	ApellidoPaterno varchar(25) not null,
	ApellidoMaterno varchar(25) not null,
	DireccionTrabajador varchar(100) not null,
	TelefonoTrbajador varchar(15) not null,
	EmailTrabajador varchar(50) not null,
	FechaContratacion date not null,
	Cargo varchar(50) not null,
	SalarioTrabajador money not null
)

create table AplicacionProyecto(
	ProyectoID int not null,
	ComponenteID int not null,
	CantidadAsignada int not null,
	Observaciones text not null
)

create table ComponentesElectronicos(
	ComponenteID int primary key,
	NombreComponente varchar(50) not null,
	DescripcionComponente text not null,
	TipoComponente varchar(35) not null,
	EspecificacionesTecnicas text not null,
	PrecioComponente money not null
)

create table ProveerComponentes(
	ProveedorComponenteID int,
	ComponenteID int
)

create table ProveedoresComponentes(
	ProveedorcomponenteID int primary key,
	NombreProveedor varchar(50) not null,
	DireccionProveedor varchar(100) not null,
	ContactoProveedor varchar(100) not null,
	WebsiteProveedor varchar(50) not null
)

/*Establecer relaciones entre las tablas*/

alter table ProyectosAsignados
add constraint fk_Proyecto_PryectosAsignados foreign key (ProyectoID)
references Proyecto (ProyectoID)
go

alter table ProyectosAsignados
add constraint fk_Trabajadores_ProyectosAsignados foreign key (TrabajadorID)
references Trabajadores (TrabajadorID)
go

alter table AplicacionProyecto
add constraint fk_Proyecto_AplicacionProyecto foreign key (ProyectoID)
references Proyecto (ProyectoID)
go

alter table AplicacionProyecto
add constraint fk_ComponentesElectronicos_AplicacionProyecto foreign key (ComponenteID)
references ComponentesElectronicos (ComponenteID)
go

alter table ProveerComponentes
add constraint fk_ProveedoresComponentes_ProveerComponentes foreign key (ProveedorComponenteID)
references ProveedoresComponentes (ProveedorcomponenteID)
go

alter table ProveerComponentes
add constraint fk_ComponentesElectronicos_ProveerComponentes foreign key (ComponenteID)
references ComponentesElectronicos (ComponenteID)
go

/*Agregar datos a las tablas*/
/*drop table ProyectosAsignados
drop table Trabajadores
drop table AplicacionProyecto
drop table ProveerComponentes
drop table ProveedoresComponentes
drop table Proyecto
drop table ComponentesElectronicos*/

--Tabla proyectos
insert into Proyecto values (11111,'Safe Security', 'Aplicacion de animales venenosos', '2022-08-22','2023-11-27','En desarrollo',22435)
go
insert into Proyecto values (11112,'Pelotea App', 'Administracion de liga de futbol', '2020-10-15','2022-07-25','Concluida',258.50)
go
INSERT INTO Proyecto VALUES (11113, 'E-commerce Redesign', 'Rediseño de la plataforma de comercio electrónico', '2022-09-15', '2023-12-10', 'En planificación', 35000);
go
INSERT INTO Proyecto VALUES (11114, 'Smart Home Automation', 'Desarrollo de sistemas de automatización para hogares inteligentes', '2022-10-01', '2023-12-31', 'En ejecución', 45000);
go
INSERT INTO Proyecto VALUES (11115, 'Mobile Health App', 'Creación de una aplicación móvil para el seguimiento de la salud', '2022-11-10', '2023-11-30', 'Concluido', 28000);
go

--Tabla Trbajador
insert into Trabajadores values (22011001, 'Atti', 'Cornejo', 'Ceron', 'Av. Petroleos Mexicanos s/n', '7731826973', '22011314@itsoeh.edu.mx', '2023-08-11', 'Gerente de desarrollo', 16480)
go
INSERT INTO Trabajadores VALUES (22011002, 'Lucía', 'García', 'Rodríguez', 'Calle 123, Ciudad X', '555-1234', 'lucia@email.com', '2023-09-01', 'Analista de Datos', 20000);
go
INSERT INTO Trabajadores VALUES (22011003, 'Carlos', 'Martínez', 'López', 'Av. Principal, Pueblo Y', '777-4567', 'carlos@email.com', '2023-10-15', 'Diseñador Gráfico', 25000);
go
INSERT INTO Trabajadores VALUES (22011004, 'Elena', 'Pérez', 'Gómez', 'Calle Central, Ciudad Z', '888-7890', 'elena@email.com', '2023-11-20', 'Ingeniero de Software', 30000);
go
INSERT INTO Trabajadores VALUES (22011005, 'Juan', 'Hernández', 'Gómez', 'Calle 456, Ciudad A', '555-9876', 'juan@email.com', '2023-12-01', 'Analista de Sistemas', 28000);
go
INSERT INTO Trabajadores VALUES (22011006, 'María', 'Díaz', 'López', 'Av. Principal, Pueblo B', '777-2345', 'maria@email.com', '2024-01-10', 'Desarrollador Web', 32000);
go
INSERT INTO Trabajadores VALUES (22011007, 'Pedro', 'Martínez', 'Rodríguez', 'Calle 789, Ciudad C', '888-3456', 'pedro@email.com', '2024-02-15', 'Gerente de Proyectos', 35000);
go
INSERT INTO Trabajadores VALUES (22011008, 'Alejandro', 'Sánchez', 'López', 'Calle 987, Ciudad E', '555-4321', 'alejandro@email.com', '2024-01-20', 'Analista de Marketing', 29000);
go
INSERT INTO Trabajadores VALUES (22011009, 'Ana', 'García', 'Ramírez', 'Av. Central, Pueblo F', '777-5678', 'ana@email.com', '2024-02-28', 'Ingeniero de Redes', 31000);
go
INSERT INTO Trabajadores VALUES (22011010, 'Carlos', 'Fernández', 'Pérez', 'Calle 654, Ciudad G', '888-6789', 'carlos@email.com', '2024-03-15', 'Diseñador UX/UI', 33000);
go
INSERT INTO Trabajadores VALUES (22011011, 'Laura', 'Torres', 'Díaz', 'Av. Norte, Pueblo H', '999-7890', 'laura@email.com', '2024-04-02', 'Analista Financiero', 36000);
go
INSERT INTO Trabajadores VALUES (22011012, 'Javier', 'Mendoza', 'Herrera', 'Calle 321, Ciudad I', '555-8765', 'javier@email.com', '2024-05-10', 'Desarrollador Frontend', 34000);
go
INSERT INTO Trabajadores VALUES (22011013, 'Luisa', 'Gómez', 'Fernández', 'Calle 987, Ciudad J', '555-1111', 'luisa@email.com', '2024-06-01', 'Analista de Recursos Humanos', 30000);
go
INSERT INTO Trabajadores VALUES (22011014, 'Roberto', 'Ortega', 'Martínez', 'Av. Principal, Pueblo K', '777-2222', 'roberto@email.com', '2024-07-15', 'Gerente de Ventas', 38000);
go
INSERT INTO Trabajadores VALUES (22011015, 'Sofía', 'Ruíz', 'Mendoza', 'Calle 654, Ciudad L', '888-3333', 'sofia@email.com', '2024-08-22', 'Ingeniero de Sistemas', 42000);
go
INSERT INTO Trabajadores VALUES (22011016, 'Carlos', 'Fernández', 'Pérez', 'Av. Norte, Pueblo M', '999-4444', 'carlos@email.com', '2024-09-30', 'Analista de Datos', 35000);
go
INSERT INTO Trabajadores VALUES (22011017, 'María', 'López', 'Ramírez', 'Calle 321, Ciudad N', '555-5555', 'maria@email.com', '2024-10-10', 'Diseñador Gráfico', 32000);
go
INSERT INTO Trabajadores VALUES (22011018, 'Andrés', 'Gutiérrez', 'Ruíz', 'Calle 123, Ciudad O', '555-6666', 'andres@email.com', '2024-11-15', 'Desarrollador Full Stack', 36000);
go
INSERT INTO Trabajadores VALUES (22011019, 'Elena', 'Hernández', 'Gómez', 'Av. Central, Pueblo P', '777-7777', 'elena@email.com', '2024-12-01', 'Analista de Marketing', 38000);
go
INSERT INTO Trabajadores VALUES (22011020, 'José', 'Martínez', 'López', 'Calle 456, Ciudad Q', '888-8888', 'jose@email.com', '2025-01-10', 'Gerente de Proyectos', 40000);
go
INSERT INTO Trabajadores VALUES (22011021, 'Sara', 'García', 'Rodríguez', 'Av. Secundaria, Pueblo R', '999-9999', 'sara@email.com', '2025-02-15', 'Ingeniero de Sistemas', 42000);
go
INSERT INTO Trabajadores VALUES (22011022, 'Hugo', 'Ramírez', 'Mendoza', 'Calle 654, Ciudad S', '555-0000', 'hugo@email.com', '2025-03-01', 'Analista Financiero', 40000);
go
INSERT INTO Trabajadores VALUES (22011023, 'Laura', 'Torres', 'Díaz', 'Calle 321, Ciudad T', '555-1111', 'laura@email.com', '2025-04-15', 'Desarrollador Backend', 38000);
go
INSERT INTO Trabajadores VALUES (22011024, 'Miguel', 'Gómez', 'Fernández', 'Av. Principal, Pueblo U', '777-2222', 'miguel@email.com', '2025-05-01', 'Analista de Datos', 35000);
go
INSERT INTO Trabajadores VALUES (22011025, 'Isabel', 'Ortega', 'Martínez', 'Calle 987, Ciudad V', '888-3333', 'isabel@email.com', '2025-06-10', 'Ingeniero de Redes', 42000);
go


/*UPDATE ProyectosAsignados
SET TrabajadorID = 22011025
WHERE AsignacionProyectoID=0025;
go*/

-- Tabla Proyectos Asignados
insert into ProyectosAsignados values (001, 11111, 22011001, '2022-08-16', '2023-06-23')
go
INSERT INTO ProyectosAsignados VALUES (002, 11111, 22011001, '2022-09-01', '2023-07-15');
go
INSERT INTO ProyectosAsignados VALUES (003, 11111, 22011001, '2022-10-10', '2023-08-20');
go
INSERT INTO ProyectosAsignados VALUES (004, 11111, 22011001, '2022-11-15', '2023-09-30');
go
INSERT INTO ProyectosAsignados VALUES (005, 11111, 22011001, '2022-12-01', '2023-10-10');
go
INSERT INTO ProyectosAsignados VALUES (006, 11112, 22011001, '2023-01-10', '2023-11-15');
go
INSERT INTO ProyectosAsignados VALUES (007, 11112, 22011001, '2023-02-15', '2023-12-01');
go
INSERT INTO ProyectosAsignados VALUES (008, 11112, 22011001, '2023-03-01', '2024-01-10');
go
INSERT INTO ProyectosAsignados VALUES (009, 11112, 22011001, '2023-04-10', '2024-02-15');
go
INSERT INTO ProyectosAsignados VALUES (010, 11112, 22011001, '2023-05-15', '2024-03-01');
go
INSERT INTO ProyectosAsignados VALUES (011, 11113, 22011001, '2023-06-01', '2024-04-10');
go
INSERT INTO ProyectosAsignados VALUES (012, 11113, 22011001, '2023-07-10', '2024-05-15');
go
INSERT INTO ProyectosAsignados VALUES (013, 11113, 22011001, '2023-08-15', '2024-06-01');
go
INSERT INTO ProyectosAsignados VALUES (014, 11113, 22011001, '2023-09-01', '2024-07-10');
go
INSERT INTO ProyectosAsignados VALUES (015, 11113, 22011001, '2023-10-10', '2024-08-15');
go
INSERT INTO ProyectosAsignados VALUES (016, 11114, 22011001, '2023-11-15', '2024-09-01');
go
INSERT INTO ProyectosAsignados VALUES (017, 11114, 22011001, '2023-12-01', '2024-10-10');
go
INSERT INTO ProyectosAsignados VALUES (018, 11114, 22011001, '2024-01-10', '2024-11-15');
go
INSERT INTO ProyectosAsignados VALUES (019, 11114, 22011001, '2024-02-15', '2024-12-01');
go
INSERT INTO ProyectosAsignados VALUES (020, 11114, 22011001, '2024-03-01', '2025-01-10');
go
INSERT INTO ProyectosAsignados VALUES (021, 11115, 22011001, '2024-04-10', '2025-02-15');
go
INSERT INTO ProyectosAsignados VALUES (022, 11115, 22011001, '2024-05-15', '2025-03-01');
go
INSERT INTO ProyectosAsignados VALUES (023, 11115, 22011001, '2024-06-01', '2025-04-10');
go
INSERT INTO ProyectosAsignados VALUES (024, 11115, 22011001, '2024-07-10', '2025-05-15');
go
INSERT INTO ProyectosAsignados VALUES (025, 11115, 22011001, '2024-08-15', '2025-06-01');
go

-- Componentes electrónicos
INSERT INTO ComponentesElectronicos VALUES (0001, 'Resistor', 'Resistor de 1k ohm', 'Pasivo', '1/4W, 5%', 5.50);
go
INSERT INTO ComponentesElectronicos VALUES (0002, 'Microcontrolador', 'Microcontrolador AVR', 'Activo', 'ATmega328P, 8-bit', 15.99);
go
INSERT INTO ComponentesElectronicos VALUES (0003, 'Transistor NPN', 'Transistor NPN 2N2222', 'Pasivo', 'TO-92', 18.25);
go
INSERT INTO ComponentesElectronicos VALUES (0004, 'LED', 'LED Rojo', 'Pasivo', '5mm, 2V', 4.10);
go
INSERT INTO ComponentesElectronicos VALUES (0005, 'Sensor de Temperatura', 'Sensor LM35', 'Pasivo', 'Salida lineal, 0.1°C', 88.50);
go
INSERT INTO ComponentesElectronicos VALUES (0006, 'Condensador Electrolítico', 'Condensador de 100uF', 'Pasivo', 'Electrolítico, 16V', 63.20);
go
INSERT INTO ComponentesElectronicos VALUES (0007, 'Diodo Rectificador', 'Diodo 1N4007', 'Pasivo', '1000V, 1A', 98.15);
go
INSERT INTO ComponentesElectronicos VALUES (0008, 'Cristal Oscilador', 'Cristal de 16MHz', 'Pasivo', 'Resonador de cuarzo', 30.75);
go
INSERT INTO ComponentesElectronicos VALUES (0009, 'Amplificador Operacional', 'Op-Amp LM741', 'Activo', '8 pines, 1 MHz', 15.50);
go
INSERT INTO ComponentesElectronicos VALUES (0010, 'Relé', 'Relé de 5V', 'Activo', '1 canal, 10A', 25.99);
go
INSERT INTO ComponentesElectronicos VALUES (0011, 'Servomotor', 'Servomotor SG90', 'Activo', '9g, 180°', 48.99);
go
INSERT INTO ComponentesElectronicos VALUES (0012, 'Capacitor Cerámico', 'Capacitor de 10nF', 'Pasivo', 'Cerámico, 50V', 60.08);
go
INSERT INTO ComponentesElectronicos VALUES (0013, 'Interruptor de Palanca', 'Interruptor SPST', 'Pasivo', '2 posiciones, ON/OFF', 10.00);
go
INSERT INTO ComponentesElectronicos VALUES (0014, 'Motor Paso a Paso', 'Motor NEMA 17', 'Activo', '1.8°/step, 12V', 19.99);
go
INSERT INTO ComponentesElectronicos VALUES (0015, 'Sensor de Luz', 'Sensor LDR', 'Pasivo', 'Resistencia variable con luz', 60.50);
go


-- Proveedores de componentes
INSERT INTO ProveedoresComponentes VALUES (20231, 'ElectroComponentes', 'Av. Industrial 123, Ciudad A', 'Juan Pérez', 'www.electrocomponentes.com');
go
INSERT INTO ProveedoresComponentes VALUES (20232, 'TechPartners', 'Calle Tecnológica 456, Ciudad B', 'Ana Gómez', 'www.techpartners.com');
go
INSERT INTO ProveedoresComponentes VALUES (20233, 'Suministros Electrónicos', 'Av. del Proveedor 789, Ciudad C', 'Carlos Martínez', 'www.suministroselectronicos.com');
go

-- AplicacionProyecto
INSERT INTO AplicacionProyecto VALUES (11111, 0001, 10, 'Interfaz de usuario intuitiva y fácil de usar.');
go
INSERT INTO AplicacionProyecto VALUES (11111, 0002, 15, 'Capacidad de procesamiento de datos en tiempo real.');
go
INSERT INTO AplicacionProyecto VALUES (11111, 0003, 8, 'Integración con sistemas de terceros para intercambio de datos.');
go
INSERT INTO AplicacionProyecto VALUES (11112, 0004, 20, 'Seguridad robusta con autenticación de dos factores.');
go
INSERT INTO AplicacionProyecto VALUES (11112, 0005, 12, 'Funcionalidad de generación de informes y análisis.');
go
INSERT INTO AplicacionProyecto VALUES (11112, 0006, 18, 'Compatibilidad con dispositivos móviles y tablets.');
go
INSERT INTO AplicacionProyecto VALUES (11113, 0007, 25, 'Capacidad de escalabilidad para manejar un gran volumen de usuarios.');
go
INSERT INTO AplicacionProyecto VALUES (11113, 0008, 14, 'Funcionalidad de copia de seguridad y restauración.');
go
INSERT INTO AplicacionProyecto VALUES (11113, 0009, 22, 'Soporte para múltiples idiomas.');
go
INSERT INTO AplicacionProyecto VALUES (11114, 0010, 16, 'Integración con servicios en la nube.');
go
INSERT INTO AplicacionProyecto VALUES (11114, 0011, 30, 'Funcionalidad de búsqueda avanzada.');
go
INSERT INTO AplicacionProyecto VALUES (11114, 0012, 9, 'Interoperabilidad con sistemas legacy.');
go
INSERT INTO AplicacionProyecto VALUES (11115, 0013, 17, 'Notificaciones push para usuarios.');
go
INSERT INTO AplicacionProyecto VALUES (11115, 0014, 11, 'Integración con redes sociales.');
go
INSERT INTO AplicacionProyecto VALUES (11115, 0015, 24, 'Capacidad de personalización de perfiles de usuario.');
go

-- ProveerComponentes
insert into ProveerComponentes values (20231, 0001)
go
insert into ProveerComponentes values (20231, 0002)
go
insert into ProveerComponentes values (20231, 0003)
go
insert into ProveerComponentes values (20231, 0004)
go
insert into ProveerComponentes values (20231, 0005)
go
insert into ProveerComponentes values (20232, 0006)
go
insert into ProveerComponentes values (20232, 0007)
go
insert into ProveerComponentes values (20232, 0008)
go
insert into ProveerComponentes values (20232, 0009)
go
insert into ProveerComponentes values (20232, 0010)
go
insert into ProveerComponentes values (20233, 0011)
go
insert into ProveerComponentes values (20233, 0012)
go
insert into ProveerComponentes values (20233, 0013)
go
insert into ProveerComponentes values (20233, 0014)
go
insert into ProveerComponentes values (20233, 0015)
go

/*Realizar sus debidas consultas*/

-- 1
SELECT ComponentesElectronicos.ComponenteID, ComponentesElectronicos.NombreComponente, ComponentesElectronicos.TipoComponente, ComponentesElectronicos.PrecioComponente, ProveedoresComponentes.NombreProveedor
FROM ComponentesElectronicos
JOIN ProveerComponentes ON ComponentesElectronicos.ComponenteID = ProveerComponentes.ComponenteID
JOIN ProveedoresComponentes ON ProveerComponentes.ProveedorComponenteID = ProveedoresComponentes.ProveedorcomponenteID;
go

-- 2
SELECT SUM(SalarioTrabajador) as SumaTotal
FROM Trabajadores;
go

--3
SELECT
    Proyecto.NombreProyecto AS NombreProyecto,
    COUNT(ProyectosAsignados.TrabajadorID) AS NumeroTrabajadores
FROM
    Proyecto
JOIN
    ProyectosAsignados ON Proyecto.ProyectoID = ProyectosAsignados.ProyectoID
GROUP BY
    Proyecto.NombreProyecto, Proyecto.ProyectoID;
go

-- 4
SELECT *
FROM Proyecto
WHERE TotalProyecto = (SELECT MAX(TotalProyecto) FROM Proyecto);
go

SELECT *
FROM Proyecto
WHERE TotalProyecto = (SELECT MIN(TotalProyecto) FROM Proyecto);
go

-- 5
select TrabajadorID, NombreTrabajador, Cargo, SalarioTrabajador from Trabajadores



/*select * from ComponentesElectronicos
go

ALTER TABLE ProveerComponentes
DROP CONSTRAINT fk_ProveedoresComponentes_ProveerComponentes2;*/