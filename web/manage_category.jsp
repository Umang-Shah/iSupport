<%-- 
    Document   : manage_category
    Created on : Nov 4, 2012, 11:26:07 AM
    Author     : Harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Category</title>
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
					<span class="title">Categories</span>
					<span class="subtitle">Sort by Category Name</span>
                                        <br><p style="text-align: right;"><a href="admin_add_cat.jsp" title="Add Category" rel="group" class="fancybox"><img src="images/add.png" style="height: 50px;vertical-align: middle"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				</div>
				<!-- ENDS title -->
				
				<!-- page-content -->
				<div id="page-content">
        
           <div class="accordion">
               <c:forEach var="cat" items="${cat_details}">
                   <h6><a href="#">${cat.cat_desc}</a></h6>
			<div>
                                    <p>
                                        <div class="field text">
                                            <table>                                                
                                                <tr>
                                                    <td style="width: 150px">Category Name</td>
                                                    <td>${cat.cat_desc}</td>
                                                </tr>
                                                
                                                    <tr>                                           
                                                        <td style="text-align: center"><a title="Delete" href="dlt_cat?a=${cat.cat_id}" name="btn" style="color: red" onclick="return confirm('Are You Sure ?');"><img src="images/delete1.png" style="height: 32px;"></a></td>
                                                        <td>
                                                            <a title="Update Detail" href="show_category?a=${cat.cat_id}" rel="group1" name="btn" class="fancybox"><img src="images/edit.png" style="height: 34px;vertical-align: text-bottom"></a>
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
