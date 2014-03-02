/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Umang
 */
public class login {
    String email,password,type;
    int id;
    
    public int getid() {
        return id;
    }
    
    public void setid(int id) {
        this.id=id;
    }
    
    public String getemail() {
        return email;
    }
    
    public void setemail(String email) {
        this.email=email;
    }
    
    public String getpassword() {
        return password;
    }
    
    public void setpassword(String password) {
        this.password=password;
    }
    
    public String gettype() {
        return type;
    }
    
    public void settype(String type) {
        this.type=type;
    }
}
