package Modelo.DTO;

public class DTO_Inscripcion {
    
    private int idInscripcion;
    private String curso;
    private String alumno;
    private int legajo;
    private float descuento;
    private float monto;

    public DTO_Inscripcion() {
    }

    public DTO_Inscripcion(int idInscripcion, String curso, String alumno, int legajo, float descuento, float monto) {
        this.idInscripcion = idInscripcion;
        this.curso = curso;
        this.alumno = alumno;
        this.legajo = legajo;
        this.descuento = descuento;
        this.monto = monto;
    }

    public int getIdInscripcion() {
        return idInscripcion;
    }

    public void setIdInscripcion(int idInscripcion) {
        this.idInscripcion = idInscripcion;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getAlumno() {
        return alumno;
    }

    public void setAlumno(String alumno) {
        this.alumno = alumno;
    }

    public int getLegajo() {
        return legajo;
    }

    public void setLegajo(int legajo) {
        this.legajo = legajo;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }

    public float getMonto() {
        return monto;
    }

    public void setMonto(float monto) {
        this.monto = monto;
    }
    
}
