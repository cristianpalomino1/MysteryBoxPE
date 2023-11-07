/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package mbpe.DAOimpl;

import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import mbpe.clases.Usuario;
import mbpe.dao.DAOlogin;
import mbpe.util.Conexion;

/**
 *
 * @author Alex
 */
public class DaoLoginImpl implements DAOlogin {
    
    Usuario user = Usuario.ObtenerUser();
    Conexion conexion = new Conexion();
    CallableStatement cs = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql;
    boolean flag;
    String auxiliar;
    
    @Override
    public boolean VerificarUser(String username, String contraseña) {
        sql = "SELECT contraseña FROM usuario WHERE username = ?";
        try {
            Connection cn = conexion.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                String contraseñaAux = rs.getString("contraseña");
                // Comparar la contraseña almacenada con la contraseña ingresada
                flag = contraseñaAux.equals(contraseña);
                return flag;
            }
        } catch (Exception e) {
            flag = false;
            System.out.println("error de conexion");
        }
        System.out.println("prueba terminada");
        return flag;
    }

    @Override
    public void RegistrarUser(String correo, String username, String contraseña) {
        Connection cn = conexion.getConexion();
        try {
            String procedureCall = "{call mbpe.CrearUsuario(?, ?, ?)}";
            cs = cn.prepareCall(procedureCall);
            cs.setString(1, correo);
            cs.setString(2, username);
            cs.setString(3, contraseña);
            cs.execute();
            System.out.println("Usuario registrado correctamente.");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error al registrar el usuario. Usuario o correo ya existentes");
        } finally {
            try {
                // Cerrar recursos
                if (cs != null) {
                    cs.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.err.println("Error al cerrar conexion." + e);
            }
        }
        System.out.println("prueba terminada");

    }
    public boolean logOut(){
        user.setConectado(false);
        user.setContraseña(null);
        user.setUsername(null);
        user.setApellidos(null);
        user.setNombre(null);
        user.setDni(0);
        user.setId(0);
        user.setId_direccion(0);
        user.setCorreo(null);
        return false;
    }

}
