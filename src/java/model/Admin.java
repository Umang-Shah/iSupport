/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.category;
import beans.chng_password;
import beans.employee;
import beans.level;
import beans.time;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Umang
 */
public class Admin extends Employee{
    public Admin()
    {
        
    }
    
    public List<employee> get_detail() throws SQLException
    {
            List<employee> em=new ArrayList<employee>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT employee.*,employee_type.Emp_Type_Desc FROM employee,employee_type WHERE employee.Emp_Type_Id=employee_type.Emp_Type_Id And employee.Emp_Type_Id = 3 ORDER BY  Emp_Email ASC ");
                    while(rs.next())
                    {
                        employee e=new employee();
                        e.setEmp_id(Integer.parseInt((rs.getString("Emp_Id"))));
                        e.setDob(rs.getString("DOB"));
                        e.setDoj(rs.getString("DOJ"));
                        e.setEmp_address(rs.getString("Emp_Address"));
                        e.setEmp_contact_no(rs.getString("Emp_Contact_No"));    
                        e.setEmp_email(rs.getString("Emp_Email"));
                        e.setEmp_first_name(rs.getString("Emp_First_Name"));
                        e.setEmp_last_name(rs.getString("Emp_Last_Name"));
                        e.setEmp_login_status(Integer.parseInt(rs.getString("Emp_Login_Status")));
                        e.setEmp_password(rs.getString("Emp_Password"));
                        e.setEmp_type_id(Integer.parseInt(rs.getString("Emp_Type_Id")));
                        e.setEmp_type(rs.getString("Emp_Type_Desc"));
                        em.add(e);
                    }
                return em;
    }
    
