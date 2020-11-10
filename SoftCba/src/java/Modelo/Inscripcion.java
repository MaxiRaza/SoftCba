package Modelo;

public class Inscripcion {
    
    private int idIncripcion;
    private int idCurso;
    private int idAlumno;
    private float descuento;
    private float monto;

    public Inscripcion() {
    }

    public Inscripcion(int idIncripcion, int idCurso, int idAlumno, float descuento, float monto) {
        this.idIncripcion = idIncripcion;
        this.idCurso = idCurso;
        this.idAlumno = idAlumno;
        this.descuento = descuento;
        this.monto = monto;
    }

    public int getIdIncripcion() {
        return idIncripcion;
    }

    public void setIdIncripcion(int idIncripcion) {
        this.idIncripcion = idIncripcion;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
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
