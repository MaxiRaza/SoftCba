package Gestor;

import Modelo.Curso;
import Modelo.DTO.DTO_Curso;
import Modelo.DTO.DTO_RecaudacionPorCurso;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestorCursos {
    
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
    
    public void agregarCurso(Curso c)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO Cursos (nombre, duracion, idMateria) VALUES (?,?,?)");
            ps.setString(1, c.getNombre());
            ps.setInt(2, c.getDuracion());
            ps.setInt(3, c.getIdMateria());
            ps.executeUpdate(); 
            ps.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorCursos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
       
    public ArrayList<Curso> obtenerCursos()
    {
        ArrayList<Curso> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT idCurso, nombre, duracion, idMateria FROM Cursos");
            while(rs.next())
            {              
                Curso c = new Curso();
                c.setIdCurso(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setDuracion(rs.getInt(3));
                c.setIdMateria(rs.getInt(4));                                                                     
                lista.add(c);
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
        return lista;
    } 
    
    public ArrayList<DTO_Curso> obtenerCursosDTO()
    {
        ArrayList<DTO_Curso> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT c.idCurso, c.nombre, c. duracion, m.descripcion FROM Cursos c JOIN Materias m ON c.idMateria = m.idMateria");
            while(rs.next())
            {              
                DTO_Curso c = new DTO_Curso();
                c.setIdCurso(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setDuracion(rs.getInt(3));
                c.setMateria(rs.getString(4));                                                                     
                lista.add(c);
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
        return lista;
    }
    
    public ArrayList<DTO_RecaudacionPorCurso> recaudacionTotalDTO()
    {
        ArrayList<DTO_RecaudacionPorCurso> lista = new ArrayList<>();
         try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT SUM(i.monto - i.descuento),  c.nombre FROM Cursos c JOIN Inscripciones i ON c.idCurso = i.idCurso GROUP BY c.nombre");
            while(rs.next())
            {              
                DTO_RecaudacionPorCurso c = new DTO_RecaudacionPorCurso();              
                c.setImporte(rs.getFloat(1));   
                c.setCurso(rs.getString(2));
                lista.add(c);
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
        return lista;
    }
    
    public Curso obtenerCurso(int idCurso)
    {
        Curso c = null;
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("SELECT idCurso, nombre, duracion, idMateria FROM Cursos WHERE idCurso = ?");
            ps.setInt(1, idCurso);
            ResultSet st = ps.executeQuery();
            if(st.next())
            {              
                c = new Curso();
                c.setIdCurso(st.getInt(1));
                c.setNombre(st.getString(2));
                c.setDuracion(st.getInt(3));
                c.setIdMateria(st.getInt(4));                                                                     

            }
            ps.close();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorCursos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return c;
    }
    
    public void actualizarCurso(Curso c)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("UPDATE Cursos SET nombre = ?, duracion = ?, idMateria = ? WHERE idCurso = ?");
            ps.setString(1, c.getNombre());
            ps.setInt(2, c.getDuracion());
            ps.setInt(3, c.getIdMateria());
            ps.setInt(4, c.getIdCurso());
            ps.executeUpdate(); 
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorCursos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
    
    public void eliminarCurso (int idCurso)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("DELETE Cursos WHERE idCurso = ?");
            ps.setInt(1, idCurso);
            ps.executeUpdate();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorCursos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
}
