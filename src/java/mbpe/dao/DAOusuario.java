/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package mbpe.dao;

import java.util.List;
import mbpe.clases.Usuario;

public interface DAOusuario {

    public List<Usuario> UsuarioList();

    Usuario UsuarioSelect(Integer id);

    void UsuarioInsert(Usuario Usuario);

    void UsuarioDelete(Integer id);

    void UsuarioUpdate(Usuario Usuario);
}
