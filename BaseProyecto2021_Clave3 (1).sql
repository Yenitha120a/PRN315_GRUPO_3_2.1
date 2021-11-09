USE [baseproyecto]
GO

-- tables
-- Table: categoria
CREATE TABLE categoria (
    categoria_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    nombre varchar(50)  NOT NULL,
    activo int  NOT NULL DEFAULT 1,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT categoria_pk PRIMARY KEY  (categoria_id)
);

-- Table: categoria_pelicula
CREATE TABLE categoria_pelicula (
    pelicula_id numeric(19,0)  NOT NULL,
    categoria_id numeric(19,0)  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT categoria_pelicula_pk PRIMARY KEY  (pelicula_id,categoria_id)
);

-- Table: inventario
CREATE TABLE inventario (
    inventario_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    pelicula_id numeric(19,0)  NOT NULL,
    cantidad int  NOT NULL,
    fecha_ingreso datetime  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT inventario_pk PRIMARY KEY  (inventario_id)
);

-- Table: lenguaje
CREATE TABLE lenguaje (
    lenguaje_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    nombre varchar(50)  NOT NULL,
    activo int  NOT NULL DEFAULT 1,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT lenguaje_pk PRIMARY KEY  (lenguaje_id)
);

-- Table: pelicula
CREATE TABLE pelicula (
    pelicula_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    tienda_id numeric(19,0)  NOT NULL,
    lenguaje_id numeric(19,0)  NOT NULL,
    titulo varchar(100)  NOT NULL,
    descripcion varchar(255) ,
    anio_produccion int  NOT NULL,
    duracion int  NOT NULL,
    precio decimal(14,2)  NOT NULL,
    clasificacion varchar(3)  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT pelicula_pk PRIMARY KEY  (pelicula_id)
);

-- Table: proveedor
CREATE TABLE proveedor (
    proveedor_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    proveedor varchar(100)  NOT NULL,
    activo int  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT proveedor_pk PRIMARY KEY  (proveedor_id)
);

-- Table: tienda
CREATE TABLE tienda (
    tienda_id numeric(19,0)  NOT NULL IDENTITY(1, 1),
    proveedor_id numeric(19,0)  NOT NULL,
    nombre varchar(50)  NOT NULL,
    telefono numeric(8,0)  NOT NULL,
    fecha_creacion datetime  NOT NULL,
    CONSTRAINT tienda_pk PRIMARY KEY  (tienda_id)
);

-- foreign keys
-- Reference: categoria_pelicula_categoria (table: categoria_pelicula)
ALTER TABLE categoria_pelicula ADD CONSTRAINT categoria_pelicula_categoria
    FOREIGN KEY (categoria_id)
    REFERENCES categoria (categoria_id);

-- Reference: categoria_pelicula_pelicula (table: categoria_pelicula)
ALTER TABLE categoria_pelicula ADD CONSTRAINT categoria_pelicula_pelicula
    FOREIGN KEY (pelicula_id)
    REFERENCES pelicula (pelicula_id);

-- Reference: inventario_pelicula (table: inventario)
ALTER TABLE inventario ADD CONSTRAINT inventario_pelicula
    FOREIGN KEY (pelicula_id)
    REFERENCES pelicula (pelicula_id);

-- Reference: pelicula_lenguaje (table: pelicula)
ALTER TABLE pelicula ADD CONSTRAINT pelicula_lenguaje
    FOREIGN KEY (lenguaje_id)
    REFERENCES lenguaje (lenguaje_id);

-- Reference: pelicula_tienda (table: pelicula)
ALTER TABLE pelicula ADD CONSTRAINT pelicula_tienda
    FOREIGN KEY (tienda_id)
    REFERENCES tienda (tienda_id);

-- Reference: tienda_proveedor (table: tienda)
ALTER TABLE tienda ADD CONSTRAINT tienda_proveedor
    FOREIGN KEY (proveedor_id)
    REFERENCES proveedor (proveedor_id);

-- End of file.

GO

INSERT INTO [dbo].[lenguaje] ([nombre],[activo],[fecha_creacion]) VALUES ('Inglés', 1, GETDATE())
INSERT INTO [dbo].[lenguaje] ([nombre],[activo],[fecha_creacion]) VALUES ('Español', 1, GETDATE())
INSERT INTO [dbo].[lenguaje] ([nombre],[activo],[fecha_creacion]) VALUES ('Frances', 1, GETDATE())

GO

