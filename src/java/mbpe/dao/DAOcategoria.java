package mbpe.dao;

import java.util.List;
import mbpe.clases.Categoria;

public interface DAOcategoria {

    public List<Categoria> CategoriaList();
    Categoria CategoriaSelect(Integer id);

    void CategoriaInsert(Categoria Categoria);

    void CategoriaDelete(Integer id);

    void CategoriaUpdate(Categoria Categoria);
    
}
