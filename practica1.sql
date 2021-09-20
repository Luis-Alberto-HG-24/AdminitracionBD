CREATE DATABASE  IF NOT EXISTS practica1;
USE practica1;
DROP DATABASE practica1;
CREATE TABLE  IF NOT EXISTS datosPersonales (id INT(50)UNSIGNED AUTO_INCREMENT ,
											apellidoP VARCHAR(50),
                                            apellidoM VARCHAR(50),
                                            Nombre VARCHAR(50)NOT NULL,
                                            fechaNac DATE NOT NULL,
                                            sexo CHAR,
                                            email VARCHAR(50),
                                            telefono INT(50),
                                            fechaRegistro DATETIME,
                                            PRIMARY KEY (id))engine=InnoDB; 
                                            
CREATE TABLE IF NOT EXISTS direccion (id_dir INT(50)UNSIGNED AUTO_INCREMENT, 
									  pais VARCHAR(50),
                                      estado VARCHAR(50),
                                      calle VARCHAR(50),
                                      noExt INT(10),
									  FOREIGN KEY (id_dir) REFERENCES datosPersonales (id))engine=InnoDB;
                                      
INSERT INTO datosPersonales (apellidoP, apellidoM, Nombre, fechaNac, sexo, email, telefono,fechaRegistro)	VALUES
							('Hernandez','Gutierrez', 'Luis', '2001-03-24', 'M', 'luishg@gmail.com','551245786',now()),
                            ('Martinez','Perez','Jose','2000-12-27','M','josePM@hotmail.com','556352418',now()),
                            ('Benites','Perez','Carlos','1999-05-28','M','BPcarlos@gmail.com','554286149',now()),
                            ('Fernandez','Lara','Axel','2002-02-15','M','LaraAxel@gmail.com','551246918',now()),
                            ('Martinez','Barcenas','Brandon','2003-09-19','M','manzana@gmail.com','55219063',now()),
                            ('Ayala','Rivera','Alan','1995-04-24','M','ARA@gmail.com','58629010',now()),
                            ('Caballero','Lopez','Juan','2000-06-28','M','JuanCL@gmail.com','55469137',now()),
                            ('Jimenez','Rodriguez','Raul','2001-11-25','M','RaulRJ@gmail.com','51248160',now()),
                            ('Sony','Hashimoto','Pikachu','2004-12-30','M','Casta@gmail.com','55632910',now()),
                            ('Panasonic','Iki','Toyota','2002-01-12','M','PITY@gmail.com','55169010',now()),
                            
                            ('Cabello','Lara','Ximena','2001-06-05','F','XimenaCL@gmail.com','55743956',now()),
                            ('Hernandez','Flores','Laura','1999-09-06','F','FloresL@gmail.com','51426080',now()),
                            ('Martinez','Villalpando','Abigail','1998-05-16','F','AbiMV@gmail.com','55421763',now()),
                            ('Montes','Perez','Martha','2002-02-28','F','MMP@gmail.com','52481751',now()),
                            ('Gutierrez','Caballero','Nancy','1973-07-18','F','NancyGC@gmail.com','55402541',now()),
                            ('Hernandez','Gutierrez','Daniela','2003-06-26','F','DaniHG@gmail.com','55148090',now()),
                            ('Hernandez','Montes','Citlaly','2001-10-21','F','HMCitlaly@gmail.com','55124018',now()),
                            ('Marquez','Montes','Giselle','1998-05-14','F','GiselleMontes@gmail.com','154963',now()),
                            ('Kishimoto','Paul','Lena','2001-06-09','F','LenaPaul@gmail.com','54525359',now()),
                            ('Mitsubiishi','Toyota','Samsung','2000-12-21','F','Samsung@gmail.com','51632980',now());
                            
                            
INSERT INTO direccion (pais, estado, calle, noExt) VALUES  ('Mexico','CDMX','Nicolas Bravo','12'),      			('Argentina','Buenos Aires','chichimulca','455'),                    
														   ('Mexico','Monterrey','Asada','188'),					('Argentina','Rio Negro','perezsosa','144'),
                                                           ('Mexico','Chiapas','Nopal','144'),						('España','Andorra','Ballena','41'),
                                                           ('Mexico','Veracruz','Ballena','54'),					('España','Andalucia','Zapata','45'),
                                                           ('Brasil','Rio de Janerio','Cocodrilo','124'),			('España','Galicia','Juarez','78'),
                                                           ('Brasil','espiritu Santo','San antonio','1444'),		('España','Comunidad de Madrid','Gran España','444'),
                                                           ('Brasil','Maranhão','Chipocludo','132993'),				('Japon','Tokyo','Shibuya','41'),
                                                           ('Brasil','Mato Grosso','okidoki','1526'),				('Japon','Okinawa','mitsubishi','78'),
                                                           ('Argentina','Buenos Aires','tilin','145'),				('Japon','Kyushu','Sonic','23'),
                                                           ('Argentina','Córdoba','Petuña','14'),					('Japon','Shikoku','Toyota','55');
                                                           

## Consultas  ------------------------------------------------------------------------

## 3
SELECT concat_ws(' ',datosPersonales.apellidoP , datosPersonales.apellidoM , datosPersonales.Nombre)
		AS Nombre , concat_ws(' ' ,direccion.pais, direccion.estado, direccion.calle, direccion.noExt)
        AS Direccion FROM datosPersonales INNER JOIN direccion ON datosPersonales.id = direccion.id_dir; 

## 4
SELECT concat_ws(' ',datosPersonales.apellidoP , datosPersonales.apellidoM , datosPersonales.Nombre)
		AS Nombre , concat_ws(' ' ,direccion.pais, direccion.estado, direccion.calle, direccion.noExt)
        AS Direccion FROM datosPersonales INNER JOIN direccion ON datosPersonales.id = direccion.id_dir ORDER BY datosPersonales.apellidoP; 
        
## 5
SELECT concat_ws(' ',datosPersonales.apellidoP , datosPersonales.apellidoM , datosPersonales.Nombre)
		AS Nombre , concat_ws(' ' ,direccion.pais, direccion.estado, direccion.calle, direccion.noExt)
        AS Direccion FROM datosPersonales INNER JOIN direccion ON datosPersonales.id = direccion.id_dir GROUP BY direccion.pais; 
        
        
 ## 6
 SELECT count(*) FROM datosPersonales WHERE sexo = 'F';       
 
 ## 7
SELECT concat_ws(' ',datosPersonales.apellidoP , datosPersonales.apellidoM , datosPersonales.Nombre)
		AS Nombre , concat_ws(' ' ,direccion.pais, direccion.estado, direccion.calle, direccion.noExt)
        AS Direccion FROM datosPersonales INNER JOIN direccion ON datosPersonales.id = direccion.id_dir AND direccion.pais = 'Mexico';