INSERT INTO [dbo].[categoria] ([nombre],[activo],[fecha_creacion]) VALUES ('Aventura', 1, GETDATE())
INSERT INTO [dbo].[categoria] ([nombre],[activo],[fecha_creacion]) VALUES ('Comedia', 1, GETDATE())
INSERT INTO [dbo].[categoria] ([nombre],[activo],[fecha_creacion]) VALUES ('Dramá', 1, GETDATE())
INSERT INTO [dbo].[categoria] ([nombre],[activo],[fecha_creacion]) VALUES ('Terror', 1, GETDATE())
INSERT INTO [dbo].[categoria] ([nombre],[activo],[fecha_creacion]) VALUES ('Ciencia Ficción', 1, GETDATE())
INSERT INTO [dbo].[categoria] ([nombre],[activo],[fecha_creacion]) VALUES ('Romance', 1, GETDATE())

GO

INSERT INTO [dbo].[proveedor] ([proveedor],[activo],[fecha_creacion]) VALUES ('Disney', 1, GETDATE())
INSERT INTO [dbo].[proveedor] ([proveedor],[activo],[fecha_creacion]) VALUES ('Fox', 1, GETDATE())
INSERT INTO [dbo].[proveedor] ([proveedor],[activo],[fecha_creacion]) VALUES ('Sony', 1, GETDATE())
INSERT INTO [dbo].[proveedor] ([proveedor],[activo],[fecha_creacion]) VALUES ('Warner', 1, GETDATE())
INSERT INTO [dbo].[proveedor] ([proveedor],[activo],[fecha_creacion]) VALUES ('Universal', 1, GETDATE())
INSERT INTO [dbo].[proveedor] ([proveedor],[activo],[fecha_creacion]) VALUES ('Paramount', 1, GETDATE())

GO

INSERT INTO [dbo].[tienda] ([proveedor_id],[nombre],[telefono],[fecha_creacion]) VALUES (1,'Cineteca Nacional',41551200, GETDATE())
INSERT INTO [dbo].[tienda] ([proveedor_id],[nombre],[telefono],[fecha_creacion]) VALUES (2,'La Casa del Cine',52576969, GETDATE())
INSERT INTO [dbo].[tienda] ([proveedor_id],[nombre],[telefono],[fecha_creacion]) VALUES (3,'Cine Tonalá',16250623, GETDATE())

GO

INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (1,1,'El rey león','Pelicula animada',1994,125,15.99,'AA',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (1,1,'Piratas del Caribe',NULL,2017,132,24.95,'B15',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (1,2,'Black Widow',NULL,2021,134,19.99,'B',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (2,1,'La era de Hielo','',2002,81,15.99,'AA',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (2,2,'Deadpool',NULL,2016,90,24.99,'B',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (2,2,'Avatar','',2009,162,24.99,'B15',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (3,2,'El Hombre Araña 2','',2004,67,14.95,'AA',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (3,1,'Después de la Tierra','',2013,100,17.99,'B',GETDATE())
INSERT INTO [dbo].[pelicula]([tienda_id],[lenguaje_id],[titulo],[descripcion],[anio_produccion],[duracion],[precio],[clasificacion],[fecha_creacion])
VALUES (3,1,'Bajo el mismo cielo','',2015,105,15.99,'B',GETDATE())

GO

INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (1,1,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (1,2,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (2,1,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (2,5,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (3,1,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (3,5,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (4,1,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (5,1,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (5,2,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (5,5,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (6,1,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (6,5,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (7,1,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (7,3,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (8,3,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (8,5,GETDATE())
INSERT INTO [dbo].[categoria_pelicula] ([pelicula_id],[categoria_id],[fecha_creacion]) VALUES (9,6,GETDATE())

GO


INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (1, 14, '2021-07-08', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (1, 24, '2021-08-14', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (2, 20, '2021-01-31', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (2, 12, '2021-03-14', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (2, 18, '2021-05-12', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (3, 30, '2021-08-15', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (3, 24, '2021-08-24', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (3, 12, '2021-09-14', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (4, 14, '2021-04-12', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (5, 14, '2021-05-14', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (5, 23, '2021-06-01', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (6, 18, '2021-04-18', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (7, 26, '2021-03-03', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (7, 18, '2021-09-12', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (8, 12, '2021-06-06', GETDATE())
INSERT INTO [dbo].[inventario]([pelicula_id],[cantidad],[fecha_ingreso],[fecha_creacion]) VALUES (9, 10, '2021-07-05', GETDATE())

GO
