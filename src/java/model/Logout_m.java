/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import beans.login;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Umang
 */
public class Logout_m {
    public Logout_m()
            {
                
            }
    public void lgout(login l) throws SQLException
    {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        String s="UPDATE employee SET  Emp_Login_Status =0 WHERE Emp_Id =" + l.getid();
        dbConn.executeQuery(s);
        dbConn.disconnect();
    }
    public boolean backtoqueue(int e) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        String s;
        ResultSet rs = dbConn.customQuery("select Comp_Id from queue where Emp_Id='" + e + "' And Status_Id=1");
        while (rs.next()) {
            s = "update complain_list set Cat_Id=NULL,Priority_Id=NULL where Comp_Id=" + Integer.parseInt(rs.getString("Comp_Id"));
        dbConn.executeQuery(s);
        }
        s = "delete from queue where Emp_Id='" + e + "' And Status_Id=1";
        dbConn.executeQuery(s);
        dbConn.disconnect();
        return true;
    }
}
