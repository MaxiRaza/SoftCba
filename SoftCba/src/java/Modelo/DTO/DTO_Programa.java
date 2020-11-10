package Modelo.DTO;

public class DTO_Programa {
    
    private int idPrograma;
    private String nombre;
    private int cantDescargas;
    private boolean estaHabilitado;
    private String alumno;

    public DTO_Programa() {
    }

    public DTO_Programa(int idPrograma, String nombre, int cantDescargas, boolean estaHabilitado, String alumno) {
        this.idPrograma = idPrograma;
        this.nombre = nombre;
        this.cantDescargas = cantDescargas;
        this.estaHabilitado = estaHabilitado;
        this.alumno = alumno;
    }

    public int getIdPrograma() {
        return idPrograma;
    }

    public void setIdPrograma(int idPrograma) {
        this.idPrograma = idPrograma;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantDescargas() {
        return cantDescargas;
    }

    public void setCantDescargas(int cantDescargas) {
        this.cantDescargas = cantDescargas;
    }

    public boolean isEstaHabilitado() {
        return estaHabilitado;
    }

    public void setEstaHabilitado(boolean estaHabilitado) {
        this.estaHabilitado = estaHabilitado;
    }

    public String getAlumno() {
        return alumno;
    }

    public void setAlumno(String alumno) {
        this.alumno = alumno;
    }
    
}
