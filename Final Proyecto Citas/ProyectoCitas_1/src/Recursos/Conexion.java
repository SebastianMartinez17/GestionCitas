
package Recursos;
 import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Conexion {
    
    String url = "jdbc:mysql://localhost:3306/citasproyecto20";
    String user = "root", pass="";
    Connection con;
    
    public Connection getConnection(){
        
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
        JOptionPane.showMessageDialog(null, "Conexion a la base de datos");
       
    } catch (Exception e){
        JOptionPane.showMessageDialog(null, "Error de conexion");
        
    }   return con;
    
}    
}

