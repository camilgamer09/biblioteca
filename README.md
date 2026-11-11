# 📚 Base de Datos: Biblioteca

Este repositorio contiene el diseño y el script de implementación para una base de datos relacional sencilla llamada **Biblioteca**, diseñada para gestionar un catálogo de libros, sus respectivos autores y las casas editoriales.

---

## 📁 Archivos del Proyecto

* **`Biblioteca.sql`**: Script SQL completo que incluye la creación de la base de datos, definición de tablas con sus llaves primarias y foráneas, inserción de datos de prueba y una consulta de verificación (`INNER JOIN`).
* **`biblioteca.jpg`**: Diagrama Entidad-Relación (DER) que ilustra visualmente la estructura de las tablas y sus relaciones.

---

## 🖼️ Diagrama Entidad-Relación

![Diagrama de la Base de Datos Biblioteca](biblioteca.jpg)

---

## 🗂️ Estructura de la Base de Datos

La base de datos utiliza el motor `InnoDB` y la codificación `utf8mb4` para soportar caracteres especiales (como tildes y eñes). Consta de tres tablas principales:

### 1. Tabla `Autores`
Almacena la información de los escritores.

| Campo | Tipo | Restricciones | Descripción |
| :--- | :--- | :--- | :--- |
| `ID_Autor` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Identificador único del autor. |
| `Nombre_Autor` | `VARCHAR(150)` | `NOT NULL` | Nombre completo del autor. |

### 2. Tabla `Editores`
Almacena las editoriales encargadas de publicar los libros.

| Campo | Tipo | Restricciones | Descripción |
| :--- | :--- | :--- | :--- |
| `ID_Editor` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Identificador único de la editorial. |
| `Nombre_Editor` | `VARCHAR(150)` | `NOT NULL` | Nombre de la editorial. |

### 3. Tabla `Libros`
Tabla central que relaciona los títulos de los libros con su autor y editorial correspondiente.

| Campo | Tipo | Restricciones | Descripción |
| :--- | :--- | :--- | :--- |
| `ID_Libro` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Identificador único del libro. |
| `Titulo_Libro` | `VARCHAR(200)` | `NOT NULL` | Título de la obra. |
| `ID_Autor` | `INT` | `FOREIGN KEY`, `NOT NULL` | Referencia a `Autores(ID_Autor)`. |
| `ID_Editor` | `INT` | `FOREIGN KEY`, `NOT NULL` | Referencia a `Editores(ID_Editor)`. |

---

## 🔗 Relaciones e Integridad Referencial

* **Autores a Libros (1:N):** Un autor puede escribir varios libros, pero cada registro de libro en este modelo está asociado a un único autor (`FK_Libros_Autores`).
* **Editores a Libros (1:N):** Una editorial puede publicar varios libros, pero cada registro de libro está asociado a una única editorial (`FK_Libros_Editores`).
* **Políticas de Integridad:** Ambas llaves foráneas cuentan con:
  * `ON DELETE RESTRICT`: Impide borrar un autor o editorial si tiene libros asociados.
  * `ON UPDATE CASCADE`: Si cambia el ID del autor o editorial, se actualiza automáticamente en la tabla de libros.

---

## 🚀 Cómo utilizar este proyecto

### Requisitos previos
Necesitas tener instalado un Sistema Gestor de Bases de Datos compatible con MySQL o MariaDB (por ejemplo: XAMPP, MySQL Workbench, DBeaver, phpMyAdmin, etc.).

### Instrucciones de instalación

1. **Clonar o descargar** los archivos de este repositorio en tu máquina local.
2. **Abrir tu gestor de base de datos** o terminal de MySQL.
3. **Ejecutar el script `Biblioteca.sql`**:
   * **Desde terminal:** `mysql -u tu_usuario -p < Biblioteca.sql`
   * **Desde una interfaz gráfica (MySQL Workbench / phpMyAdmin):** Abre el archivo `Biblioteca.sql`, selecciona todo el código y ejecútalo.

---

## 📊 Datos de Ejemplo y Consulta

El script inserta automáticamente obras clásicas de la literatura latinoamericana y ejecuta al final una consulta `SELECT` con `INNER JOIN` para mostrar la información consolidada:

| ID_Libro | Titulo_Libro | Nombre_Autor | Nombre_Editor |
| :---: | :--- | :--- | :--- |
| 1 | Cien años de soledad | Gabriel García Márquez | Editorial Sudamericana |
| 2 | El amor en los tiempos del cólera | Gabriel García Márquez | Editorial Sudamericana |
| 3 | La ciudad y los perros | Mario Vargas Llosa | Alfaguara |
| 4 | La casa de los espíritus | Isabel Allende | Penguin Random House |
