
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

CREATE TABLE IF NOT EXISTS Autores (
    ID_Autor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Autor VARCHAR(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Editores (
    ID_Editor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Editor VARCHAR(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS Libros (
    ID_Libro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo_Libro VARCHAR(200) NOT NULL,
    ID_Autor INT NOT NULL,
    ID_Editor INT NOT NULL,
    CONSTRAINT FK_Libros_Autores FOREIGN KEY (ID_Autor) 
        REFERENCES Autores(ID_Autor) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CONSTRAINT FK_Libros_Editores FOREIGN KEY (ID_Editor) 
        REFERENCES Editores(ID_Editor) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO Autores (Nombre_Autor) VALUES
('Gabriel García Márquez'),
('Mario Vargas Llosa'),
('Isabel Allende');

INSERT INTO Editores (Nombre_Editor) VALUES
('Editorial Sudamericana'),
('Alfaguara'),
('Penguin Random House');

INSERT INTO Libros (Titulo_Libro, ID_Autor, ID_Editor) VALUES
('Cien años de soledad', 1, 1),
('El amor en los tiempos del cólera', 1, 1),
('La ciudad y los perros', 2, 2),
('La casa de los espíritus', 3, 3);


SELECT 
    L.ID_Libro,
    L.Titulo_Libro,
    A.Nombre_Autor,
    E.Nombre_Editor
FROM Libros L
INNER JOIN Autores A ON L.ID_Autor = A.ID_Autor
INNER JOIN Editores E ON L.ID_Editor = E.ID_Editor;