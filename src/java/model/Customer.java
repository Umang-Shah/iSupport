/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.chng_password;
import beans.complain_list;
import beans.customer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Umang
 */
public class Customer {
    public Customer()
    {
        
    }
public void reg_complain(complain_list c) throws SQLException
    {
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            DateFormat dateFormat= new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
            Date date=new Date();
            String s= "INSERT INTO complain_list (Cust_Id,Comp_Desc,Comp_Title,Start_Date) VALUES ( + " + c.getCust_id()  + ",'" + c.getComp_desc() + "','" + c.getComp_title() +"','"+ dateFormat.format(date) +"')";
            dbConn.executeQuery(s);
            dbConn.disconnect();
    }    
    public boolean chng_pw(chng_password c) throws SQLException
    {
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            String s=null;
            ResultSet rs = dbConn.customQuery("SELECT Cust_Password FROM customer WHERE Cust_Id = " + c.getId());
                        while(rs.next())
                        {
                            s=rs.getString(1);
                        }
                        if(s.equals(c.getOld_password()))
                        {
                            String s1="update customer set Cust_Password='" + c.getNew_password() + "' where Cust_Id="+ c.getId() +"";
                            dbConn.executeQuery(s1);
                            dbConn.disconnect();
                            return true;
                        }
                        else
                        {
                            return false;
                        }
            
    }
    public List<customer> setData(customer c) throws SQLException
    {
            List<customer> cu=new ArrayList<customer>();         
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT * FROM customer WHERE Cust_Id = '"+ c.getCust_id() +"'" );
                    while(rs.next())
                    {
                        c.setCust_name(rs.getString("Cust_Name"));
                        c.setCust_lname(rs.getString("Cust_Lname"));
                        c.setCust_address(rs.getString("Cust_Address"));
                        c.setCust_contact_no(rs.getString("Cust_Contact_No"));
                        c.setCust_dob(rs.getString("Cust_Dob"));
                        cu.add(c);
                    }
                return cu;
    }
    public void setdetails(customer c) throws SQLException{
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            String s="update customer set Cust_Name='" + c.getCust_name() + "',Cust_Lname='" + c.getCust_lname() + "', Cust_Address='"+ c.getCust_address() +"',Cust_Contact_No='" + c.getCust_contact_no() + "',Cust_Dob='"+ c.getCust_dob() +"' where Cust_Id="+ c.getCust_id() +"";
            dbConn.executeQuery(s);
            dbConn.disconnect();
    }
}
