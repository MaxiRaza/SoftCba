package Servelet;

import Gestor.GestorAlumnos;
import Gestor.GestorCursos;
import Gestor.GestorInscripciones;
import Modelo.Inscripcion;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Inscripciones", urlPatterns = {"/Inscripciones"})
public class ServeletInscripciones extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = (String) request.getSession().getAttribute("user");  
        String modo = request.getParameter("modo");
        GestorInscripciones gi = new GestorInscripciones();
        GestorCursos gc = new GestorCursos();
        GestorAlumnos ga = new GestorAlumnos();
        
         if (modo == null)
         {
            if (usuario != null && !usuario.equals("")) 
                    {                           
                        request.setAttribute("listadoInscripciones", gi.obtenerInscripcionesDTO());                                      
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoInscripciones.jsp");
                        rd.forward(request, response);
                    }
                    else
                    {
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                        rd.forward(request, response);
                    }
         }
         else if (modo.equals("alta"))
         {
                request.setAttribute("listadoCursos", gc.obtenerCursos());
                request.setAttribute("listadoAlumnos", ga.obtenerNombreCompletoAlumnosDTO());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registrarInscripcion.jsp");
                rd.forward(request, response);
         }
         else if (modo.equals("eliminar"))
         {
                int idInscripcion = Integer.parseInt(request.getParameter("idInscripcion"));
                gi.eliminarInscripcion(idInscripcion);          
                request.setAttribute("listadoInscripciones", gi.obtenerInscripcionesDTO());                                      
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoInscripciones.jsp");
                rd.forward(request, response);
         }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        GestorInscripciones gi = new GestorInscripciones();
        Inscripcion i = new Inscripcion();
        
        i.setIdAlumno(Integer.parseInt(request.getParameter("cmbAlumnos")));
        i.setIdCurso(Integer.parseInt(request.getParameter("cmbCursos")));
        i.setMonto(Integer.parseInt(request.getParameter("txtMonto")));
        i.setDescuento(Integer.parseInt(request.getParameter("txtDescuento")));
               
         gi.agregarIncripcion(i);  
        
        request.setAttribute("listadoInscripciones", gi.obtenerInscripcionesDTO());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoInscripciones.jsp");
        rd.forward(request, response);
   
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
