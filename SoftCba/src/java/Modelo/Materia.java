package Modelo;

public class Materia {
    
    private int idMateria;
    private String descripcion;

    public Materia() {
    }

    public Materia(int idMateria, String descripcion) {
        this.idMateria = idMateria;
        this.descripcion = descripcion;
    }

    public int getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
