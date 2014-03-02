/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.category;
import beans.complain_list;
import beans.priority;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author Umang
 */
public class Moderator extends Employee{

    public void AddComplaintoQueue(complain_list c) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        String s = "UPDATE complain_list set Cat_Id=" + c.getCat_id() + ",Priority_Id=" + c.getPriority_id() + " where Comp_Id=" + c.getComp_id();
        dbConn.executeQuery(s);
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        ResultSet rs = dbConn.customQuery("select count(Emp_Id) from (select employee.Emp_Id from employee, attendent_category_level where employee.Emp_Id=attendent_category_level.Emp_Id and Emp_Login_Status=1 and Cat_Id=" + c.getCat_id() + " and Level_Id=1) as emp where Emp_Id not in (select Emp_Id from queue)");
        int emp_id = 0;
        while (rs.next()) {
            if (Integer.parseInt(rs.getString("count(Emp_Id)")) == 0) {
                ResultSet rs1 = dbConn.customQuery("select Emp_Id from queue where Assign_Time=(select min(Assign_Time) from queue where Assign_Time In (select max(Assign_Time)from queue where Emp_Id IN (select Employee.Emp_Id from attendent_category_level, Employee where Emp_Login_Status=1 and Cat_Id=" + c.getCat_id() + " and Level_Id=1 and attendent_category_level.Emp_Id=Employee.Emp_Id)group by Emp_Id))");
                while (rs1.next()) {
                    emp_id = Integer.parseInt(rs1.getString("Emp_Id"));
                }
            } else {
                ResultSet rs1 = dbConn.customQuery("select Emp_Id from (select employee.Emp_Id from employee, attendent_category_level where employee.Emp_Id=attendent_category_level.Emp_Id and Emp_Login_Status=1 and Cat_Id=" + c.getCat_id() + " and Level_Id=1) as emp where Emp_Id not in (select Emp_Id from queue)");
                while (rs1.next()) {
                    emp_id = Integer.parseInt(rs1.getString("Emp_Id"));
                    break;
                }
            }
        }
        dbConn.executeQuery("Insert into queue(Comp_Id,Emp_Id,Assign_Time,Status_Id) values(" + c.getComp_id() + "," + emp_id + ",'" + dateFormat.format(cal.getTime()) + "',1)");
        dbConn.disconnect();
    }

    public List<complain_list> fetchComplaint() throws SQLException {
        List<complain_list> l = new ArrayList<complain_list>();
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        ResultSet rs = dbConn.customQuery("SELECT Comp_Id,Comp_Desc,Comp_Title,Start_Date from complain_list where Cat_Id is NULL ORDER BY Comp_Id ASC");
        while (rs.next()) {
            complain_list c = new complain_list();
            c.setComp_id(Integer.parseInt(rs.getString("Comp_Id")));
            c.setComp_desc(rs.getString("Comp_Desc"));
            c.setComp_title(rs.getString("Comp_Title"));
            c.setStart_date(rs.getString("Start_Date"));
            l.add(c);
        }
        return l;
    }
    
    public List<priority> fetchPriority() throws SQLException {
        List<priority> pr = new ArrayList<priority>();

        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        ResultSet rs = dbConn.customQuery("SELECT * from priority");
        while (rs.next()) {
            priority p = new priority();
            p.setPriority_desc(rs.getString(2));
            p.setPriority_id(Integer.parseInt(rs.getString(1)));
            pr.add(p);

        }
        return pr;
    }

    public List<category> fetchCategory() throws SQLException {
        List<category> c = new ArrayList<category>();
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        ResultSet rs = dbConn.customQuery("SELECT * from category");
        while (rs.next()) {
            category p = new category();
            p.setCat_desc(rs.getString(2));
            p.setCat_id(Integer.parseInt(rs.getString(1)));

            c.add(p);
        }
        return c;
    }

}
