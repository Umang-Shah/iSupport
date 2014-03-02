/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author Umang
 */
public class complain_list {
    int comp_id,cust_id;
    String comp_title,comp_desc,start_date,end_date;

    public String getComp_desc() {
        return comp_desc;
    }

    public void setComp_desc(String comp_desc) {
        this.comp_desc = comp_desc;
    }

    public int getComp_id() {
        return comp_id;
    }

    public void setComp_id(int comp_id) {
        this.comp_id = comp_id;
    }

    public String getComp_title() {
        return comp_title;
    }

    public void setComp_title(String comp_title) {
        this.comp_title = comp_title;
    }

    public int getCust_id() {
        return cust_id;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }
    
}
