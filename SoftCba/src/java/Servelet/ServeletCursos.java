package Servelet;

import Gestor.GestorCursos;
import Gestor.GestorMaterias;
import Modelo.Curso;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Cursos", urlPatterns = {"/Cursos"})
public class ServeletCursos extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String usuario = (String) request.getSession().getAttribute("user");    
            String modo = request.getParameter("modo");
            GestorCursos gc = new GestorCursos();
            GestorMaterias gm = new GestorMaterias();
                                  
            if (modo == null) 
            {
                if (usuario != null && !usuario.equals("")) 
                {                           
                    request.setAttribute("listadoCursos", gc.obtenerCursosDTO());                                      
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoCursos.jsp");
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
                request.setAttribute("listadoMaterias", gm.obtenerMaterias());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registrarCurso.jsp");
                rd.forward(request, response);
            }
            else if (modo.equals("editar")) 
            {
                int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                Curso c = gc.obtenerCurso(idCurso);
                request.setAttribute("curso", c);          
                request.setAttribute("listadoMaterias", gm.obtenerMaterias());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/editarCurso.jsp");
                rd.forward(request, response);
            }
            else if (modo.equals("eliminar"))
            {
                int idCurso = Integer.parseInt(request.getParameter("idCurso"));
                gc.eliminarCurso(idCurso);          
                request.setAttribute("listadoCursos", gc.obtenerCursosDTO());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoCursos.jsp");
                rd.forward(request, response);
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        GestorCursos gc = new GestorCursos();
        Curso c = new Curso();
        
        c.setIdCurso(Integer.parseInt(request.getParameter("txtIdCurso")));
        c.setNombre(request.getParameter("txtNombre"));
        c.setDuracion(Integer.parseInt(request.getParameter("txtDuracion")));
        c.setIdMateria(Integer.parseInt(request.getParameter("cmbMateria")));
               
        if(c.getIdCurso() == 0)
        {
            gc.agregarCurso(c);
        }
        else
        {
            gc.actualizarCurso(c);
        }        
        
        request.setAttribute("listadoCursos", gc.obtenerCursosDTO());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoCursos.jsp");
        rd.forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}