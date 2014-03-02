/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Umang
 */
public class employee {
    int emp_id,emp_type_id,cat_id,level_id,emp_login_status;
    String emp_first_name,emp_last_name,emp_address,emp_contact_no,emp_email,dob,doj,emp_password,emp_type,level,cat;

    public String getCat() {
        return cat;
    }

    public void setCat(String cat) {
        this.cat = cat;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public int getLevel_id() {
        return level_id;
    }

    public void setLevel_id(int level_ld) {
        this.level_id = level_ld;
    }

    public String getEmp_type() {
        return emp_type;
    }

    public void setEmp_type(String emp_type) {
        this.emp_type = emp_type;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getDoj() {
        return doj;
    }

    public void setDoj(String doj) {
        this.doj = doj;
    }

    public String getEmp_address() {
        return emp_address;
    }

    public void setEmp_address(String emp_address) {
        this.emp_address = emp_address;
    }

    public String getEmp_contact_no() {
        return emp_contact_no;
    }

    public void setEmp_contact_no(String emp_contact_no) {
        this.emp_contact_no = emp_contact_no;
    }

    public String getEmp_email() {
        return emp_email;
    }

    public void setEmp_email(String emp_email) {
        this.emp_email = emp_email;
    }

    public String getEmp_first_name() {
        return emp_first_name;
    }

    public void setEmp_first_name(String emp_first_name) {
        this.emp_first_name = emp_first_name;
    }

    public int getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(int emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_last_name() {
        return emp_last_name;
    }

    public void setEmp_last_name(String emp_last_name) {
        this.emp_last_name = emp_last_name;
    }

    public int getEmp_login_status() {
        return emp_login_status;
    }

    public void setEmp_login_status(int emp_login_status) {
        this.emp_login_status = emp_login_status;
    }

    public String getEmp_password() {
        return emp_password;
    }

    public void setEmp_password(String emp_password) {
        this.emp_password = emp_password;
    }

    public int getEmp_type_id() {
        return emp_type_id;
    }

    public void setEmp_type_id(int emp_type_id) {
        this.emp_type_id = emp_type_id;
    }
}
