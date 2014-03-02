<%-- 
    Document   : complain
    Created on : Nov 8, 2012, 6:49:02 PM
    Author     : umang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Reports</title>
        <%@include file="head.jsp" %>
    </head>
    <body>
        <form class="form-horizontal" method="post" name="form6" action="report5">
            <!-- WRAPPER -->
        <div id="wrapper">
            <%@include file="navigation_admin.jsp" %>
            <div id="main">

                <!-- content -->
                <div id="content">
                    <!-- title -->
                    <div id="page-title">
                        <span class="title">Complain Reports</span>
                        <span class="subtitle"></span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
            <table>
                <tr>
                    <td>
                        1)Complains According to Priority
                    </td>
                </tr>
                <tr>
                    <td><input type="Submit" Value="Generate Report" name="btn"></td>
                </tr>
               
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
