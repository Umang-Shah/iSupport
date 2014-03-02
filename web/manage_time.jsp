<%-- 
    Document   : manage_time
    Created on : 31 Oct, 2012, 12:50:30 PM
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
					<span class="title">Manage Time</span>
					<span class="subtitle">Time for Highest Level is Unlimited</span>
                                        <span class="subtitle"></span>
				</div>
				<!-- ENDS title -->
				
				<!-- page-content -->
				<div id="page-content">
        
           <div class="accordion">
               <c:forEach var="time" items="${time_details}">
                   <h6><a href="#">${time.level_name} for Category ${time.category_desc}</a></h6>
			<div>
                            <p>
                                        <div class="field text">
                                            <table>                     
                                                <tr>
                                                    <td style="width: 150px">Level Name</td>
                                                    <td>${time.level_name}</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px">Category Name</td>
                                                    <td>${time.category_desc}</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 150px">Time</td>
                                                    <td>${time.time}</td>
                                                </tr>
                                                    <tr>                                           
                                                        
                                                        <td style="text-align: center">
                                                            <a title="Update Detail" href="show_time?a=${time.level_id}&b=${time.cat_id}" rel="group1" name="btn" class="fancybox"><img src="images/edit.png" style="height: 34px;vertical-align: text-bottom"></a>
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
