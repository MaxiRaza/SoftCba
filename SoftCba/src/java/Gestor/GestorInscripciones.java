package Gestor;

import Modelo.DTO.DTO_Inscripcion;
import Modelo.Inscripcion;
import java.sql.*;      
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestorInscripciones {
    
    private Connection conexion;
    private String CONN = "jdbc:sqlserver://localhost:1433;databaseName=SoftCba";
    private String USER = "sa";
    private String PASS = "1234";
  
    private void abrirConexion()
    {
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion = DriverManager.getConnection(CONN, USER, PASS);
        }
        catch(Exception exc)
        {
            exc.printStackTrace();
        }
    }
    
    private void cerrarConexion()
    {
        try
        {
            if(conexion != null && !conexion.isClosed())
                conexion.close();
        }
        catch(Exception exc)
        {
            exc.printStackTrace();
        }
    }
    
    public void agregarIncripcion(Inscripcion i)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO Inscripciones (idCurso, idAlumno, descuento, monto) VALUES (?,?,?,?)");
            ps.setInt(1, i.getIdCurso());
            ps.setInt(2, i.getIdAlumno());
            ps.setFloat(3, i.getDescuento());
            ps.setFloat(4, i.getMonto());
            ps.executeUpdate(); 
            ps.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorInscripciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
       
    public ArrayList<Inscripcion> obtenerInscripciones()
    {
        ArrayList<Inscripcion> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT idInscripcion, idCurso, idAlumno, descuento, monto FROM Inscripciones");
            while(rs.next())
            {              
                Inscripcion i = new Inscripcion();
                i.setIdIncripcion(rs.getInt(1));
                i.setIdCurso(rs.getInt(2));
                i.setIdAlumno(rs.getInt(3));
                i.setDescuento(rs.getFloat(4));
                i.setMonto(rs.getFloat(5));                                                                     
                lista.add(i);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorInscripciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
    
    public ArrayList<DTO_Inscripcion> obtenerInscripcionesDTO()
    {
        ArrayList<DTO_Inscripcion> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT i.idInscripcion, c.nombre, a.legajo, a.nombre + ' ' + a.apellido, i.descuento, i.monto FROM Inscripciones i JOIN Cursos c ON i.idCurso = c.idCurso JOIN Alumnos a ON i.idAlumno = a.idAlumno");
            while(rs.next())
            {              
                DTO_Inscripcion i = new DTO_Inscripcion();
                i.setIdInscripcion(rs.getInt(1));
                i.setCurso(rs.getString(2));
                i.setLegajo(rs.getInt(3));
                i.setAlumno(rs.getString(4));
                i.setDescuento(rs.getFloat(5));
                i.setMonto(rs.getFloat(6));                                                                     
                lista.add(i);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorInscripciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
    
    public ArrayList<DTO_Inscripcion> alumnosConDescuento()
    {
        ArrayList<DTO_Inscripcion> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT DISTINCT a.nombre + ' ' + a.apellido 'Nombre', SUM (i.descuento) FROM Inscripciones i JOIN Alumnos a ON i.idAlumno = a.idAlumno WHERE i.descuento > 0 GROUP BY a.nombre + ' ' + a.apellido");
            while(rs.next())
            {              
                DTO_Inscripcion i = new DTO_Inscripcion();
                i.setAlumno(rs.getString(1));
                i.setDescuento(rs.getFloat(2));                                                                  
                lista.add(i);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorInscripciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }

    public float descuentosTotalesDTO()
    {
        float importe = 0;
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT SUM(descuento) FROM Inscripciones");
            if(rs.next())
            {              
               importe =   rs.getFloat(1);                                                              
            }
            rs.close();
            st.close();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorCursos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return importe;
    }
    
     public ArrayList<DTO_Inscripcion> obtenerAlumnosDeCurso(int idCurso)
    {
        ArrayList<DTO_Inscripcion> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("SELECT DISTINCT a.nombre + ' ' + a.apellido, c.nombre FROM Inscripciones i JOIN Cursos c ON i.idCurso = c.idCurso JOIN Alumnos a ON  i.idAlumno = a.IdAlumno WHERE c.idCurso = ?");
            ps.setInt(1, idCurso);           
            ResultSet st = ps.executeQuery();
            while(st.next())
            {              
                DTO_Inscripcion c = new DTO_Inscripcion();
                c.setAlumno(st.getString(1));
                c.setCurso(st.getString(2));
                lista.add(c);
            }
            ps.close();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorInscripciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
            
     public void eliminarInscripcion (int idInscripcion)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("DELETE Inscripciones WHERE idInscripcion = ?");
            ps.setInt(1, idInscripcion);
            ps.executeUpdate();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorInscripciones.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
}
