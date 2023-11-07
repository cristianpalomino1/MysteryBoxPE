package mbpe.dao;

import java.util.List;
import mbpe.clases.Plantilla;

public interface DAOPlantilla {

    public List<Plantilla> PlantillaSelect();
    Plantilla PlantillaGet(Integer id);         // SELECT * FROM WHERE
}
