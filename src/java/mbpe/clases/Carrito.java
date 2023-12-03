package mbpe.clases;

/**
 *
 * @author Alex
 */
public class Carrito {

    //datos de plantilla
    private int id_plantilla;
    private String nombre_plantilla;
    private String categoria_plantilla;
    private int capacidad_plantilla;
    private double precio_plantilla;

    //datos de personalización y contenido
    String mensaje;
    int id_skin;
    int id_contenido;
    //datos de cantidad
    private int cantidad;

    public Carrito() {
    }

    public void vaciarClase() {
        id_plantilla = 0;
        nombre_plantilla = "";
        categoria_plantilla = "";
        capacidad_plantilla = 0;
        precio_plantilla = 0;
        //datos de personalización y contenido
        mensaje = "";
        id_skin = 0;
        id_contenido = 0;
        //datos de cantidad
        cantidad = 0;
    }

    public int getId_plantilla() {
        return id_plantilla;
    }

    public void setId_plantilla(int id_plantilla) {
        this.id_plantilla = id_plantilla;
    }

    public String getNombre_plantilla() {
        return nombre_plantilla;
    }

    public void setNombre_plantilla(String nombre_plantilla) {
        this.nombre_plantilla = nombre_plantilla;
    }

    public String getCategoria_plantilla() {
        return categoria_plantilla;
    }

    public void setCategoria_plantilla(String categoria_plantilla) {
        this.categoria_plantilla = categoria_plantilla;
    }

    public int getCapacidad_plantilla() {
        return capacidad_plantilla;
    }

    public void setCapacidad_plantilla(int capacidad_plantilla) {
        this.capacidad_plantilla = capacidad_plantilla;
    }

    public double getPrecio_plantilla() {
        return precio_plantilla;
    }

    public void setPrecio_plantilla(double precio_plantilla) {
        this.precio_plantilla = precio_plantilla;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
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

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
