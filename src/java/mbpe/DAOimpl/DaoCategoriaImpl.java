package mbpe.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mbpe.clases.Categoria;
import mbpe.dao.DAOcategoria;
import mbpe.util.Conexion;

public class DaoCategoriaImpl implements DAOcategoria {

    Connection conexion;
    String mensaje;

    public DaoCategoriaImpl() {
        Conexion con = new Conexion();
        conexion = con.getConexion();
    }

    @Override
    public List<Categoria> CategoriaList() {
        List<Categoria> list = null;
        String sql;
        sql = "SELECT * FROM categoria";
        try {
            PreparedStatement ps = conexion.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                Categoria Categoria = new Categoria();

                Categoria.setId(rs.getInt(1));
                Categoria.setCategoria(rs.getString(2));
                list.add(Categoria);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar peliculas: " + e.toString());
            return null;
        }
        return list;
    }

    @Override
    public Categoria CategoriaSelect(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void CategoriaInsert(Categoria Categoria) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void CategoriaDelete(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void CategoriaUpdate(Categoria Categoria) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
