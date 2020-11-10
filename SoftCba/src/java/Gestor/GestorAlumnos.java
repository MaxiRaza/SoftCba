package Gestor;

import Modelo.Alumno;
import Modelo.DTO.DTO_Alumno;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestorAlumnos {
    
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
    
    public void agregarAlumno(Alumno a)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO Alumnos (legajo, nombre, apellido, fechaNac, idBarrio, calle, numero, telefono, correo) VALUES (?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, a.getLegajo());
            ps.setString(2, a.getNombre());
            ps.setString(3, a.getApellido());
            ps.setString(4, a.getFechaNac());
            ps.setInt(5, a.getIdBarrio());
            ps.setString(6, a.getCalle());
            ps.setInt(7, a.getNumero());
            ps.setString(8, a.getTelefono());
            ps.setString(9, a.getCorreo());
            ps.executeUpdate(); 
            ps.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorAlumnos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
       
    public ArrayList<Alumno> obtenerAlumnos()
    {
        ArrayList<Alumno> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT idAlumno, legajo, nombre, apellido, fechaNac, idBarrio, calle, numero, telefono, correo FROM Alumnos");
            while(rs.next())
            {              
                Alumno a = new Alumno();
                a.setIdAlumno(rs.getInt(1));
                a.setLegajo(rs.getInt(2));
                a.setNombre(rs.getString(3));
                a.setApellido(rs.getString(4));
                a.setFechaNac(rs.getString(5));
                a.setIdBarrio(rs.getInt(6));
                a.setCalle(rs.getString(7));
                a.setNumero(rs.getInt(8));
                a.setTelefono(rs.getString(9));
                a.setCorreo(rs.getString(10));                                                                        
                lista.add(a);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorAlumnos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
     
     public ArrayList<DTO_Alumno> obtenerAlumnosDTO()
    {
        ArrayList<DTO_Alumno> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT a.idAlumno,  a.legajo,  a.nombre, apellido,  a.fechaNac, b.descripcion,  a.calle,  a.numero,  a.telefono,  a.correo FROM Alumnos a JOIN Barrios b ON a.idBarrio = b.idBarrio");
            while(rs.next())
            {              
                DTO_Alumno a = new DTO_Alumno();
                a.setIdAlumno(rs.getInt(1));
                a.setLegajo(rs.getInt(2));
                a.setNombre(rs.getString(3));
                a.setApellido(rs.getString(4));
                a.setFechaNac(rs.getString(5));
                a.setBarrio(rs.getString(6));
                a.setCalle(rs.getString(7));
                a.setNumero(rs.getInt(8));
                a.setTelefono(rs.getString(9));
                a.setCorreo(rs.getString(10));                                                                        
                lista.add(a);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorAlumnos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
     
     public ArrayList<DTO_Alumno> obtenerNombreCompletoAlumnosDTO()
    {
        ArrayList<DTO_Alumno> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT idAlumno, nombre + ' ' + apellido FROM Alumnos");
            while(rs.next())
            {              
                DTO_Alumno a = new DTO_Alumno();
                a.setIdAlumno(rs.getInt(1));
                a.setNombre(rs.getString(2));                                                                  
                lista.add(a);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorAlumnos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
    
    public Alumno obtenerAlumno(int idAlumno)
    {
        Alumno a = null;
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("SELECT idAlumno, legajo, nombre, apellido, fechaNac, idBarrio, calle, numero, telefono, correo FROM Alumnos WHERE idAlumno = ?");
            ps.setInt(1, idAlumno);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {               
                a = new Alumno();
                a.setIdAlumno(rs.getInt(1));
                a.setLegajo(rs.getInt(2));
                a.setNombre(rs.getString(3));
                a.setApellido(rs.getString(4));
                a.setFechaNac(rs.getString(5));
                a.setIdBarrio(rs.getInt(6));
                a.setCalle(rs.getString(7));
                a.setNumero(rs.getInt(8));
                a.setTelefono(rs.getString(9));
                a.setCorreo(rs.getString(10));                                                                     
            }
            ps.close();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorAlumnos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return a;
    }
    
    public void actualizarAlumno(Alumno a)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("UPDATE Alumnos SET legajo = ?, nombre = ?, apellido = ?, fechaNac = ?, idBarrio = ?, calle = ?, numero = ?, telefono = ?, correo = ? WHERE idAlumno = ?");
            ps.setInt(1, a.getLegajo());
            ps.setString(2, a.getNombre());
            ps.setString(3, a.getApellido());
            ps.setString(4, a.getFechaNac());
            ps.setInt(5, a.getIdBarrio());
            ps.setString(6, a.getCalle());
            ps.setInt(7, a.getNumero());
            ps.setString(8, a.getTelefono());
            ps.setString(9, a.getCorreo());
            ps.setInt(10, a.getIdAlumno());
            ps.executeUpdate(); 
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorAlumnos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
    
    public void eliminarAlumno (int idAlumno)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("DELETE Alumnos WHERE idAlumno = ?");
            ps.setInt(1, idAlumno);
            ps.executeUpdate();
        }    
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorAlumnos.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
    
}