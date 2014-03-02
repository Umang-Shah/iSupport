<%-- 
    Document   : customer
    Created on : Nov 8, 2012, 4:06:36 PM
    Author     : umang
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/ui-lightness/jquery-ui-1.9.1.custom.css" rel="stylesheet">
        <script src="js/jquery-1.8.2.js"></script>
        <script src="js/jquery-ui-1.9.1.custom.js"></script>
        <script>
            $(function() {
                $( "#datepicker" ).datepicker({
                    dateFormat: "mm-dd-yy",
                    changeMonth: true,
                    changeYear: true
                });
                $( "#datepicker2" ).datepicker({
                    dateFormat: "mm-dd-yy",
                    changeMonth: true,
                    changeYear: true
                });
            });
        </script>
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
                        <span class="title">Customer Reports</span>
                        <span class="subtitle"></span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
        <form class="form-horizontal" method="post" name="form2" action="Report2">
                        <table>
            <tr>
                    <td colspan="2">1)Complains According to time Duration </td>
            </tr>   
                <tr>
                    <td>Start Date</td>
                    <td>End Date</td>
                </tr>
                <tr>
                    <td><input type="text" id="datepicker" name="startdate" value="" readonly></td>
                    <td><input type="text" id="datepicker2" name="enddate" value="" readonly></td>
                </tr>
                <tr>
                    <td><input type="Submit" Value="Generate Report" name="btn"></td>
                </tr>
            </table>
    </form>
        <form class="form-horizontal" method="post" name="form5" action="report4">
            <table>
                <tr>
                    <td colspan="2">
                        2) Complains According to Customer
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">  Customer ID</td>
                    <td>    
                        <select name="customer" >
                            <c:forEach items="${cust}"  var="c">
                                <option value="${c.custid}">${c.custid}</option>
                            </c:forEach>
                        </select>
                    </td> 
                </tr>
                <tr>
                    <td><input type="Submit" Value="Generate Report" name="btn"></td>
                </tr>
            </table>
                </form>
        
        <form class="form-horizontal" method="post" name="form3" action="feedback">
            <table>
                <tr>
                    <td colspan="2">3) Feedback of Complain</td>
                </tr>
                <tr>
                    <td style="width: 150px">Customer ID</td>
                    <td >    
                        <select name="customer" >
                            <c:forEach items="${cust}"  var="c">
                                <option value="${c.custid}">${c.custid}</option>
                            </c:forEach>
                        </select>
                    </td> 
                </tr>
                <tr>
                    <td><input type="Submit" Value="Generate Report" name="btn"></td>
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
