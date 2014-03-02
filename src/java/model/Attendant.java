/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.category;
import beans.chng_password;
import beans.complain_list;
import beans.employee;
import beans.priority;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author Umang
 */
public class Attendant extends Employee{

    
    public ArrayList<complain_list> pending_complaints(employee e) throws SQLException {

        ArrayList<complain_list> cu = new ArrayList<complain_list>();
        System.out.println("Comp_Id");
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        int emp_id = e.getEmp_id();
        ResultSet rs = dbConn.customQuery("select queue.Comp_Id, Comp_Title,Cust_Id, complain_list.Comp_Desc, queue.Assign_Time, priority.Priority_Desc, complain_list.Start_Date from queue, complain_list, priority where Emp_Id='" + emp_id + "' and queue.Status_Id in (select Status_Id from status where (Status_Desc='Pending' or Status_Desc='In Progress') and queue.Comp_Id=complain_list.Comp_Id and complain_list.Priority_Id=priority.Priority_Id order by priority.Priority_Id ASC,queue. Assign_Time ASC)");
        while (rs.next()) {
            System.out.println(rs.getString("Comp_Id"));
            complain_list c = new complain_list();
            c.setComp_id(Integer.parseInt(rs.getString("Comp_Id")));
            c.setComp_title(rs.getString("Comp_Title"));
            c.setCust_id(Integer.parseInt(rs.getString("Cust_Id")));
            c.setComp_desc(rs.getString("Comp_Desc"));
            c.setPriority_desc(rs.getString("priority.Priority_Desc"));
            cu.add(c);
        }
        dbConn.disconnect();
        return cu;

    }

    public List<complain_list> fetchComplain(complain_list comp, employee e) throws SQLException {
        List<complain_list> ls = new ArrayList<complain_list>();
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        complain_list c = new complain_list();
        ResultSet rs = dbConn.customQuery("SELECT Comp_id,Cust_Id,Comp_Desc,Start_Date,Comp_Title from complain_list where Comp_Id='" + comp.getComp_id() + "' ");
        while (rs.next()) {
            c.setComp_id(Integer.parseInt(rs.getString("Comp_Id")));
            c.setComp_desc(rs.getString("Comp_Desc"));
            c.setStart_date(rs.getString("Start_Date"));
            c.setComp_title(rs.getString("Comp_Title"));
            c.setCust_id(Integer.parseInt(rs.getString("Cust_Id")));
            ls.add(c);
        }
        String s = "update queue set Status_Id=2 where Emp_Id='" + e.getEmp_id() + "' and Comp_Id='" + c.getComp_id() + "'";
        dbConn.executeQuery(s);

        dbConn.disconnect();
        return ls;
    }

    public int getmaxlevel() throws SQLException {

        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        int maxlevel = 0;
        ResultSet rs = dbConn.customQuery("SELECT max(Level_Id) from level");
        while (rs.next()) {
            maxlevel = Integer.parseInt(rs.getString("max(Level_Id)"));
        }
        return maxlevel;

    }

