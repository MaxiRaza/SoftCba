package Modelo;

public class Curso {
    
    private int idCurso;
    private String nombre;
    private int duracion;
    private int idMateria;

    public Curso() {
    }

    public Curso(int idCurso, String nombre, int duracion, int idMateria) {
        this.idCurso = idCurso;
        this.nombre = nombre;
        this.duracion = duracion;
        this.idMateria = idMateria;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public int getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
    }
    
}
