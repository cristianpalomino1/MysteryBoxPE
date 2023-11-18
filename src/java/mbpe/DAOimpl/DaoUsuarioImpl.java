/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mbpe.DAOimpl;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import mbpe.clases.Usuario;
import mbpe.util.Conexion;

/**
 *
 * @author Alex
 */
public class DaoUsuarioImpl implements mbpe.dao.DAOusuario {

    private String mensaje;
    Conexion conexion = new Conexion();

    public DaoUsuarioImpl() {
    }

    @Override
    public List<Usuario> UsuarioList() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Usuario UsuarioSelect(Integer id) {
        Usuario usuario = new Usuario();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT ")
                .append("id_usuario,")
                .append("nombres,")
                .append("apellidos,")
                .append("dni,")
                .append("correo,")
                .append("username,")
                .append("telefono")
                .append("contraseña")
                .append("id_direccion")
                .append(" FROM usuario WHERE id_usuario = ?");
        try (Connection cn = conexion.getConexion()) {
            PreparedStatement ps = cn.prepareStatement(sql.toString());
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario.setId(rs.getInt(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellidos(rs.getString(3));
                    usuario.setDni(rs.getInt(4));
                    usuario.setCorreo(rs.getString(5));
                    usuario.setUsername(rs.getString(6));
                    usuario.setTelefono(rs.getInt(7));
                    usuario.setContraseña(rs.getString(8));
                    usuario.setId_direccion(rs.getInt(9));
                    System.out.println(usuario.getUsername());
                } else {
                    usuario = null;
                }
            } catch (SQLException e) {
                mensaje = e.getMessage();
            }
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return usuario;
    }

    @Override
    public void UsuarioInsert(Usuario Usuario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void UsuarioDelete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void UsuarioUpdate(Usuario Usuario) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
