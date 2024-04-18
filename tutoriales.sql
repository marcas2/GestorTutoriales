DROP DATABASE IF EXISTS tutoriales;
CREATE DATABASE tutoriales CHARACTER SET utf8mb4;
USE tutoriales;


CREATE TABLE categoria (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  categoria VARCHAR(100) NOT NULL
);

CREATE TABLE tutorial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  idCategoria INT UNSIGNED,
  URL text,
  estado VARCHAR (50) NOT NULL,
  prioridad INT NOT NULL,
  FOREIGN KEY (idCategoria) REFERENCES categoria(id) ON DELETE RESTRICT
);


INSERT INTO categoria VALUES(1, 'Logica de programacion');
INSERT INTO categoria VALUES(2, 'Flutter');
INSERT INTO categoria VALUES(3, 'Node.js');


DELIMITER //
CREATE PROCEDURE InsertarTutorial(
    IN nombre VARCHAR(100),
    IN prioridad INT,
    IN estado VARCHAR(100),
    IN idcategoria INT UNSIGNED,
    IN url text
)
BEGIN
    -- Insertar el tutorial con los datos proporcionados
    INSERT INTO tutorial (nombre, prioridad, estado, idCategoria, URL) VALUES (nombre,prioridad,estado, idcategoria, url);
END //
DELIMITER ;

CALL `tutoriales`.`InsertarTutorial`('PHP', 1, 'A', 1, 'url');

 INSERT INTO tutorial (nombre, idCategoria, URL, prioridad,estado) VALUES ('JAVA', 3, 'url-kjava', 1,'A');

/**select * from categoria;
select * from tutorial join categoria on categoria.id=tutorial.idcategoria;**/

SELECT * FROM tutorial join categoria on categoria.id=tutorial.idcategoria where tutorial.id=1 ;