    public List<employee> get_att_detail() throws SQLException
    {
            List<employee> em=new ArrayList<employee>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("select employee.*,category.Cat_Desc,level.Level_Name,attendent_category_level.Level_Id,attendent_category_level.Cat_Id from employee,attendent_category_level,category,level where Emp_Type_Id=2 And employee.Emp_Id=attendent_category_level.Emp_Id And attendent_category_level.Level_Id=level.Level_Id And attendent_category_level.Cat_Id=category.Cat_Id ORDER BY Emp_Email ASC ");
                    while(rs.next())
                    {
                        employee e=new employee();
                        e.setEmp_id(Integer.parseInt((rs.getString("Emp_Id"))));
                        e.setDob(rs.getString("DOB"));
                        e.setDoj(rs.getString("DOJ"));
                        e.setEmp_address(rs.getString("Emp_Address"));
                        e.setEmp_contact_no(rs.getString("Emp_Contact_No"));    
                        e.setEmp_email(rs.getString("Emp_Email"));
                        e.setEmp_first_name(rs.getString("Emp_First_Name"));
                        e.setEmp_last_name(rs.getString("Emp_Last_Name"));
                        e.setEmp_login_status(Integer.parseInt(rs.getString("Emp_Login_Status")));
                        e.setEmp_password(rs.getString("Emp_Password"));
                        e.setEmp_type_id(Integer.parseInt(rs.getString("Emp_Type_Id")));
                        e.setCat_id(Integer.parseInt(rs.getString("Cat_Id")));
                        e.setCat(rs.getString("Cat_Desc"));
                        e.setLevel(rs.getString("Level_Name"));
                        e.setLevel_id(Integer.parseInt(rs.getString("Level_Id")));
                        em.add(e);
                    }
                return em;
    }
    public List<employee> get_one_att_detail(employee e) throws SQLException
    {
            List<employee> em=new ArrayList<employee>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("select employee.*,category.Cat_Desc,level.Level_Name,attendent_category_level.Level_Id,attendent_category_level.Cat_Id from employee,attendent_category_level,category,level where Emp_Type_Id=2 And employee.Emp_Id=attendent_category_level.Emp_Id And attendent_category_level.Level_Id=level.Level_Id And attendent_category_level.Cat_Id=category.Cat_Id And employee.Emp_Id=" + e.getEmp_id());
                    while(rs.next())
                    {
                        e.setEmp_id(Integer.parseInt((rs.getString("Emp_Id"))));
                        e.setDob(rs.getString("DOB"));
                        e.setDoj(rs.getString("DOJ"));
                        e.setEmp_address(rs.getString("Emp_Address"));
                        e.setEmp_contact_no(rs.getString("Emp_Contact_No"));    
                        e.setEmp_email(rs.getString("Emp_Email"));
                        e.setEmp_first_name(rs.getString("Emp_First_Name"));
                        e.setEmp_last_name(rs.getString("Emp_Last_Name"));
                        e.setEmp_login_status(Integer.parseInt(rs.getString("Emp_Login_Status")));
                        e.setEmp_password(rs.getString("Emp_Password"));
                        e.setEmp_type_id(Integer.parseInt(rs.getString("Emp_Type_Id")));
                        e.setCat_id(Integer.parseInt(rs.getString("Cat_Id")));
                        e.setCat(rs.getString("Cat_Desc"));
                        e.setLevel(rs.getString("Level_Name"));
                        e.setLevel_id(Integer.parseInt(rs.getString("Level_Id")));
                        em.add(e);
                    }
                return em;
    }
    public void update_profile(employee e) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            String s="update employee set Emp_First_Name='" + e.getEmp_first_name() + "',Emp_Last_Name='" + e.getEmp_last_name() + "',Emp_Address='"+ e.getEmp_address() +"',Emp_Contact_No="+ e.getEmp_contact_no() +",DOB='"+ e.getDob() +"' where Emp_Id="+ e.getEmp_id();
            dbConn.executeQuery(s);
            dbConn.disconnect();
    }
    
    public void dlt_emp(employee e) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            dbConn.executeQuery("Delete from employee Where Emp_Id = " + e.getEmp_id() );
            dbConn.disconnect();
    }
    public boolean add_emp(employee e) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            if(chk_email(e))
            {
                dbConn.disconnect();
                return false;
            }
            else
            {
                dbConn.executeQuery("INSERT INTO employee (Emp_Type_Id,Emp_First_Name, Emp_Last_Name, Emp_Address, Emp_Contact_No, Emp_Email, DOB, DOJ, Emp_Password) VALUES (3, '"+ e.getEmp_first_name() +"', '"+ e.getEmp_last_name() +"', '"+ e.getEmp_address() +"', "+ e.getEmp_contact_no() +", '"+ e.getEmp_email() +"@isupport.com', '"+ e.getDob() +"', '"+ e.getDoj() +"','"+ e.getDob() +"')");
                dbConn.disconnect();
                return true;
            }
    }
    public boolean chk_email(employee e) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs = dbConn.customQuery("SELECT Emp_Email from employee where Emp_Email='"+ e.getEmp_email() +"@isupport.com'");
            while(rs.next())
            {
                dbConn.disconnect();  
                return true;      
            }
            dbConn.disconnect();
            return false;
    }

    public List<category> get_all_category(employee e) throws SQLException {
        List<category> c=new ArrayList<category>();
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs = dbConn.customQuery("SELECT * from category where Cat_Id !=" + e.getCat_id());
            while(rs.next())
            {   
                category ct=new category();
                ct.setCat_id(Integer.parseInt((rs.getString(1))));
                ct.setCat_desc((rs.getString(2)));
                c.add(ct);
            }
            dbConn.disconnect();
            return c;
    }

    public List<level> get_all_level(employee e) throws SQLException {
        List<level> l=new ArrayList<level>();
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs = dbConn.customQuery("SELECT * from level where Level_id !=" + e.getLevel_id());
            while(rs.next())
            {
                level ct=new level();
                ct.setLevel_id(Integer.parseInt((rs.getString(1))));
                ct.setLevel_name((rs.getString(2)));
                l.add(ct);
            }
            dbConn.disconnect();
            return l;
    }

    public void set_att_details(employee e) throws SQLException {
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            String s="update employee set Emp_First_Name='" + e.getEmp_first_name() + "',Emp_Last_Name='" + e.getEmp_last_name() + "',Emp_Address='"+ e.getEmp_address() +"',Emp_Contact_No="+ e.getEmp_contact_no() +",DOB='"+ e.getDob() +"',DOJ='"+ e.getDoj() +"' where Emp_Id="+ e.getEmp_id();
            dbConn.executeQuery(s);
            s="UPDATE  attendent_category_level SET  Level_Id =  " + e.getLevel_id() + ", Cat_Id = " + e.getCat_id() + " WHERE  Emp_Id =" + e.getEmp_id();
            dbConn.executeQuery(s);
            dbConn.disconnect();
    }

    public List<category> get_all_category() throws SQLException {
        List<category> c=new ArrayList<category>();
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs = dbConn.customQuery("SELECT * from category ORDER BY  Cat_Desc ASC ");
            while(rs.next())
            {   
                category ct=new category();
                ct.setCat_id(Integer.parseInt((rs.getString(1))));
                ct.setCat_desc((rs.getString(2)));
                c.add(ct);
            }
            dbConn.disconnect();
            return c;
    }

    public List<level> get_all_level() throws SQLException {
        List<level> l=new ArrayList<level>();
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs = dbConn.customQuery("SELECT * from level");
            while(rs.next())
            {
                level ct=new level();
                ct.setLevel_id(Integer.parseInt((rs.getString(1))));
                ct.setLevel_name((rs.getString(2)));
                l.add(ct);
            }
            dbConn.disconnect();
            return l;
    }
    public boolean add_att(employee e) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            if(chk_email(e))
            {
                dbConn.disconnect();
                return false;
            }
            else
            {
                dbConn.executeQuery("INSERT INTO employee (Emp_Type_Id,Emp_First_Name, Emp_Last_Name, Emp_Address, Emp_Contact_No, Emp_Email, DOB, DOJ, Emp_Password) VALUES (2, '"+ e.getEmp_first_name() +"', '"+ e.getEmp_last_name() +"', '"+ e.getEmp_address() +"', "+ e.getEmp_contact_no() +", '"+ e.getEmp_email() +"@isupport.com', '"+ e.getDob() +"', '"+ e.getDoj() +"','"+ e.getDob() +"')");
                ResultSet rs = dbConn.customQuery("SELECT Emp_Id from employee where Emp_Email='"+ e.getEmp_email() +"@isupport.com'");
                while(rs.next())
                {   
                    e.setEmp_id(Integer.parseInt(rs.getString(1)));
                }
                dbConn.executeQuery("INSERT INTO attendent_category_level (Emp_Id, Level_Id, Cat_Id) VALUES ("+ e.getEmp_id() +", "+ e.getLevel_id() +", "+ e.getCat_id() + ")");
                dbConn.disconnect();
                return true;
            }
    }
    public void add_cat(category c) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            dbConn.executeQuery("INSERT INTO category (Cat_Desc) VALUES ('"+ c.getCat_desc()+"')");
            ResultSet rs = dbConn.customQuery("SELECT Max(Cat_Id) FROM category");
                    while(rs.next())
                    {
                        c.setCat_id(Integer.parseInt((rs.getString(1))));
                    }
                    rs = dbConn.customQuery("SELECT Level_Id FROM level");
                    while(rs.next())
                    {
                        dbConn.executeQuery("INSERT INTO category_level (Cat_Id,Level_Id) VALUES ("+ c.getCat_id() + "," + rs.getString(1) +")");
                    }
            dbConn.disconnect();
    }
    public void dlt_cat(category c) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            dbConn.executeQuery("Delete from category Where Cat_Id = " + c.getCat_id() );
            dbConn.disconnect();
    }
    public List<category> get_cat_details(category c) throws SQLException
    {
            List<category> em=new ArrayList<category>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT Cat_Id,Cat_Desc FROM category WHERE Cat_Id=" + c.getCat_id());
                    while(rs.next())
                    {
                        c.setCat_id(Integer.parseInt(rs.getString("Cat_Id")));
                        c.setCat_desc(rs.getString("Cat_Desc"));
                        em.add(c);
                    }
                return em;
    }
    public void setcatdetails(category c) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            
            String s="update category set Cat_Desc='" + c.getCat_desc() +"' where Cat_Id="+ c.getCat_id();
            dbConn.executeQuery(s);
            dbConn.disconnect();
    }
 //*********TIME**************
   public void settimedetails(time t) throws SQLException {
        DBConnection dbConn = new DBConnection();
            dbConn.connect();
            String s="UPDATE category_level SET Time = "+ t.getTime() + " WHERE  Cat_Id ="+ t.getCat_id() +" AND Level_Id ="+ t.getLevel_id();
            dbConn.executeQuery(s);
            dbConn.disconnect();
    }
    public List<time> get_time_detail() throws SQLException
    {
            List<time> time_list=new ArrayList<time>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT category_level.*,level.Level_Name,category.Cat_Desc  FROM  category_level,level,category where category_level.Level_Id=level.Level_Id And category_level.Cat_Id=category.Cat_Id And level.Level_Id != (Select Max(Level_Id) from level) Order By Cat_Desc,Level_Name");
                    while(rs.next())
                    {
                        time t=new time();
                        t.setCat_id(Integer.parseInt((rs.getString("Cat_Id"))));
                        t.setLevel_id(Integer.parseInt((rs.getString("Level_Id"))));
                        String st=(rs.getString("Time"));
                        if(st==null)
                        {
                            
                        }
                        else
                        {
                            t.setTime(Integer.parseInt((rs.getString("Time"))));
                        }
                        t.setCategory_desc(rs.getString("Cat_Desc"));
                        t.setLevel_name(rs.getString("Level_Name"));
                        time_list.add(t);
                    }
                return time_list;
    }
   public List<time> get_cat_level_details(time t) throws SQLException {
        
            List<time> time_list=new ArrayList<time>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT category_level.*,level.Level_Name,category.Cat_Desc FROM category_level,level,category where category_level.Level_Id=level.Level_Id And category_level.Cat_Id=category.Cat_Id And category_level.Level_Id=" + t.getLevel_id() + " And category_level.Cat_Id=" + t.getCat_id());
                    while(rs.next())
                    {    
                        String st=(rs.getString("Time"));
                        if(st==null)
                        {
                            
                        }
                        else
                        {
                            t.setTime(Integer.parseInt((rs.getString("Time"))));
                        }
                        
                        t.setCategory_desc(rs.getString("Cat_Desc"));
                        t.setLevel_name(rs.getString("Level_Name"));
                        time_list.add(t);
                    }
                return time_list;
    }
