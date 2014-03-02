<%-- 
    Document   : employee
    Created on : Nov 8, 2012, 2:47:53 PM
    Author     : umang
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <META HTTP-EQUIV="REFRESH" CONTENT="1; URL=javascript:ReloadPage()">


        <title>Reports</title>
        <%@include file="head.jsp" %>

    </head>
    <body>
<form class="form-horizontal" method="post" name="form1" action="complaincategory">
        <!-- WRAPPER -->
        <div id="wrapper">
            <%@include file="navigation_admin.jsp" %>
            <div id="main">

                <!-- content -->
                <div id="content">
                    <!-- title -->
                    <div id="page-title">
                        <span class="title">Moderator Report</span>
                        <span class="subtitle"></span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
                         <table>
                
                <tr>
                    <td colspan="2">1) Category wise Complains </td>
                </tr>
                <tr>
                    <td style="width: 150px" >Category Name</td>
                    <td style="text-align: left">  
                        
                        <select name="category">
                            <c:forEach items="${list2}"  var="t">
                                <option value="${t.categorydes}">${t.categorydes}</option>
                           </c:forEach>
                        </select>
                    </td> 
                </tr>
                <tr>
                    <td colspan="2"><input type="Submit" Value="GenerateReport" name="btn"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"> <input type="text" name="res" readonly style="border: 0px solid #000000;"/></td>
                </tr>
                </form>
                
            </table>
                       
                    </div>
                    <!-- ENDS page-content -->
                </div>
                <!-- ENDS content -->
            </div>
            <%@  include file="footer.jsp" %>
        </div>
        <!-- ENDS WRAPPER -->
        </form>>
    </body>

</html>
