-- -----------------------------------------------------
-- DATA BASE GIMNASIO
-- -----------------------------------------------------

CREATE DATABASE Gimnasio
USE Gimnasio ;

-- -----------------------------------------------------
-- Table Historial
-- -----------------------------------------------------


CREATE TABLE  Historial (
  idHistorial INT NOT NULL,
  Id_Usuario INT NULL,
  Id_UsuarioPrem INT NULL,
  PRIMARY KEY (idHistorial),
  CONSTRAINT FK_IdUsuario_Usuario_Historial
    FOREIGN KEY (Id_Usuario)
    REFERENCES Usuarios (idUsuarios)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_IdUsuarioPrem_UsuarioPrem_Historial
    FOREIGN KEY (Id_UsuarioPrem)
    REFERENCES Usuario_Premium (Id_Usuario_Perso)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table Inicio_Sesion
-- -----------------------------------------------------


CREATE TABLE Inicio_Sesion (
  Correo VARCHAR(150) NOT NULL,
  Contraseña VARCHAR(150) NOT NULL,
)

ALTER TABLE Inicio_Sesion
ADD CONSTRAINT FK_Correo_Usuarios_InicioSesion
FOREIGN KEY (Correo, Contraseña)
REFERENCES Usuarios (Correo, Contraseña)
ON DELETE NO ACTION
ON UPDATE NO ACTION;




-- -----------------------------------------------------
-- Table Planes_Alimenticios
-- -----------------------------------------------------


CREATE TABLE  Planes_Alimenticios (
  idPlanes_Alimenticios INT NOT NULL,
  Tipo_Comida VARCHAR(45) NOT NULL,
  Comida VARCHAR(45) NOT NULL,
  Cant_Comida FLOAT NOT NULL,
  Tabla_Comida VARCHAR(45) NOT NULL,
  PRIMARY KEY (idPlanes_Alimenticios))



-- -----------------------------------------------------
-- Table Planes Ejercicio
-- -----------------------------------------------------


CREATE TABLE  Planes_Ejercicio (
  idPlanes_Ejercicio INT NOT NULL,
  Tipo_Ejercicio VARCHAR(45) NOT NULL,
  Quema_Grasa INT NOT NULL,
  Ganancia_Muscular INT NOT NULL,
  Id_PlanEjercicio INT NOT NULL,
  PRIMARY KEY (idPlanes_Ejercicio))



-- -----------------------------------------------------
-- Table Podio
-- -----------------------------------------------------


CREATE TABLE Podio (
  Id_Podio INT NOT NULL,
  Id_Progreso INT NOT NULL,

  CONSTRAINT FK_IdProgre_Progresos_Podio
    FOREIGN KEY (Id_Progreso)
    REFERENCES Progresos (idProgresos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

ALTER TABLE Usuario_Premium
ADD Id_Usuario_Person INT NOT NULL;

ALTER TABLE Podio
ADD CONSTRAINT FK_IdUsua_UsuaPrem_Podio
FOREIGN KEY (Id_Usuario_Person)
REFERENCES Usuario_Premium (Id_Usuario_Person)
ON DELETE NO ACTION
ON UPDATE NO ACTION;



DROP TABLE Podio


-- -----------------------------------------------------
-- Table Progresos
-- -----------------------------------------------------


CREATE TABLE  Progresos (
  idProgresos INT NOT NULL,
  Id_UsuaPerso INT NOT NULL,
  Peso FLOAT NOT NULL,
  Grasa FLOAT NOT NULL,
  Fuerza FLOAT NOT NULL,
  Id_Podio INT NOT NULL,
  PRIMARY KEY (idProgresos),
  CONSTRAINT FK_IdUsuaPerson_UsuarioPremium_Progresos
    FOREIGN KEY (Id_UsuaPerso)
    REFERENCES Usuario_Premium (Id_Usuario_Perso)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

DROP TABLE Progresos


-- -----------------------------------------------------
-- Table Rutinas
-- -----------------------------------------------------
;

CREATE TABLE Rutinas (
  Id_Rutina INT NOT NULL,
  Rutina_L VARCHAR(45) NOT NULL,
  Imagen_Rutina VARBINARY(MAX) NULL,
  Fecha_Rutina DATE NULL,
  Id_Usuario INT NOT NULL,
  PRIMARY KEY (Id_Rutina),
  CONSTRAINT FK_IdUsuario_Usuarios_Rutinas
    FOREIGN KEY (Id_Usuario)
    REFERENCES Usuarios (idUsuarios)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);



DROP TABLE Rutinas



-- -----------------------------------------------------
-- Table Usuario Premium
-- -----------------------------------------------------


CREATE TABLE  Usuario_Premium (
  Id_Usuario_Perso INT NOT NULL,
  Id_Usuario INT NOT NULL,
  Id_PlanAlimen INT NOT NULL,
  Id_PlanEjerc INT NOT NULL,
  Meta FLOAT NOT NULL,
  Id_Podio INT NOT NULL,
  Nombre_Comp VARCHAR(45) NOT NULL,
  Edad_Perso INT NOT NULL,
  PRIMARY KEY (Id_Usuario_Perso),
  CONSTRAINT FK_IdUsuario_UsuarioPremium_Usuario
    FOREIGN KEY (Id_Usuario)
    REFERENCES Usuarios(idUsuarios)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_PlanAlimenticio_PlanAlimenticio_UsuarioPremium
    FOREIGN KEY (Id_PlanAlimen)
    REFERENCES Planes_Alimenticios (idPlanes_Alimenticios)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_PlanEjer_PlanEjercicios_UsuarioPremium
    FOREIGN KEY (Id_PlanEjerc)
    REFERENCES Planes_Ejercicio (idPlanes_Ejercicio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)



-- -----------------------------------------------------
-- Table Usuarios
-- -----------------------------------------------------


CREATE TABLE  Usuarios (
  idUsuarios INT NOT NULL,
  Nombre VARCHAR(100) NOT NULL,
  Apellido_Pat VARCHAR(100) NOT NULL,
  Apellido_Mat VARCHAR(100) NOT NULL,
  Peso FLOAT NULL,
  Estatura FLOAT NULL,
  Edad INT NOT NULL,
  Correo VARCHAR(150) NOT NULL,
  Contraseña VARCHAR(150) NOT NULL,
  PRIMARY KEY (idUsuarios)
  )
  
ALTER TABLE Usuarios
ADD CONSTRAINT UC_CorreoContraseña UNIQUE (Correo, Contraseña);


DROP TABLE Usuarios