/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.login;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.login_m;

/**
 *
 * @author Umang
 */
@WebServlet(name = "login_c", urlPatterns = {"/login_c"})
public class login_c extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            login l=new login();
            HttpSession session=request.getSession(true);
            String  uid = request.getParameter("un");
            String  password = request.getParameter("pw");
            l.setemail(uid);
            l.setpassword(password);
            login_m log=new login_m();
            l=log.checklogin(l);
            if(l!=null)
            {
                session.setAttribute("userid",l.getid());
                session.setAttribute("Login",l.gettype());
                if(l.gettype().equals("admin"))
                {
                    session.setAttribute("userid",l.getid());
                    session.setAttribute("Login",l.gettype());
                    session.setAttribute("email",l.getemail());
                    response.sendRedirect("admin_home.jsp");
                }
                else if(l.gettype().equals("customer"))
                {
                    session.setAttribute("userid",l.getid());
                    session.setAttribute("Login",l.gettype());
                    session.setAttribute("email",l.getemail());
                    response.sendRedirect("cust_home.jsp");
                }
            }
            else
            {
                    session.setAttribute("Login","False");
                    response.sendRedirect("index.jsp");
            }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login_c.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login_c.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
