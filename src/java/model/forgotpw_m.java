/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import beans.forgotpw;
import com.sun.corba.se.impl.protocol.giopmsgheaders.Message;
import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;
import java.sql.*;
import java.util.*;
import org.apache.catalina.Session;
import sun.rmi.transport.Transport;
/**
 *
 * @author Umang
 */
public class forgotpw_m {
    public boolean sendpassword(forgotpw f) throws SQLException, MessagingException
    {
            int flg=0;
            DBConnection dbConn = new DBConnection();
            dbConn.connect();
            ResultSet rs;
            if(f.getEmail().equals("admin@ehelpdesk.com"))
            {
                rs = dbConn.customQuery("SELECT Emp_Password FROM employee WHERE Emp_Email = 'admin@ehelpdesk.com'");
                while(rs.next())
                {
                    f.setPassword(rs.getString(1));
                    flg=1;
                }
            }
            else
            {
                rs = dbConn.customQuery("SELECT Emp_Password FROM employee WHERE Emp_Email = '" + f.getEmail() + "'");
                while(rs.next())
                {
                    f.setPassword(rs.getString(1));
                    flg=1;
                }
                if(flg==0)
                {
                    rs = dbConn.customQuery("SELECT Cust_Password FROM customer WHERE Cust_Email = '" + f.getEmail() + "'");
                    while(rs.next())
                    {
                        f.setPassword(rs.getString(1));
                        flg=1;
                    }
                }
            }
            if(flg==1)
            {
                String host="smtp.gmail.com", user="sharingplusplus@gmail.com", pass="devloperasskd";
                //host = smtp_server; //"smtp.gmail.com"; user = jsp_email; //"YourEmailId@gmail.com" // email id to send the emails //pass = jsp_email_pw; //Your gmail password
                String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
                String to = f.getEmail();// out going email id
                String from = "sharingplusplus@gmail.com"; //Email id of the recipient
                String subject = "Sent Password - FileSharing";
                String messageText = "<br/>Dear User,<br/><br/> Your Password Is : " + f.getPassword();
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
                        return true;
                    }
                catch (Exception err) {
                    //WasEmailSent = false; // assume it's a fail
                        
                    }
            }
            else
            {
               return false;
            }
            return false;
    }
}
