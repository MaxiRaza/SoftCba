package Gestor;

import Modelo.DTO.DTO_Programa;
import Modelo.Programa;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestorProgramas {
   
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
    
    public void agregarPrograma(Programa p)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO Programas (nombre, cantDescargas, estaHabilitado, idAlumno) VALUES (?,?,?,?)");
            ps.setString(1, p.getNombre());
            ps.setInt(2, p.getCantDescargas());
            ps.setBoolean(3, p.isEstaHabilitado());
            ps.setInt(4, p.getIdAlumno());
            ps.executeUpdate(); 
            ps.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorProgramas.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
       
    public ArrayList<Programa> obtenerProgramas()
    {
        ArrayList<Programa> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT idPrograma, nombre, estaHabilitado, cantDescargas, idAlumno FROM Programas");
            while(rs.next())
            {              
                Programa p = new Programa();
                p.setIdPrograma(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setEstaHabilitado(rs.getBoolean(3));
                p.setCantDescargas(rs.getInt(4));              
                p.setIdAlumno(rs.getInt(5));
                lista.add(p);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorProgramas.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }   
    
    public ArrayList<DTO_Programa> obtenerProgramasNombreAlumno()
    {
        ArrayList<DTO_Programa> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT p.idPrograma, p.nombre, p.estaHabilitado, p.cantDescargas, a.nombre + ' ' + a.apellido FROM Programas p JOIN Alumnos a ON p.idAlumno = a.idAlumno");
            while(rs.next())
            {              
                DTO_Programa p = new DTO_Programa();
                p.setIdPrograma(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setEstaHabilitado(rs.getBoolean(3));
                p.setCantDescargas(rs.getInt(4));              
                p.setAlumno(rs.getString(5));
                lista.add(p);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorProgramas.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }

    public ArrayList<Programa> top5Programas()
    {
        ArrayList<Programa> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT TOP(5) idPrograma, nombre, cantDescargas FROM Programas	ORDER BY cantDescargas DESC");
            while(rs.next())
            {              
                Programa p = new Programa();
                p.setIdPrograma(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setCantDescargas(rs.getInt(3));
                lista.add(p);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorProgramas.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
    
    public Programa obtenerPrograma(int idPrograma)
    {
        Programa p = null;
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("SELECT idPrograma, nombre, estaHabilitado, cantDescargas, idAlumno FROM Programas WHERE idPrograma = ?");
            ps.setInt(1, idPrograma);
            ResultSet st = ps.executeQuery();
            if(st.next())
            {              
                p = new Programa();
                p.setIdPrograma(st.getInt(1));
                p.setNombre(st.getString(2));
                p.setEstaHabilitado(st.getBoolean(3));
                p.setCantDescargas(st.getInt(4));              
                p.setIdAlumno(st.getInt(5));                                                                     
            }
            ps.close();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorProgramas.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return p;
    }
    
    public void actualizarPrograma(Programa p)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("UPDATE Programas SET nombre = ?, estaHabilitado  = ?, cantDescargas  = ?, idAlumno  = ? WHERE idPrograma = ?");
            ps.setString(1, p.getNombre());           
            ps.setBoolean(2, p.isEstaHabilitado());
            ps.setInt(3, p.getCantDescargas());
            ps.setInt(4, p.getIdAlumno());
            ps.setInt(5, p.getIdPrograma());
            ps.executeUpdate(); 
            ps.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorProgramas.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
    
    public void eliminarPrograma (int idPrograma)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("DELETE Programas WHERE idPrograma = ?");
            ps.setInt(1, idPrograma);
            ps.executeUpdate();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorProgramas.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
    
}
