
package mbpe.clases;

public class Box_Venta {

    String mensaje;
    int id_plantilla;
    int id_skin;
    int id_contenido;
    
    public Box_Venta() {
        
    }

    public Box_Venta(String mensaje, int id_plantilla, int id_skin, int id_contenido) {
        this.mensaje = mensaje;
        this.id_plantilla = id_plantilla;
        this.id_skin = id_skin;
        this.id_contenido = id_contenido;
    }
    
    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getId_plantilla() {
        return id_plantilla;
    }

    public void setId_plantilla(int id_plantilla) {
        this.id_plantilla = id_plantilla;
    }

    public int getId_skin() {
        return id_skin;
    }

    public void setId_skin(int id_skin) {
        this.id_skin = id_skin;
    }

    public int getId_contenido() {
        return id_contenido;
    }

    public void setId_contenido(int id_contenido) {
        this.id_contenido = id_contenido;
    }
    
}
