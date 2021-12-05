-- crear base de datos y conectarse

postgres=# create DATABASE posts;
CREATE DATABASE
postgres=# \c posts
Ahora está conectado a la base de datos «posts» con el usuario «administrador».


-- crear tabla

posts=# CREATE TABLE post(id SERIAL, usuario VARCHAR(25), fecha DATE, contenido VARCHAR(200), descripcion VARCHAR(200));
CREATE TABLE

-- agregar los post

posts=# INSERT INTO post (usuario, fecha, contenido, descripcion) VALUES ('Pamela', '2021-12-01', 'hello world', 'post 1'); INSERT INTO post (usuario, fecha, contenido, descripcion) VALUES ('Pamela', '2021-12-02', 'lorem ipsum', 'post 2'); INSERT INTO post (usuario, fecha, contenido, descripcion) VALUES ('Carlos', '2021-12-01', 'dolor sit ametd', 'post 3');
INSERT 0 1
INSERT 0 1
INSERT 0 1
posts=# SELECT * FROM post;
 id | usuario |   fecha    |    contenido    | descripcion
----+---------+------------+-----------------+-------------
  1 | Pamela  | 2021-12-01 | hello world     | post 1
  2 | Pamela  | 2021-12-02 | lorem ipsum     | post 2
  3 | Carlos  | 2021-12-01 | dolor sit ametd | post 3
(3 filas)

-- añadir columna título

posts=# alter table post add titulo VARCHAR(50);
ALTER TABLE

-- insertar títulos

posts=# UPDATE post SET titulo = 'hello' WHERE id = 1; UPDATE post SET titulo = 'lorem1' WHERE id = 2; UPDATE post SET titulo = 'lorem2' WHERE id = 3;
UPDATE 1
UPDATE 1
UPDATE 1
posts=# SELECT * FROM post;
 id | usuario |   fecha    |    contenido    | descripcion | titulo
----+---------+------------+-----------------+-------------+--------
  1 | Pamela  | 2021-12-01 | hello world     | post 1      | hello
  2 | Pamela  | 2021-12-02 | lorem ipsum     | post 2      | lorem1
  3 | Carlos  | 2021-12-01 | dolor sit ametd | post 3      | lorem2
(3 filas)

-- insertar posts pedro

posts=# INSERT INTO post (usuario, fecha, contenido, descripcion, titulo) VALUES ('Pedro', '2021-11-30', 'consectetur adipiscing elit', 'post 4', 'lorem3'); INSERT INTO post (usuario, fecha, contenido, descripcion, titulo) VALUES ('Pedro', '2021-11-29', 'Mauris commodo vestibulum rhoncus', 'post 5', 'lorem4');
INSERT 0 1
INSERT 0 1
posts=# SELECT * FROM post;
 id | usuario |   fecha    |             contenido             | descripcion | titulo
----+---------+------------+-----------------------------------+-------------+--------
  1 | Pamela  | 2021-12-01 | hello world                       | post 1      | hello
  2 | Pamela  | 2021-12-02 | lorem ipsum                       | post 2      | lorem1
  3 | Carlos  | 2021-12-01 | dolor sit ametd                   | post 3      | lorem2
  4 | Pedro   | 2021-11-30 | consectetur adipiscing elit       | post 4      | lorem3
  5 | Pedro   | 2021-11-29 | Mauris commodo vestibulum rhoncus | post 5      | lorem4
(5 filas)

-- eliminar post Carlos

posts=# DELETE from post WHERE id = 3;
DELETE 1
posts=# SELECT * FROM post;
 id | usuario |   fecha    |             contenido             | descripcion | titulo
----+---------+------------+-----------------------------------+-------------+--------
  1 | Pamela  | 2021-12-01 | hello world                       | post 1      | hello
  2 | Pamela  | 2021-12-02 | lorem ipsum                       | post 2      | lorem1
  4 | Pedro   | 2021-11-30 | consectetur adipiscing elit       | post 4      | lorem3
  5 | Pedro   | 2021-11-29 | Mauris commodo vestibulum rhoncus | post 5      | lorem4
(4 filas)

-- insertar post carlos 

posts=# INSERT INTO post (usuario, fecha, contenido, descripcion, titulo) VALUES ('Carlos', '2021-11-25', 'Donec a mi vel', 'post 6', 'lorem5');
INSERT 0 1
posts=# SELECT * FROM post;
 id | usuario |   fecha    |             contenido             | descripcion | titulo
----+---------+------------+-----------------------------------+-------------+--------
  1 | Pamela  | 2021-12-01 | hello world                       | post 1      | hello
  2 | Pamela  | 2021-12-02 | lorem ipsum                       | post 2      | lorem1
  4 | Pedro   | 2021-11-30 | consectetur adipiscing elit       | post 4      | lorem3
  5 | Pedro   | 2021-11-29 | Mauris commodo vestibulum rhoncus | post 5      | lorem4
  6 | Carlos  | 2021-11-25 | Donec a mi vel                    | post 6      | lorem5
