package Modelo;

public class Programa {
    
    private int idPrograma;
    private String nombre;
    private int cantDescargas;
    private boolean estaHabilitado;
    private int idAlumno;

    public Programa() {
    }

    public Programa(int idPrograma, String nombre, int cantDescargas, boolean estaHabilitado, int idAlumno) {
        this.idPrograma = idPrograma;
        this.nombre = nombre;
        this.cantDescargas = cantDescargas;
        this.estaHabilitado = estaHabilitado;
        this.idAlumno = idAlumno;
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

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }
    
}
