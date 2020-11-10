package Gestor;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GestorUsuarios {
    
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
             
    public boolean obtenerUsuario(String usuario, String contrasenia) 
    {
        boolean existe = false;
        try
        {          
            abrirConexion();
            PreparedStatement ps = conexion.prepareStatement("SELECT usuario, contrasenia FROM Usuarios WHERE usuario = ? AND contrasenia = ?");
            ps.setString(1, usuario);
            ps.setString(2, contrasenia);
            ResultSet st = ps.executeQuery();           
            if(st.next())
            {
                existe = true;
            }                                
            ps.close();
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(GestorUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            cerrarConexion();
        }
        return existe;
    }
}
