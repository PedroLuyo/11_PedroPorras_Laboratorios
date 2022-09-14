--Creamos la base de datos dbConferenceVG
CREATE DATABASE dbConferenceVG
GO

--Ponemos en uso la base de datos dbConferenceVG
USE dbConferenceVG
GO


--Creamos la tabla PARTICIPANTE
CREATE TABLE PARTICIPANTE (
    IDPAR int NOT NULL IDENTITY(1,1),
    FECREGPAR date NOT NULL DEFAULT GETDATE(),
    NOMPAR varchar(60)  NOT NULL,
	APEPAR varchar(80)  NOT NULL,
    DNIPAR char(8)  NOT NULL,
    TIPPAR char(1)  NOT NULL,
    CELPAR char(9)  NULL,
    EMAPAR varchar(90)  NOT NULL,
    DIRPAR varchar(90)  NULL,
	ESTPAR char(1)  NOT NULL,
    CONSTRAINT PARTICIPANTE_pk PRIMARY KEY(IDPAR)
);
GO

--Creamos la tabla PONENTE
CREATE TABLE PONENTE (
    CODPON char(5) NOT NULL,
    NOMPON varchar(60) NOT NULL,
    APEPON varchar(80)  NOT NULL,
    CELPON char(9)  NULL,
    DNIPON char(8)  NOT NULL,
    EMAPON varchar(90)  NULL,
    DIRPON varchar(90)  NOT NULL,
    CONSTRAINT PONENTE_pk PRIMARY KEY(CODPON)
);
GO

--Creamos la tabla CONFERENCIA
CREATE TABLE CONFERENCIA (
    CODCONF char(5) NOT NULL,
    TEMCONF varchar(90) NOT NULL,
    FECCONF date  NOT NULL,
    PONCONF char(5)  NOT NULL,
    CONSTRAINT CONFERENCIA_pk PRIMARY KEY(CODCONF)
);
GO


--Creamos la tabla REGISTRO
CREATE TABLE REGISTRO (
    CODREG char(5) NOT NULL,
	IDPAR int NOT NULL,
    FECREG date DEFAULT GETDATE(),
    CERTREG char(1)  NOT NULL,
    CONSTRAINT REGISTRO_pk PRIMARY KEY(CODREG)
);
GO

--Creamos la tabla REGISTRODETALLE
CREATE TABLE REGISTRODETALLE (
    IDREGDET int NOT NULL IDENTITY(1,1),
    CODREG char(5) NOT NULL,
    CODCONF char(5)  NOT NULL,
    CANTPART int  NOT NULL,
    CONSTRAINT REGISTRODETALLE_pk PRIMARY KEY(IDREGDET)
);
GO

ALTER TABLE REGISTRO ADD CONSTRAINT PARTICIPANTE_REGISTRO
	FOREIGN KEY (IDPAR)
	REFERENCES PARTICIPANTE(IDPAR)
GO

ALTER TABLE REGISTRODETALLE ADD CONSTRAINT REGISTRODETALLE_REGISTRO
	FOREIGN KEY (CODREG)
	REFERENCES REGISTRO(CODREG)
GO

ALTER TABLE REGISTRODETALLE ADD CONSTRAINT REGISTRODETALLE_CONFERENCIA
	FOREIGN KEY (CODCONF)
	REFERENCES CONFERENCIA(CODCONF)
GO

ALTER TABLE CONFERENCIA ADD CONSTRAINT CONFERENCIA_PONENTE
	FOREIGN KEY (PONCONF)
	REFERENCES PONENTE(CODPON)
GO


-- Insertamos datos a la tabla PARTICIPANTES

INSERT INTO PARTICIPANTE
(NOMPAR,APEPAR,DNIPAR,TIPPAR,CELPAR,EMAPAR,DIRPAR,ESTPAR)
VALUES
('Juan','Campos Pérez','40255133','1','986512478','juan.campos@vallegrande.edu.pe','Av.Miraflores','A'),
('sofia','Solano Ávila','64978531','1','974815258','sofia.solano@vallegrande.edu.pe','Jr.Huallaga','A'),
('María','Rosales Guerra','15925874','1','986532147','maria.rosales@vallegrande.edu.pe','Calle Girasoles','A'),
('Marcos','Alarcón Hermosa','48781512','2','','marcos.alarcon@vallegrande.edu.pe','','A'),
('Martín','Samán Arata','84152631','2','','martin.saman@vallegrande.edu.pe','Jr.La Unión','A'),
('José','Quispe Luyo','48161937','2','978415321','jose.quispe@vallegrande.edu.pe','Calle Abancay','A'),
('Claudia','Barraza Carrasco','78452596','3','','cbarraza@gmail.com','Jr.Las Gardenias','A'),
('Jhohana','Bendezú Anccasi','74321564','3','','jbendezu@yahoo.com','','A'),
('Mario','Acosta Palomino','15326499','3','931764521','mario.acosta@outlook.com','Av.Miraflores','A')
GO

SELECT * FROM PARTICIPANTE
GO

-- Insertamos datos a la tabla PONENTE
INSERT INTO PONENTE
(CODPON,NOMPON,APEPON,CELPON,DNIPON,EMAPON,DIRPON)
VALUES
('P0001','Alberto','Corrales Lozada','','15363798','alberto.corrales@yahoo.com','Calle Los Portales'),
('P0002','Juana','Sánchez Ortega','974815258','13256497','juana.sanchez@yahoo.com','Av.La Libertad'),
('P0003','Javier','Nakasone Villa','995236147','15953575','javier.nakasone@yahoo.com','Jr.San Martín'),
('P0004','Sonia','Huayta Medina','','12657814','sonia.huayta@yahoo.com','Av.Las Gardenias'),
('P0005','Fabiano','Carrión Ávila','','12233647','','Jr.Huancayo')
GO

SELECT * FROM PONENTE
GO

-- Insertamos datos a la tabla CONFERENCIA
INSERT INTO CONFERENCIA
(CODCONF,TEMCONF,FECCONF,PONCONF)
VALUES
('C0001','Gestion de datos con MySQL','2022/07/15','P0001'),
('C0002','Joins paso a paso','2022/07/16','P0002'),
('C0003','Consultas con parámentros','2022/07/17','P0003'),
('C0004','Administracion base de datos MySQL','2022/07/16','P0002'),
('C0005','Gestion de backups de Base de Datos','2022/07/15','P0004')
GO

SELECT * FROM CONFERENCIA
GO

-- Insertamos datos a la tabla REGISTRO
INSERT INTO REGISTRO
(CODREG,IDPAR,CERTREG)
VALUES
('R0001','1','S'),
('R0002','3','S'),
('R0003','4','S'),
('R0004','7','S'),
('R0005','2','N'),
('R0006','5','N'),
('R0007','6','N'),
('R0008','9','N')
GO

SELECT * FROM REGISTRO
GO

-- Insertamos datos a la tabla REGISTRODETALLE
INSERT INTO REGISTRODETALLE
(CODREG,CODCONF,CANTPART)
VALUES
('R0001','C0001','2'),
('R0001','C0002','1'),
('R0002','C0001','4'),
('R0002','C0003','1'),
('R0003','C0004','1'),
('R0004','C0005','2'),
('R0005','C0005','3'),
('R0005','C0003','2'),
('R0006','C0002','3'),
('R0006','C0003','4'),
('R0007','C0005','2'),
('R0007','C0003','6'),
('R0008','C0005','1')
GO

SELECT * FROM REGISTRODETALLE
GO

