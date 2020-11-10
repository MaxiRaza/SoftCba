package Gestor;

import Modelo.Barrio;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestorBarrios {
   
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
    
    public void agregarBarrio(Barrio b)
    {
        try
        {
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO Barrios (descripcion) VALUES (?)");
            ps.setString(1, b.getDescripcion());
            ps.executeUpdate(); 
            ps.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorBarrios.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
    }
       
    public ArrayList<Barrio> obtenerBarrios()
    {
        ArrayList<Barrio> lista = new ArrayList<>();
        try
        {
            abrirConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery("SELECT idBarrio, descripcion FROM Barrios");
            while(rs.next())
            {              
                Barrio b = new Barrio();
                b.setIdBarrio(rs.getInt(1));
                b.setDescripcion(rs.getString(2));
                lista.add(b);
            }
            rs.close();
            st.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorBarrios.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return lista;
    }
}
