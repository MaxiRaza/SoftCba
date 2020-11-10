package Modelo.DTO;

public class DTO_RecaudacionPorCurso {
    
    private String curso;
    private float importe;

    public DTO_RecaudacionPorCurso() {
    }

    public DTO_RecaudacionPorCurso(String curso, float importe) {
        this.curso = curso;
        this.importe = importe;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public float getImporte() {
        return importe;
    }

    public void setImporte(float importe) {
        this.importe = importe;
    }
    
}
