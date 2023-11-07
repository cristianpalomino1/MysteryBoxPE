package mbpe.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mbpe.clases.Plantilla;
import mbpe.dao.DAOPlantilla;
import mbpe.util.Conexion;

public class DaoPlantillaImpl implements DAOPlantilla {

    Connection conexion;
    String mensaje;

    public DaoPlantillaImpl() {
        Conexion con = new Conexion();
        conexion = con.getConexion();
    }

    @Override
    public List<Plantilla> PlantillaSelect() {
        List<Plantilla> list = null;
        String sql;
        sql = "SELECT * FROM plantillas";
        try {
            PreparedStatement ps = conexion.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            list = new ArrayList<>();
            while (rs.next()) {
                Plantilla Plantilla = new Plantilla();
                Plantilla.setId_plantilla(rs.getInt(1));
                Plantilla.setNombre_plantilla(rs.getString(2));
                Plantilla.setPrecio(rs.getDouble(3));
                Plantilla.setCategoria(rs.getString(4));
                Plantilla.setCapacidad(rs.getInt(5));

                list.add(Plantilla);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.toString());
            return null;
        }
        return list;
    }

    @Override
    public Plantilla PlantillaGet(Integer id) {
        String sql;
        sql = "SELECT * FROM plantillas WHERE id_plantilla = ?";
        try {
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            Plantilla plantilla = new Plantilla();
            while (rs.next()) {
                plantilla.setId_plantilla(rs.getInt(1));
                plantilla.setNombre_plantilla(rs.getString(2));
                plantilla.setPrecio(rs.getDouble(3));
                plantilla.setCategoria(rs.getString(4));
                plantilla.setCapacidad(rs.getInt(5));
            }
            return plantilla;
        } catch (SQLException e) {
            return null;
        }
    }
}
