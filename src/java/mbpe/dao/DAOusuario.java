/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package mbpe.dao;

import java.sql.Blob;
import mbpe.clases.Usuario;

public interface DAOusuario {

    Usuario UsuarioGet(Integer id);         // SELECT * FROM WHERE
    String UsuarioUpdate (Usuario usuario);   // UPDATE
    String UsuarioInsert (Usuario usuario); //INSERT
    Boolean VerificarContraseña(Blob contraseña); //Verifica contraseña
    String getMensaje();
}
