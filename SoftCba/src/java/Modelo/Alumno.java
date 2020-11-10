package Modelo;

public class Alumno {
    
    private int idAlumno;
    private int legajo;
    private String nombre;
    private String apellido;
    private String fechaNac;
    private String calle;
    private int numero;
    private String telefono;
    private String correo;
    private int idBarrio;

    public Alumno() {
    }
    
    public Alumno(int idAlumno, int legajo, String nombre, String apellido, String fechaNac, String calle, int numero, String telefono, String correo, int idBarrio) {
        this.idAlumno = idAlumno;
        this.legajo = legajo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNac = fechaNac;
        this.calle = calle;
        this.numero = numero;
        this.telefono = telefono;
        this.correo = correo;
        this.idBarrio = idBarrio;
    }

    public int getIdAlumno() {
        return idAlumno;
    }

    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    public int getLegajo() {
        return legajo;
    }

    public void setLegajo(int legajo) {
        this.legajo = legajo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getIdBarrio() {
        return idBarrio;
    }

    public void setIdBarrio(int idBarrio) {
        this.idBarrio = idBarrio;
    }
          
}