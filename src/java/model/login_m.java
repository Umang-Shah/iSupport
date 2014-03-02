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
public class login_m {
    public login checklogin(login l) throws SQLException
    {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs;
            int count=0;
            int id=0;
            
            if(l.getemail().equals("admin@ehelpdesk.com"))
            {
                rs = dbConn.customQuery("SELECT Emp_Id FROM employee WHERE Emp_Email = 'admin@ehelpdesk.com' AND Emp_Password='"+ l.getpassword() +"' " );
                while(rs.next())
                {
                    count++;
                    id=Integer.parseInt(rs.getString(1));
                }
                if(count==1)
                {
                    l.setid(id);
                    l.settype("admin");
                    rs.close();
                    return l;
                }
            }
            else
            {
                    
                    rs = dbConn.customQuery("SELECT Emp_Id FROM employee WHERE Emp_Email = '" + l.getemail() +"' AND Emp_Password='"+ l.getpassword() +"'" );
                    while(rs.next())
                    {
                        count++;
                        id=Integer.parseInt(rs.getString(1));
                    }
                    if(count==1)
                    {
                        l.setid(id);
                        l.settype("employee");
                        rs.close();
                        return l;
                    }
                    else
                    {
                        rs = dbConn.customQuery("SELECT Cust_Id FROM customer WHERE Cust_Email = '" + l.getemail() +"' AND Cust_Password='"+ l.getpassword() +"' " );
                        while(rs.next())
                        {
                            count++;
                            id=Integer.parseInt(rs.getString(1));
                        }
                        if(count==1)
                        {
                            l.setid(id);
                            l.settype("customer");
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
        return l=null;    
        }
    }   