package Servelet;

import Gestor.GestorUsuarios;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class ServeletLogin extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                                                     
       String modo = request.getParameter("modo");
       
       if (modo.equals("deslogeado"))
        {
            request.getSession().setAttribute("mostrar", "Iniciar Sesion");
            request.getSession().setAttribute("admin", null);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/inicio.jsp");
            rd.forward(request, response);
        } 
       else
       {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }     
                
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("txtUsuario");
        String contrasenia = request.getParameter("txtContrasenia");
        
        GestorUsuarios g = new GestorUsuarios();          
                
            if (g.obtenerUsuario(usuario,contrasenia))
            {
               request.getSession().setAttribute("user", usuario);
               request.getSession().setAttribute("admin", 1);
               request.getSession().setAttribute("mostrar", "Bienvenido " + usuario);
               RequestDispatcher rd = getServletContext().getRequestDispatcher("/inicio.jsp");
               rd.forward(request, response);
            } 
            else
            {
               request.setAttribute("mensajeError", "Usuario o contraseña incorrectos");
               RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
               rd.forward(request, response);
            }

    }
   
    @Override   
    public String getServletInfo() {
        return "Short description";
    }

}
