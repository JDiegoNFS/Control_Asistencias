-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS control_asistencias;

-- Usar la base de datos
USE control_asistencias;

-- Crear tabla roles
CREATE TABLE IF NOT EXISTS roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Crear tabla usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    fecha_registro DATE NOT NULL,
    id_rol INT,
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

-- Crear tabla asistencia
CREATE TABLE IF NOT EXISTS asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha DATE NOT NULL,
    hora_entrada TIME NOT NULL,
    hora_salida TIME,
    estado ENUM('Presente', 'Falta', 'Tarde') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Crear tabla comentarios
CREATE TABLE IF NOT EXISTS comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_alumno INT,
    id_usuario_docente INT,
    comentario TEXT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_usuario_alumno) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_usuario_docente) REFERENCES usuarios(id_usuario)
);

-- Crear tabla eventos
CREATE TABLE IF NOT EXISTS eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha DATE NOT NULL
);

-- Crear tabla evento_usuario
CREATE TABLE IF NOT EXISTS evento_usuario (
    id_evento INT,
    id_usuario INT,
    rol VARCHAR(50),
    PRIMARY KEY (id_evento, id_usuario),
    FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Crear tabla notificaciones
CREATE TABLE IF NOT EXISTS notificaciones (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    mensaje TEXT NOT NULL,
    fecha_envio DATE NOT NULL,
    estado ENUM('Leída', 'No leída') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
