
<%-- 
    Document   : manage_level
    Created on : 31 Oct, 2012, 8:24:18 AM
    Author     : harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Level</title>
    <%@  include file="head.jsp" %>
    </head>
    <body class="home">
    <!-- WRAPPER -->
    <div id="wrapper">
                     <%@include file="navigation_admin.jsp" %>
        <div id="main">
			
			<!-- content -->
			<div id="content">
				
				<!-- title -->
				<div id="page-title">
					<span class="title">Manage Level</span>
                                        <span class="subtitle">Sort by Level Name</span><br>
                                        <p style="text-align: right;"><a href="admin_add_level.jsp" title="Add Level" rel="group" class="fancybox"><img src="images/add.png" style="height: 50px;vertical-align: middle"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				</div>
                                
				<!-- ENDS title -->
				<!-- page-content -->
				<div id="page-content">
                                
           <div class="accordion">
               
               <c:forEach var="level" items="${level_details}">
                   <h6><a href="#">${level.level_name}</a></h6>
			<div>
                                    <p>
                                        <div class="field text">
                                            <table>                             
                                                <tr>
                                                    <td style="width: 150px">Level Name</td>
                                                    <td>${level.level_name}</td>
                                                </tr>
                                                
                                                    <tr>                                           
                                                        <td style="text-align: center"><a title="Delete" href="dlt_level?a=${level.level_id}" name="btn" style="color: red" onclick="return confirm('Are You Sure ?');"><img src="images/delete1.png" style="height: 32px;"></a></td>
                                                        <td>
                                                            <a title="Update Detail" href="show_level?a=${level.level_id}" rel="group1" name="btn" class="fancybox"><img src="images/edit.png" style="height: 34px;vertical-align: text-bottom"></a>
                                                        </td>
                                                    </tr>
                                            </table>
                                        </div>
                                       </p> 
                                </div>
            </c:forEach> 
            
            </div> 
       </table>		
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
