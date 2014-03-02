/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.attendant;

import beans.complain_list;
import beans.employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.Attendant;

/**
 *
 * @author Umang
 */
@WebServlet(name = "solve", urlPatterns = {"/solve"})
public class solve extends HttpServlet {

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
            RequestDispatcher rd;
            HttpSession session = request.getSession(true);
            employee e = new employee();
            e.setEmp_id(Integer.parseInt(session.getAttribute("userid").toString()));
            Attendant ey = new Attendant();
            complain_list c = new complain_list();
            c.setComp_id(Integer.parseInt(request.getParameter("comp_id")));
            List<complain_list> comps = ey.fetchComplain(c,e);
            int time = ey.fetchtime(e, c);
            request.setAttribute("time", time);
            request.setAttribute("comps", comps);
            request.setAttribute("compid", c.getComp_id());
            if (time == 0) {
                rd = request.getRequestDispatcher("solvecomplainL3.jsp");
            } else {
                if (e.getLevel_id() == 1) {
                    rd = request.getRequestDispatcher("solvecomplainL1.jsp");
                } else {
                    rd = request.getRequestDispatcher("solvecomplainL2.jsp");
                }
            }
            rd.forward(request, response);
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
            Logger.getLogger(solve.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(solve.class.getName()).log(Level.SEVERE, null, ex);
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
