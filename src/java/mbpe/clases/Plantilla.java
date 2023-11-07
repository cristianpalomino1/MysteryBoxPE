package mbpe.clases;

public class Plantilla {
    private int id_plantilla;
    private String nombre_plantilla;
    private double precio;
    private String categoria;
    private int capacidad;

    public Plantilla() {
    }

    public Plantilla(double precio, String categoria, int capacidad) {
        this.nombre_plantilla = "Mystery Box Default";
        this.precio = precio;
        this.categoria = categoria;
        this.capacidad = capacidad;
    }

    public int getId_plantilla() {
        return id_plantilla;
    }

    public void setId_plantilla(int id_plantilla) {
        this.id_plantilla = id_plantilla;
    }

    public String getNombre() {
        return nombre_plantilla;
    }

    public double getPrecio() {
        return precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setNombre_plantilla(String nombre_plantilla) {
        this.nombre_plantilla = nombre_plantilla;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }
    
    
}
