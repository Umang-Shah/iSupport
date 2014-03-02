<%-- 
    Document   : pending_complaints_list
    Created on : Nov 2, 2012, 5:10:40 PM
    Author     : durva
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solved Complaints</title>
        <%@  include file="head.jsp" %>
    </head>
    <body class="home">
        <!-- WRAPPER -->
        <div id="wrapper">
            <%@include file="navigation_att.jsp" %>
            <div id="main">

                <!-- content -->
                <div id="content">
                    <!-- title -->
                    <div id="page-title">
                        <span class="title">UnSolved Complains</span>
                        <span class="subtitle">Sorted By Date & Time</span>
                    </div>
                    <div id="page-content">
                        <div class="accordion">
                            <c:forEach items="${comps}"  var="comp" >  
                                <h6><a href="#">${comp.comp_id}</a></h6>
                                <div>
                                    <p>
                                    <div class="field text">
                                        <table>
                                            <tr>
                                                <td>Complain ID</td><td id="compid-${comp.comp_id}">${comp.comp_id}</td></tr>
                                            <tr>
                                                <td>Complain Title</td><td>
                                                    ${comp.comp_title}  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Complain Description</td><td>${comp.comp_desc}</td>
                                            </tr>
                                            <tr>
                                                <td>Complain Solution</td><td>${comp.solution}</td>
                                            </tr>
                                        </table>            
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