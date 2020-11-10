package Servelet;

import Gestor.GestorAlumnos;
import Gestor.GestorProgramas;
import Modelo.Programa;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "Programas", urlPatterns = {"/Programas"})
@MultipartConfig(   fileSizeThreshold = 1024 * 1024,
                                maxFileSize = 1024 * 1024 * 5,
                                maxRequestSize = 1024 * 1024 * 5 * 5,
                                location = "D:\\Carpeta  Datos\\Documentos\\NetBeansProjects\\SoftCba\\web\\Archivos")

public class ServeletProgramas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String modo = request.getParameter("modo");
            GestorProgramas gp = new GestorProgramas();
            GestorAlumnos ga = new GestorAlumnos();

            if (modo == null)
            {

            request.setAttribute("listadoProgramas", gp.obtenerProgramasNombreAlumno());
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoProgramas.jsp");
            rd.forward(request, response);

             } 
            else if (modo.equals("alta"))
            {
             request.setAttribute("listadoAlumnos", ga.obtenerNombreCompletoAlumnosDTO());   
             RequestDispatcher rd = getServletContext().getRequestDispatcher("/registrarPrograma.jsp");
             rd.forward(request, response);

            } 
            else if (modo.equals("editar")) 
            {
                int idPrograma = Integer.parseInt(request.getParameter("idPrograma"));
                Programa p = gp.obtenerPrograma(idPrograma);
                request.setAttribute("programa", p);          
                request.setAttribute("listadoAlumnos", ga.obtenerNombreCompletoAlumnosDTO());   
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/editarPrograma.jsp");
                rd.forward(request, response);
            }
            else if (modo.equals("eliminar"))
            {
                int idPrograma = Integer.parseInt(request.getParameter("idPrograma"));
                gp.eliminarPrograma(idPrograma);          
                request.setAttribute("listadoProgramas", gp.obtenerProgramasNombreAlumno());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoProgramas.jsp");
                rd.forward(request, response);
            } 
            else if (modo.equals("descargar"))
            {
                int idPrograma = Integer.parseInt(request.getParameter("idPrograma"));
                Programa p = gp.obtenerPrograma(idPrograma);
                p.setCantDescargas(p.getCantDescargas() + 1);
                gp.actualizarPrograma(p);             
                request.setAttribute("programa", p);
                request.setAttribute("listadoProgramas", gp.obtenerProgramasNombreAlumno());
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoProgramas.jsp");
                rd.forward(request, response);
            }
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        GestorProgramas gp = new GestorProgramas();
        Programa s = new Programa();
            
        s.setIdPrograma(Integer.parseInt(request.getParameter("txtIdPrograma")));
        s.setNombre(request.getParameter("txtNombre"));
        s.setIdAlumno(Integer.parseInt(request.getParameter("cmbAlumnos")));
        s.setCantDescargas(Integer.parseInt(request.getParameter("txtCantDescargas")));
        if (request.getParameter("chkEstaHabilitado") != null) {
             s.setEstaHabilitado(true);
        } else s.setEstaHabilitado(false);
        
        
//        for (Part part: request.getParts()) {            
//            String fileName = getFileName(part);         
//            if (!fileName.isEmpty())             
//                part.write(fileName);                          
//        }
        
        if (s.getIdPrograma() == 0)
        {
            gp.agregarPrograma(s);
        }
        else
        {
            gp.actualizarPrograma(s);
        }
        
        request.setAttribute("listadoProgramas", gp.obtenerProgramasNombreAlumno());
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/listadoProgramas.jsp");
        rd.forward(request, response);
        
    }
    
    private String getFileName (Part part){
        
        for (String content :  part.getHeader("content-disposition").split(" ; ")) {
            
            if (content.trim().startsWith("filename")) {
                
                return content.substring(content.indexOf(" = ") + 2, content.length() - 1);
            }        
            
        }
        
        return " ";
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
