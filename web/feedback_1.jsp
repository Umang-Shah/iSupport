<%-- 
    Document   : feedback
    Created on : Nov 9, 2012, 1:53:07 PM
    Author     : umang
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Reports</title>
        <%@include file="head.jsp" %>
    </head>
    <body>
       <form class="form-horizontal" method="post" action="">
           <!-- WRAPPER -->
        <div id="wrapper">
            <%@include file="navigation_admin.jsp" %>
            <div id="main">

                <!-- content -->
                <div id="content">
                    <!-- title -->
                    <div id="page-title">
                        <span class="title">Employee Reports</span>
                        <span class="subtitle"></span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
            
		
		<table>
                    <c:forEach var="count" items="${count_details}">  
			<tr>
				<td>Complain ID</td>
                                <td><label name="complainid">${count.compid}</label></td>
			</tr
                        <tr>
				<td>Complain Title</td>
                                <td><label name="comptitle" ></label></td>
			</tr>
                        
                        <tr>
				<td>Complain Description</td>
                                <td><label name="compdesc" >${count.desc}</label></td>
			</tr>
                        
                        <tr>
				<td>Feedback</td>
				<td><label name="compfeedback" >${count.feedback}</label></td>
			</tr>
                        </c:forEach>
                        <tr>
                        <td colspan="2" align=""><input type="Submit" Value="Print" name="btn" onclick="window.print();"></td>
                        </tr>
                        <hr>
                </table>
            
           </div>
                    <!-- ENDS page-content -->
                </div>
                <!-- ENDS content -->
            </div>
            <%@  include file="footer.jsp" %>
        </div>
        <!-- ENDS WRAPPER -->
       </form>
    </body>
</html>