//*************LEVEL***********************

 public List<level> get_level_detail() throws SQLException
    {
            List<level> level_list=new ArrayList<level>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT * FROM level ORDER BY Level_Name ASC ");
                    while(rs.next())
                    {
                        level l=new level();
                        l.setLevel_id(Integer.parseInt((rs.getString(1))));
                        l.setLevel_name(rs.getString(2));
                        level_list.add(l);
                    }
                return level_list;
    }
 public void dlt_level(level l) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            dbConn.executeQuery("Delete from level Where Level_Id = " + l.getLevel_id() );
            dbConn.disconnect();
    }
 public List<level> get_level_details(level l) throws SQLException
    {
            List<level> em=new ArrayList<level>(); 
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT Level_Id,Level_Name FROM level WHERE Level_Id=" + l.getLevel_id());
                    while(rs.next())
                    {
                        l.setLevel_id(Integer.parseInt(rs.getString("Level_Id")));
                        l.setLevel_name(rs.getString("Level_Name"));
                        em.add(l);
                    }
                return em;
    }
 public void setleveldetails(level l) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            String s="UPDATE  level SET  Level_Name = '" + l.getLevel_name() +"' WHERE  Level_Id =" + l.getLevel_id();
            dbConn.executeQuery(s);
            dbConn.disconnect();
    }
  public void add_level(level l) throws SQLException {
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            dbConn.executeQuery("INSERT INTO level (Level_Name) VALUES ('"+ l.getLevel_name()+"')");
            ResultSet rs = dbConn.customQuery("SELECT Max(Level_Id) FROM level");
                    while(rs.next())
                    {
                        l.setLevel_id(Integer.parseInt((rs.getString(1))));
                    }
                    rs = dbConn.customQuery("SELECT Cat_Id FROM category");
                    while(rs.next())
                    {
                        dbConn.executeQuery("INSERT INTO category_level (Cat_Id,Level_Id) VALUES ("+ rs.getString(1) + "," + l.getLevel_id()+")");
                    }
            dbConn.disconnect();
    }

    public List<employee> get_admin_detail(employee e) throws SQLException {
        List<employee> em=new ArrayList<employee>();
            DBConnection dbConn = new DBConnection();
                    dbConn.connect();	
                    ResultSet rs = dbConn.customQuery("SELECT * FROM employee WHERE Emp_Id = "+ e.getEmp_id());
                    while(rs.next())
                    {
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
