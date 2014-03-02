/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Umang
 */
public class customer {
 int cust_id,registered;
 String cust_name,cust_lname,cust_address,cust_email,cust_password,cust_dob,cust_contact_no;

    public String getCust_address() {
        return cust_address;
    }

    public String getCust_dob() {
        return cust_dob;
    }

    public void setCust_dob(String cust_dob) {
        this.cust_dob = cust_dob;
    }

    public void setCust_address(String cust_address) {
        this.cust_address = cust_address;
    }

    public String getCust_contact_no() {
        return cust_contact_no;
    }

    public String getCust_lname() {
        return cust_lname;
    }

    public void setCust_lname(String cust_lname) {
        this.cust_lname = cust_lname;
    }

    public void setCust_contact_no(String cust_contact_no) {
        this.cust_contact_no = cust_contact_no;
    }

    public String getCust_email() {
        return cust_email;
    }

    public void setCust_email(String cust_email) {
        this.cust_email = cust_email;
    }

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public String getCust_name() {
        return cust_name;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public String getCust_password() {
        return cust_password;
    }

    public void setCust_password(String cust_password) {
        this.cust_password = cust_password;
    }

    public int getRegistered() {
        return registered;
    }

    public void setRegistered(int registered) {
        this.registered = registered;
    }
}
