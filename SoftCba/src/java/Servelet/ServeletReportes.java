package Servelet;

import Gestor.GestorCursos;
import Gestor.GestorInscripciones;
import Gestor.GestorProgramas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Reportes", urlPatterns = {"/Reportes"})
public class ServeletReportes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        GestorCursos gc = new GestorCursos();
        GestorInscripciones gi = new GestorInscripciones();
        GestorProgramas gp = new GestorProgramas();
         
        request.setAttribute("listadoCursos", gc.obtenerCursos());     
        request.setAttribute("recaudacionTotal", gc.recaudacionTotalDTO());
        request.setAttribute("descuentosTotal", gi.descuentosTotalesDTO());       
        request.setAttribute("top5Programas", gp.top5Programas());
        request.setAttribute("alumnosDescuento", gi.alumnosConDescuento());
                                              
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/reportes.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        GestorCursos gc = new GestorCursos();
        GestorInscripciones gi = new GestorInscripciones();
        GestorProgramas gp = new GestorProgramas();
        
        request.setAttribute("recaudacionTotal", gc.recaudacionTotalDTO());
        request.setAttribute("descuentosTotal", gi.descuentosTotalesDTO());
        request.setAttribute("listadoCursos", gc.obtenerCursos());     
        request.setAttribute("top5Programas", gp.top5Programas());
        request.setAttribute("alumnosDescuento", gi.alumnosConDescuento());
        
        if ( request.getParameter("cmbCursos") != null) {
            int idCurso =  Integer.parseInt(request.getParameter("cmbCursos"));
             request.setAttribute("listaAlumnosCurso", gi.obtenerAlumnosDeCurso(idCurso)); 
             request.setAttribute("combo",  idCurso );
        }
            
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/reportes.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
