select * from usuario;
select * from direccion;

ALTER TABLE usuario auto_increment = 1;
ALTER TABLE direccion auto_increment = 1;


drop PROCEDURE CrearUsuario;
drop PROCEDURE VerificarContraseña;

delimiter //
CREATE PROCEDURE CrearUsuario(IN correo VARCHAR(45), IN username VARCHAR(45), IN contraseña VARCHAR(100))
BEGIN
INSERT INTO direccion(departamento,distrito,direccion,referencias)
values('', '', '', '');
set @nuevo_id_direccion= LAST_INSERT_ID();
INSERT INTO usuario(correo, username, contraseña, id_direccion)
values(correo, username, contraseña, @nuevo_id_direccion); 
END//
delimiter ;

DELIMITER //
CREATE PROCEDURE VerificarContraseña(IN usernameA VARCHAR(45), IN contraseña_ingresada VARCHAR(100), OUT resultado INT)
BEGIN
  DECLARE contraseña_bd VARBINARY(100);
  -- Obtener la contraseña almacenada en la base de datos para el usuario dado
  SELECT contraseña INTO contraseña_bd FROM usuario WHERE username = usernameA;

  -- Verificar si la contraseña ingresada coincide con la contraseña almacenada
  IF contraseña_bd IS NULL THEN
    -- El usuario no existe
    SET resultado = -1;
  ELSEIF contraseña_bd = AES_ENCRYPT(contraseña_ingresada, 'clave') THEN
    -- La contraseña es correcta
    SET resultado = 1;
  ELSE
    -- La contraseña es incorrecta
    SET resultado = 0;
  END IF;
END//
DELIMITER ;

call CrearUsuario('christianso@gmail.com', 'tusobrinito12', '12345');

select cast(aes_decrypt(contraseña, 'clave') as char) from usuario where id_usuario=1;
select aes_encrypt("123", 'clave');
call VerificarContraseña('tusobrinito12','12345', @resultado); 
call VerificarContraseña('alex','1223', @resultado); 
select @resultado;


create view plantillas as
select bp.id_plantilla, bp.nombre_plantilla,bp.precio, cat.nombre_categoria, cap.capacidad
from box_plantilla bp
inner join categoria cat on bp.id_categoria=cat.id_categoria
inner join capacidad cap on bp.id_capacidad=cap.id_capacidad;
SELECT * FROM plantillas;


