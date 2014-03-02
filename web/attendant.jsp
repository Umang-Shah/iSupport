<%-- 
    Document   : attendant
    Created on : Nov 8, 2012, 4:59:36 PM
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
          
              <!-- WRAPPER -->
        <div id="wrapper">
            <%@include file="navigation_admin.jsp" %>
            <div id="main">

                <!-- content -->
                <div id="content">
                    <!-- title -->
                    <div id="page-title">
                        <span class="title">Attendants Reports</span>
                        <span class="subtitle"></span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
                        <form class="form-horizontal" method="post" name="form4" action="Report7">
           <table>
                <tr>
                    <td colspan="2">1) Complains according to category and level </td>
                </tr>
                <tr>
                    <td style="width: 150px">Category Name</td>
                    <td>Level Name</td>
                </tr>
                <tr>
                    <td>    
                        <select name="category">
                            <c:forEach items="${list2}"  var="t">
                                <option value="${t.categorydes}">${t.categorydes}</option>
                            </c:forEach>
                        </select>
                    </td> 
                    <td>    
                        <select name="level">
                            <c:forEach items="${list2}"  var="l">
                                <option value="${l.levelname}">${l.levelname}</option>
                            </c:forEach>
                        </select>
                    </td> 
                </tr>
                <tr>
                    <td><input type="Submit" Value="Generate Report" name="btn" ></td>
                </tr>
           </table>
           </form>
                <form class="form-horizontal" method="post" name="form3" action="Report3">
                    <table>
                <tr>
                    <td colspan="2">2) Complains Resolved by particular attendant </td>
                </tr>
                <tr>
                    <td>Employee ID</td>
                    <td>    
                        <select name="attendant">
                            <c:forEach items="${employee}"  var="a">
                                <option value="${a.empid}">${a.empid}</option>
                            </c:forEach>
                        </select>
                    </td> 
                </tr>
                <tr>	
                    <td colspan="2"><input type="Submit" Value="GenerateReport" name="btn"></td>
                </tr>
           </table>
           </form>
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