    public int fetchtime(employee e, complain_list c) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        int time = 0;
        ResultSet rs = dbConn.customQuery("select Time,Level_id from category_level where Cat_Id=(select Cat_Id from attendent_category_level where Emp_Id=" + e.getEmp_id() + ") And Level_Id=(select Level_Id from attendent_category_level where Emp_Id=" + e.getEmp_id() + ")");
        while (rs.next()) {
            time = (Integer.parseInt(rs.getString(1)));
            e.setLevel_id(Integer.parseInt(rs.getString(2)));
        }
        if (e.getLevel_id() == getmaxlevel()) {
            return 0;
        }
        String s1 = "update queue set Status_Id=2 where  where Emp_Id=" + e.getEmp_id() + " and Comp_Id=" + c.getComp_id();
        dbConn.executeQuery(s1);
        dbConn.disconnect();
        return time;
    }

    public void escalate(complain_list c, employee e) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        int emp_id = e.getEmp_id();
        ResultSet rs = dbConn.customQuery("select Cat_Id, Level_Id from attendent_category_level where Emp_Id='" + e.getEmp_id() + "'");
        int catid = 0;
        int levelid = 0;
        while (rs.next()) {
            catid = Integer.parseInt(rs.getString("Cat_Id"));
            levelid = Integer.parseInt(rs.getString("Level_Id"));
        }
        rs = dbConn.customQuery("select min(Level_Id) from level where Level_Id > " + levelid);
        while (rs.next()) {
            levelid = Integer.parseInt(rs.getString(1));
        }
        ResultSet rs1 = dbConn.customQuery("select count(Emp_Id) from (select employee.Emp_Id from employee, attendent_category_level where employee.Emp_Id=attendent_category_level.Emp_Id and Emp_Login_Status=1 and Cat_Id='" + catid + "' and Level_Id='" + levelid + "') as emp where Emp_Id not in (select Emp_Id from queue)");
        while (rs1.next()) {
            if (Integer.parseInt(rs1.getString("count(Emp_Id)")) == 0) {
                ResultSet rs2 = dbConn.customQuery("select Emp_Id from queue where Assign_Time=(select min(Assign_Time) from queue where Assign_Time In (select max(Assign_Time)from queue where Emp_Id IN (select Employee.Emp_Id from attendent_category_level, Employee where Emp_Login_Status=1 and Cat_Id='" + catid + "' and Level_Id='" + levelid + "' and attendent_category_level.Emp_Id=Employee.Emp_Id)group by Emp_Id))");
                while (rs2.next()) {
                    emp_id = Integer.parseInt(rs2.getString("Emp_Id"));
                }
            } else {
                ResultSet rs2 = dbConn.customQuery("select Emp_Id from (select employee.Emp_Id from employee, attendent_category_level where employee.Emp_Id=attendent_category_level.Emp_Id and Emp_Login_Status=1 and Cat_Id='" + catid + "' and Level_Id='" + levelid + "') as emp where Emp_Id not in (select Emp_Id from queue)");
                while (rs2.next()) {
                    emp_id = Integer.parseInt(rs2.getString("Emp_Id"));
                    break;
                }
            }
            int comp_id = c.getComp_id();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String s = "Insert into queue(Comp_Id,Emp_Id,Assign_Time,Status_Id) values('" + comp_id + "','" + emp_id + "','" + dateFormat.format(cal.getTime()) + "',1)";
            dbConn.executeQuery(s);
            s = "update queue set Status_Id=5 where Emp_Id='" + e.getEmp_id() + "' and Comp_Id='" + comp_id + "'";
            dbConn.executeQuery(s);
        }
        dbConn.disconnect();
    }

    public void solvecomplain(complain_list c, employee e) throws SQLException, MessagingException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        /*String pattern = "MM/dd/yyyy";
        String dateInString =new SimpleDateFormat(pattern).format(new Date());*/
        Calendar currentDate = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        String dateNow = formatter.format(currentDate.getTime());
        String s = "update queue set Status_Id=3 where Emp_Id='" + e.getEmp_id() + "' and Comp_Id='" + c.getComp_id() + "'";
        dbConn.executeQuery(s);
        s = "update complain_list set End_Date='" + dateNow + "',Solution='" + c.getSolution() + "' where Comp_Id='" + c.getComp_id() + "'";
        dbConn.executeQuery(s);
        ResultSet rs1 = dbConn.customQuery("select Cust_Email from Customer where Cust_Id=(Select Cust_Id from complain_list where Comp_Id=" + c.getComp_id() + ")");
        String email = null;
        while (rs1.next()) {
            email = rs1.getString(1);
        }
        sendmail(email);
        dbConn.disconnect();
    }

    public boolean backtoqueue(complain_list c) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        String s = "update complain_list set Cat_Id=NULL,Priority_Id=NULL where Comp_Id='" + c.getComp_id() + "'";
        dbConn.executeQuery(s);
        s = "delete from queue where Comp_Id='" + c.getComp_id() + "'";
        dbConn.executeQuery(s);
        dbConn.disconnect();
        return true;
    }
    
    public void addtounsolved(complain_list c, employee e) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        String s = "update queue set Status_Id=(select Status_Id from status where Status_Desc='Unsolved') where Emp_Id='" + e.getEmp_id() + "' and Comp_Id=" + c.getComp_id();
        dbConn.executeQuery(s);
        dbConn.disconnect();
    }

    public ArrayList<complain_list> viewunsolved(employee e) throws SQLException {
        ArrayList<complain_list> ls = new ArrayList<complain_list>();
        DBConnection dbConn = new DBConnection();
        dbConn.connect();

        ResultSet rs = dbConn.customQuery("select queue.Comp_Id, Comp_Title, complain_list.Comp_Desc, Solution from queue, complain_list where queue.Status_Id In (4,5) and queue.Comp_Id=complain_list.Comp_Id and Emp_Id=" + e.getEmp_id() + " order by Comp_Id DESC");
        while (rs.next()) {
            complain_list c = new complain_list();
            c.setComp_id(Integer.parseInt(rs.getString("Comp_Id")));
            c.setComp_desc(rs.getString("Comp_Desc"));
            c.setSolution(rs.getString("Solution"));
            c.setComp_title(rs.getString("Comp_Title"));
            ls.add(c);
            System.out.println(c.getCust_id());
        }
        return ls;
    }

    public ArrayList<complain_list> viewsolved(employee e) throws SQLException {

        ArrayList<complain_list> cu = new ArrayList<complain_list>();
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        int emp_id = e.getEmp_id();
        ResultSet rs = dbConn.customQuery("select queue.Comp_Id, Comp_Title,Cust_Id, complain_list.Comp_Desc, queue.Assign_Time, priority.Priority_Desc, complain_list.Start_Date,End_Date, Solution from queue, complain_list, priority where Emp_Id='" + emp_id + "' and queue.Status_Id=(select Status_Id from status where Status_Desc='Resolved') and queue.Comp_Id=complain_list.Comp_Id and complain_list.Priority_Id=priority.Priority_Id order by priority.Priority_Id ASC,queue. Assign_Time ASC");
        while (rs.next()) {
            complain_list c = new complain_list();
            c.setComp_id(Integer.parseInt(rs.getString("Comp_Id")));
            c.setComp_title(rs.getString("Comp_Title"));
            c.setCust_id(Integer.parseInt(rs.getString("Cust_Id")));
            c.setComp_desc(rs.getString("Comp_Desc"));
            c.setPriority_desc(rs.getString("priority.Priority_Desc"));
            c.setEnd_date(rs.getString("End_Date"));
            c.setSolution(rs.getString("Solution"));
            c.setStart_date("Start_Date");
            cu.add(c);
        }
        dbConn.disconnect();
        return cu;
    }

    /*
    public List<complain_list> viewsolvedetails(complain_list comp) throws SQLException {
    
    try {
    DBConnection dbConn = new DBConnection();
    dbConn.connect();
    complain_list c = new complain_list();
    ResultSet rs = dbConn.customQuery("SELECT Comp_id,Cust_Id,Comp_Desc,Start_Date,Comp_Title,End_Date, Solution from complain_list where Comp_Id='" + comp.getComp_id() + "' ");
    while (rs.next()) {
    c.setComp_id(Integer.parseInt(rs.getString("Comp_Id")));
    c.setComp_desc(rs.getString("Comp_Desc"));
    c.setStart_date(rs.getString("Start_Date"));
    c.setComp_title(rs.getString("Comp_Title"));
    c.setCust_id(rs.getString("Cust_Id"));
    c.setEnd_date("End_Date");
    c.setSolution("Solution");
    ls.add(c);
    }
    return ls;
    } catch (Exception e) {
    e.printStackTrace();
    return ls = null;
    }
    
    }*/
    public void sendmail(String c) throws SQLException, MessagingException {

        String host="smtp.gmail.com", user="helpdesksen@gmail.com", pass="helpdesk123";
        //host = smtp_server; //"smtp.gmail.com"; user = jsp_email; //"YourEmailId@gmail.com" // email id to send the emails //pass = jsp_email_pw; //Your gmail password
        String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        String to = c;// out going email id
        String from = "helpdesksen@gmail.com"; //Email id of the recipient
        String subject = "Isupport";
        String messageText = "<br/>Dear User,<br/><br/> Your Complaint has been Solved Successfully Please Check the Solution on our Site.";
        boolean sessionDebug = true;
        Properties props = System.getProperties();
        props.put("mail.host", host);
        props.put("mail.transport.protocol.", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
        Session mailSession = Session.getDefaultInstance(props, null);
        mailSession.setDebug(sessionDebug);
        Message msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from));
        InternetAddress[] address = {new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setSubject(subject);
        msg.setContent(messageText, "text/html"); // use setText if you want to send text
        Transport transport = mailSession.getTransport("smtp");
        transport.connect(host, user, pass);
        try {
            transport.sendMessage(msg, msg.getAllRecipients()); //WasEmailSent = true; // assume it was sent
            transport.close();
        } catch (Exception err) {
            //WasEmailSent = false; // assume it's a fail
        }
    }

    public int checkMaxLevel(employee e) throws SQLException {
        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        int f = 0;

        ResultSet rs = dbConn.customQuery("select Level_Id from attendent_category_level where Emp_Id=" + e.getEmp_id() + " And Level_Id= (select Max(Level_Id) from level)");
        while (rs.next()) {
            f = 1;
        }
        return f;
    }
}
