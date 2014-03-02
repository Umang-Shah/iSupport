/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.login;

import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Umang
 */
public class Authentication {
    public login checklogin(login l) throws SQLException
    {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs;
            int count=0;
            int id=0,type=0;
            if(l.getemail().contains("isupport.com"))
            {
                //rs = dbConn.customQuery("SELECT Emp_Id,Emp_Type_Id FROM employee WHERE Emp_Email = '" + l.getemail() +"' AND Emp_Password='"+ l.getpassword() +"'" );
                String sql="SELECT Emp_Id,Emp_Type_Id FROM employee WHERE Emp_Email = ? AND Emp_Password=?"; 
                PreparedStatement pst=(PreparedStatement) dbConn.getConnection().prepareStatement(sql);
                pst.setString(1, l.getemail());
                pst.setString(2, l.getpassword());
                rs=pst.executeQuery();
                while(rs.next())
                {
                    count++;
                    id=Integer.parseInt(rs.getString(1));
                    type=Integer.parseInt(rs.getString(2));
                }
                if(count==1)
                {
                    l.setid(id);
                    l.settype(type);
                    String s="UPDATE  employee SET  Emp_Login_Status =  1 WHERE  Emp_Id =" + l.getid();
                    dbConn.executeQuery(s);
                    rs.close();
                    dbConn.disconnect();
                    return l;
                }
                else
                {
                    rs.close();
                    return l=null;
                }
            }
            else
            {
                rs = dbConn.customQuery("SELECT Cust_Id,Registered FROM customer WHERE Cust_Email = '" + l.getemail() +"' AND Cust_Password='"+ l.getpassword() +"' " );
                        int r=0;
                        while(rs.next())
                        {
                            count++;
                            id=Integer.parseInt(rs.getString(1));
                            r=Integer.parseInt(rs.getString(2));
                        }
                        if(count==1)
                        {
                            l.setid(id);
                            l.settype(type);
                            l.setRegistered(r);
                            rs.close();
                            return l;
                        }
                        else
                        {
                            rs.close();
                            return l=null;
                        }
            }
        }
    
    }   