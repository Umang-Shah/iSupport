/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.chng_password;
import beans.employee;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Umang
 */
public class Employee {
    public boolean chng_pw(chng_password c) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        String s = null;
        ResultSet rs = dbConn.customQuery("SELECT Emp_Password FROM employee WHERE Emp_Id = " + c.getId());
        while (rs.next()) {
            s = rs.getString(1);
        }
        if (s.equals(c.getOld_password())) {
            String s1 = "update employee set Emp_Password='" + c.getNew_password() + "' where Emp_Id=" + c.getId() + "";
            dbConn.executeQuery(s1);
            dbConn.disconnect();
            return true;
        } else {
            return false;
        }

    }

    public void setdetails(employee e) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        String s = "update employee set Emp_First_Name='" + e.getEmp_first_name() + "',Emp_Last_Name='" + e.getEmp_last_name() + "',Emp_Address='" + e.getEmp_address() + "',Emp_Contact_No=" + e.getEmp_contact_no() + ",DOB='" + e.getDob() + "',DOJ='" + e.getDoj() + "' where Emp_Id=" + e.getEmp_id();
        dbConn.executeQuery(s);
        dbConn.disconnect();
    }

    public List<employee> get_emp_detail(employee e) throws SQLException {
        List<employee> em = new ArrayList<employee>();
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        ResultSet rs = dbConn.customQuery("SELECT * FROM employee WHERE Emp_Id = " + e.getEmp_id());
        while (rs.next()) {
            e.setEmp_first_name(rs.getString("Emp_First_Name"));
            e.setEmp_last_name(rs.getString("Emp_Last_Name"));
            e.setEmp_address(rs.getString("Emp_Address"));
            e.setDob(rs.getString("DOB"));
            e.setEmp_contact_no(rs.getString("Emp_Contact_No"));
            em.add(e);
        }
        return em;
    }

}
