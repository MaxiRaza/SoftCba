package Servelet;

import Gestor.GestorAlumnos;
import Gestor.GestorBarrios;
import Modelo.Alumno;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Alumnos", urlPatterns = {"/Alumnos"})
public class ServeletAlumnos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String usuario = (String) request.getSession().getAttribute("user");
            String modo = request.getParameter("modo");
            GestorAlumnos ga = new GestorAlumnos();
            GestorBarrios b = new GestorBarrios();    

            if (modo == null) 
            {
                if (usuario != null && !usuario.equals(""))
                {                
                    request.setAttribute("listadoAlumnos", ga.obtenerAlumnosDTO());
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoAlumnos.jsp");
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
                request.setAttribute("accion", "Registrar");         
                request.setAttribute("listadoBarrios", b.obtenerBarrios());                                   
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registrarAlumno.jsp");
                rd.forward(request, response);
            }
            else if (modo.equals("editar")) 
            {
                request.setAttribute("accion", "Editar");
                int idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
                Alumno a = ga.obtenerAlumno(idAlumno);
                request.setAttribute("alumno", a);          
                request.setAttribute("listadoBarrios", b.obtenerBarrios());                                  
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/editarAlumno.jsp");
                rd.forward(request, response);
            }
            else if (modo.equals("eliminar"))
            {
                int idAlumno = Integer.parseInt(request.getParameter("idAlumno"));
                ga.eliminarAlumno(idAlumno);          
                request.setAttribute("listadoAlumnos", ga.obtenerAlumnosDTO());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoAlumnos.jsp");
                rd.forward(request, response);
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        GestorAlumnos ga = new GestorAlumnos();
        Alumno a = new Alumno();
        
        a.setIdAlumno(Integer.parseInt(request.getParameter("txtIdAlumno")));
        a.setLegajo(Integer.parseInt(request.getParameter("txtLegajo")));
        a.setNombre(request.getParameter("txtNombre"));
        a.setApellido(request.getParameter("txtApellido"));
        a.setFechaNac(request.getParameter("txtFechaNac"));
        a.setCalle(request.getParameter("txtCalle"));
        a.setNumero(Integer.parseInt(request.getParameter("txtNumero")));
        a.setTelefono(request.getParameter("txtTelefono"));
        a.setCorreo(request.getParameter("txtCorreo"));
        a.setIdBarrio(Integer.parseInt(request.getParameter("cmbBarrio")));
               
        
        if(a.getIdAlumno() == 0)
        {
            ga.agregarAlumno(a);
        }
        else
        {
            ga.actualizarAlumno(a);
        }
        
               
        request.setAttribute("listadoAlumnos", ga.obtenerAlumnosDTO());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoAlumnos.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}