(5 filas)

-- asignar cualidad unica a id

posts=# ALTER TABLE post ADD PRIMARY KEY(id);
ALTER TABLE

-- crear tabla comentario

posts=# CREATE TABLE comentarios(id SERIAL, fecha DATE, hora TIME, contenido VARCHAR(200), FOREIGN KEY (id) REFERENCES post(id));
CREATE TABLE

-- insertar comentarios pamela 

posts=# INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('1','2021-12-02','09:00:00','Nunc vitae dignissim nisl'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('1','2021-12-02','09:30:00','eget pretium nunc');
INSERT 0 1
INSERT 0 1
posts=# SELECT * FROM comentarios;
 id |   fecha    |   hora   |         contenido
----+------------+----------+---------------------------
  1 | 2021-12-02 | 09:00:00 | Nunc vitae dignissim nisl
  1 | 2021-12-02 | 09:30:00 | eget pretium nunc
(2 filas)

--insertar comentarios carlos

posts=# INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('6','2021-11-25','09:00:00','Integer non urna consectetur'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('6','2021-11-25','09:30:00','viverra lectus non'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('6','2021-11-25','10:00:00','efficitur massa'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('6','2021-11-25','10:30:00','Nam sed pretium');
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
posts=# SELECT * FROM comentarios;
 id |   fecha    |   hora   |          contenido
----+------------+----------+------------------------------
  1 | 2021-12-02 | 09:00:00 | Nunc vitae dignissim nisl
  1 | 2021-12-02 | 09:30:00 | eget pretium nunc
  6 | 2021-11-25 | 09:00:00 | Integer non urna consectetur
  6 | 2021-11-25 | 09:30:00 | viverra lectus non
  6 | 2021-11-25 | 10:00:00 | efficitur massa
  6 | 2021-11-25 | 10:30:00 | Nam sed pretium
(6 filas)

--crear posts Margarita

posts=# INSERT INTO post (usuario, fecha, contenido, descripcion, titulo) VALUES ('Margarita', '2021-11-27', 'Nunc rhoncus', 'post 7', 'lorem6');
INSERT 0 1
posts=# SELECT * FROM post;
 id |  usuario  |   fecha    |             contenido             | descripcion | titulo
----+-----------+------------+-----------------------------------+-------------+--------
  1 | Pamela    | 2021-12-01 | hello world                       | post 1      | hello
  2 | Pamela    | 2021-12-02 | lorem ipsum                       | post 2      | lorem1
  4 | Pedro     | 2021-11-30 | consectetur adipiscing elit       | post 4      | lorem3
  5 | Pedro     | 2021-11-29 | Mauris commodo vestibulum rhoncus | post 5      | lorem4
  6 | Carlos    | 2021-11-25 | Donec a mi vel                    | post 6      | lorem5
  7 | Margarita | 2021-11-27 | Nunc rhoncus                      | post 7      | lorem6
(6 filas)

-- crear comentarios margarita

posts=# INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('7','2021-11-27','09:00:00','est ac interdum finibus'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('7','2021-11-27','09:30:00','ligula justo fringilla nunc'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('7','2021-11-27','10:00:00','eu volutpat arcu tellus at quam'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('7','2021-11-27','10:30:00','Morbi aliquam auctor nunc'); INSERT INTO comentarios(id,fecha,hora,contenido) VALUES ('7','2021-11-25','10:30:00','Nam sed pretium');
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
INSERT 0 1
posts=# SELECT * FROM comentarios;
 id |   fecha    |   hora   |            contenido
----+------------+----------+---------------------------------
  1 | 2021-12-02 | 09:00:00 | Nunc vitae dignissim nisl
  1 | 2021-12-02 | 09:30:00 | eget pretium nunc
  6 | 2021-11-25 | 09:00:00 | Integer non urna consectetur
  6 | 2021-11-25 | 09:30:00 | viverra lectus non
  6 | 2021-11-25 | 10:00:00 | efficitur massa
  6 | 2021-11-25 | 10:30:00 | Nam sed pretium
  7 | 2021-11-27 | 09:00:00 | est ac interdum finibus
  7 | 2021-11-27 | 09:30:00 | ligula justo fringilla nunc
  7 | 2021-11-27 | 10:00:00 | eu volutpat arcu tellus at quam
  7 | 2021-11-27 | 10:30:00 | Morbi aliquam auctor nunc
  7 | 2021-11-25 | 10:30:00 | Nam sed pretium
(11 filas)

