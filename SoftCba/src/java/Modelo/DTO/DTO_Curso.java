package Modelo.DTO;

public class DTO_Curso {
    
    private int idCurso;
    private String nombre;
    private int duracion;
    private String materia;

    public DTO_Curso() {
    }

    public DTO_Curso(int idCurso, String nombre, int duracion, String materia) {
        this.idCurso = idCurso;
        this.nombre = nombre;
        this.duracion = duracion;
        this.materia = materia;
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

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }
    
}
