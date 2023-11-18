package mbpe.dao;

import java.util.List;
import mbpe.clases.Plantilla;

public interface DAOPlantilla {

    public List<Plantilla> PlantillaList();

    Plantilla PlantillaSelect(Integer id);

    void PlantillaInsert(Plantilla Plantilla);

    void PlantillaDelete(Integer id);

    void PlantillaUpdate(Plantilla Plantilla);
}
