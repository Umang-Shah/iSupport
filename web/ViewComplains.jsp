<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="d"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="e"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaints</title>
        <%@  include file="head.jsp" %>
    </head>
    <body class="home">
        <!-- WRAPPER -->
            <div id="wrapper">
                <%@include file="navigation_moderator.jsp" %>
                <div id="main">

                    <!-- content -->
                    <div id="content">
                        <!-- title -->
                        <div id="page-title">
                            <span class="title">Pending Complaints</span>
                            <span class="subtitle">Sorted By Date & Time When Customer Have Registered The Complaint.</span>
                        </div>
                        <!-- ENDS title -->
                        <!-- page-content -->
                        <div id="page-content">

                            <div class="accordion">
                                <c:forEach  items="${ls}" var="comp">
                                    <h6><a href="#">${comp.comp_title}</a></h6>
                                    <div>
                                        <p>
                                        <div class="field text">
                                            <form method="post"  action="Add_to_Queue">
                                                <input type="hidden" value="${comp.comp_id}" name="compid">
                                                <table>                                                
                                                    <tr>
                                                        <td style="width: 150px">Complain Description</td>
                                                        <td>${comp.comp_desc}</td>
                                                    </tr>                                               
                                                    <tr>   
                                                        <td>Priority</td>
                                                        <td> <select name="priority">
                                                                <c:forEach items="${lst1}"  var="d">
                                                                    <option value="${d.priority_id}">${d.priority_desc}</option>
                                                                </c:forEach>
                                                            </select></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Category</td>
                                                        <td>    
                                                            <select name="category">
                                                                <c:forEach items="${lst2}"  var="e">
                                                                    <option value="${e.cat_id}">${e.cat_desc}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>	
                                                    <tr><td>&nbsp;</td>
                                                        <td><input type=submit Value="Add To Queue"></td>
                                                    </tr>
                                                </table>
                                                    
                                            </form>
                                        
                                        </div>
                                        </p> 
                                    </div>
                                </c:forEach> 

                            </div> 
                        </div>
                        <!-- ENDS page-content -->
                    </div>
                    <!-- ENDS content -->
                </div>
                <%@  include file="footer.jsp" %>
            </div>
            <!-- ENDS WRAPPER -->
    </body>

</html>
