-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS control_asistencia;
USE control_asistencia;

-- Tabla de Roles
-- Almacena los diferentes roles de usuario en el sistema
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rol_nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de Usuarios
-- Almacena la información de todos los usuarios del sistema
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL, -- Longitud adecuada para hashes seguros
    rol_id INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (rol_id) REFERENCES roles(id),
    INDEX idx_dni (dni),
    INDEX idx_correo (correo)
);

-- Tabla de Asistencia
-- Registra la asistencia diaria de los usuarios
CREATE TABLE asistencia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_entrada TIMESTAMP NOT NULL,
    hora_salida TIMESTAMP,
    estado ENUM('Presente', 'Falta', 'Tarde') NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    UNIQUE (usuario_id, fecha),
    INDEX idx_fecha (fecha)

);

-- Tabla de Notificaciones
-- Almacena notificaciones para los usuarios
CREATE TABLE notificaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    mensaje TEXT NOT NULL,
    leido BOOLEAN DEFAULT FALSE,
    fecha_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    INDEX idx_usuario_fecha (usuario_id, fecha_envio)
);

-- Tabla de Tipos de Eventos
-- Categoriza los diferentes tipos de eventos en el sistema
CREATE TABLE tipos_eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- Tabla de Eventos
-- Almacena información sobre eventos programados
CREATE TABLE eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_evento_id INT NOT NULL,
    evento_nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_evento DATE NOT NULL,
    hora_inicio TIME,
    hora_fin TIME,
    organizador_id INT,
    FOREIGN KEY (tipo_evento_id) REFERENCES tipos_eventos(id),
    FOREIGN KEY (organizador_id) REFERENCES usuarios(id),
    INDEX idx_fecha_evento (fecha_evento)
);

-- Tabla de Comentarios
-- Permite a los usuarios dejar comentarios sobre otros usuarios (ej. docentes)
CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    docente_id INT,
    comentario TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (docente_id) REFERENCES usuarios(id),
    INDEX idx_docente_fecha (docente_id, fecha)
);

-- Tabla de Llegada de Profesores
-- Registra específicamente la llegada de los profesores
CREATE TABLE llegada_profesor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora_llegada TIMESTAMP NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES usuarios(id),
    UNIQUE (profesor_id, fecha),
    INDEX idx_fecha (fecha)
);

-- Tabla de Configuraciones
-- Almacena configuraciones generales del sistema
CREATE TABLE configuraciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clave VARCHAR(50) UNIQUE NOT NULL,
    valor TEXT,
    descripcion VARCHAR(255),
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla de Historial de Cambios de Usuarios
-- Registra cambios importantes en los datos de los usuarios
CREATE TABLE historial_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    campo_modificado VARCHAR(50) NOT NULL,
    valor_anterior TEXT,
    valor_nuevo TEXT,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    INDEX idx_usuario_fecha (usuario_id, fecha_modificacion)
);

-- Inserción de roles básicos
INSERT INTO roles (rol_nombre, descripcion) VALUES
('admin', 'Administrador del sistema'),
('profesor', 'Docente'),
('alumno', 'Estudiante');

-- Inserción de tipos de eventos básicos
INSERT INTO tipos_eventos (nombre, descripcion) VALUES
('Clase', 'Sesión regular de clase'),
('Examen', 'Evaluación programada'),
('Reunión', 'Reunión administrativa o académica');

-- Inserción de configuraciones iniciales
INSERT INTO configuraciones (clave, valor, descripcion) VALUES
('hora_entrada_normal', '08:00:00', 'Hora de entrada estándar'),
('tolerancia_tardanza', '15', 'Minutos de tolerancia antes de marcar tardanza');