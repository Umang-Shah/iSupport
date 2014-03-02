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

        <META HTTP-EQUIV="REFRESH" CONTENT="1; URL=javascript:ReloadPage()">


        <title>Pending Complaints</title>
        <%
            int len = Integer.parseInt(request.getAttribute("len").toString());


        %>  
        <script type="text/javascript">
            <!--  
            var len = <%=len%>;
            function results()
            {
                if(len==0){
                    var res="No Pending Complaints";
                    document.forma.res.value=res;
                }
    
            }
        </script>
        <%@include file="head.jsp" %>

    </head>
    <body>

        <!-- WRAPPER -->
        <div id="wrapper">
            <%@include file="navigation_att.jsp" %>
            <div id="main">

                <!-- content -->
                <div id="content">
                    <!-- title -->
                    <div id="page-title">
                        <span class="title">Pending Complaints</span>
                        <span class="subtitle">Sorted By Time Of The Complaint.</span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
                        <table>
                            <tr>
                                <th>Complain Id</th>
                                <th>Complain Title</th>
                                <th>Complain Description</th>
                                <th>Priority</th>
                            </tr>
                            <c:forEach items="${comps}"  var="comp" >  
                                <form id="myform" class="form-horizontal" method="post" action="solve?comp_id=${comp.comp_id}" name="forma">
                                    <tr>  
                                        <td align="center">${comp.comp_id}</td>
                                        <td align="center">
                                            ${comp.comp_title}  
                                        </td>
                                        <td style="text-align: center">
                                            ${comp.comp_desc}  
                                        </td>
                                        <td style="text-align: center">
                                            ${comp.priority_desc}  
                                        </td>
                                        <td>
                                            <input type="submit" Value="Start">  
                                        </td>
                                    </tr>  
                                </form>
                            </c:forEach>  
                            <tr><td><input type="hidden" name="comp_id"/></td></tr>
                        </table>
                        <input type="text" name="res" readonly style="border: 0px solid #000000;"/>
                    </div>
                    <!-- ENDS page-content -->
                </div>
                <!-- ENDS content -->
            </div>
            <%@  include file="footer.jsp" %>
        </div>
        <!-- ENDS WRAPPER -->

        <script>  
            <!--
            results();
            //-->
        </script>
    </body>

</html>
