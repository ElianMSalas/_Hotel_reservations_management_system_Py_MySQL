CREATE DATABASE bd_hotel;
use bd_hotel;
CREATE TABLE habitaciones (
  id_hab int(11) NOT NULL primary key AUTO_INCREMENT,
  num_hab int(11) NOT NULL,
  cant_pas int(11) NOT NULL,
  ori_hab varchar(30) NOT NULL
);

CREATE TABLE cargos(
  id_car int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom_car varchar(30) NOT NULL
);


CREATE TABLE tipo_resp (
  id_resp int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom_resp varchar(255) NOT NULL
);

CREATE TABLE trabajadores (
  id_tra int(11) NOT NULL primary key AUTO_INCREMENT,
  rut_tra varchar(15) NOT NULL,
  nom_tra varchar(30) NOT NULL,
  ape_tra varchar(30) NOT NULL,
  id_car int,
  foreign key(id_car) references cargos(id_car)
);

CREATE TABLE pasajeros (
  id_pas int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  rut_pas varchar(15) NOT NULL,
  nom_pas varchar(30) NOT NULL,
  ape_pas varchar(30) NOT NULL,
  id_resp int(11) DEFAULT NULL, 
  FOREIGN KEY (id_resp) REFERENCES tipo_resp(id_resp)
);

CREATE TABLE reservas(
  id_res int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  fh_res timestamp NOT NULL DEFAULT current_timestamp(),
  id_hab int(11) DEFAULT NULL,
  id_pas int(11) DEFAULT NULL,
  id_tra int(11) DEFAULT NULL,
  FOREIGN KEY(id_hab) REFERENCES habitaciones(id_hab),
  FOREIGN KEY(id_pas) REFERENCES pasajeros(id_pas),
  FOREIGN KEY(id_tra) REFERENCES trabajadores(id_tra)
);
