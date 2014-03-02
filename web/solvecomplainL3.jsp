<%-- 
    Document   : solvecomplain
    Created on : Nov 2, 2012, 5:10:40 PM
    Author     : durva
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html><head>  
        <%@include file="head.jsp" %>
        <script type="text/javascript">
            function b()
            {       
                var a=document.getElementById('sol').value;
                if(a==null || a=="")
                {
                    document.getElementById('L1').style.display='block';
                    return false;
                }
                else
                {
                    document.getElementById('L1').style.display='none';
                    return true;
                }
                return true;
            }
        </script>
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
                        <span class="title">Solve Complaint</span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
                        <c:forEach items="${comps}"  var="comp"> 
                            <form name="forma" method="post" id="contacts-form" action="solved" onsubmit="return b()">  
                                <input type="hidden" name="comp_id" />   
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>&nbsp; </span> Complain ID </label>
                                    <input value="${comp.comp_id}" maxlength="30" type="text" name="compid" readonly  style="border:0px solid black;">
                                </div>
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>&nbsp; </span> Complain Title </label>
                                    <label>${comp.comp_title}</label>
                                </div>
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>&nbsp; </span> Description </label>
                                    <textarea id="des" name="des" style="height: 200px;" readonly="readonly">${comp.comp_desc}</textarea>
                                </div>
                                <br><br><br><br><br><br><br><br><br>
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>* </span> Complain Solution </label>
                                    <textarea id="sol" name="sol" style="height: 200px;"></textarea>
                                </div>
                                <div class="field text">
                                    <label>&nbsp;</label>
                                    <label id="L1" style="width: 250px;display:none;"><span>Please Enter Complain Solution</span></label>
                                </div>
                                <br><br><br><br><br><br><br>
                                <div class="field text">
                                    <label>&nbsp;</label>
                                    <label id="L1" style="width: 250px;display:none;"><span>Please Enter Complain Solution</span></label>
                                </div>
                                <table><tr><td width="100px;">&nbsp;</td><td><input type="submit" value="Submit" style="width: 150px;"></td>
                                </table>
                            </form>         
                            <table><tr>

                                    <td width="100px;">&nbsp;</td><td><a href="cant_solve?compid=${comp.comp_id}" onclick="return confirm('Are You Sure ?');">Can't Solve</a></td>

                                </tr></table>
                            </c:forEach>        
                    </div>
                    <!-- ENDS page-content -->
                </div>
                <!-- ENDS content -->
            </div>
            <%@  include file="footer.jsp" %>
        </div>
        <!-- ENDS WRAPPER -->



    </body></html>  

