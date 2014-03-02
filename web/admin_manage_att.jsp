<%-- 
    Document   : admin_manage_att
    Created on : Nov 3, 2012, 10:39:20 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Attendant</title>
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
					<span class="title">Attendants</span>
					<span class="subtitle">Sorted by Attendant's Email Id</span>
                                        <br><p style="text-align: right;"><a href="show_add_att" title="Add Attendant" rel="group" class="fancybox"><img src="images/add.png" style="height: 50px;vertical-align: middle"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				</div>
				<!-- ENDS title -->
				
				<!-- page-content -->
				<div id="page-content">
        
           <div class="accordion">
               <c:forEach var="emp" items="${emp_details}">
                    <h6><a href="#">${emp.emp_email}</a></h6>
			<div>
                                    <p>
                                        <div class="field text">
                                            <table>
                                                <tr>
                                                    <td style="width: 150px">First Name</td>
                                                    <td>${emp.emp_first_name}</td>
                                                </tr>
                                                <tr>
                                                    <td>Last Name</td>
                                                    <td>${emp.emp_last_name}</td>
                                                </tr>
                                                <tr>
                                                    <td>Address</td>
                                                    <td>${emp.emp_address}</td>
                                                </tr>
                                                <tr>
                                                    <td>Contact Number</td>
                                                    <td>${emp.emp_contact_no}</td>
                                                </tr>
                                                <tr>
                                                    <td>Category</td>
                                                    <td>${emp.cat}</td>
                                                </tr>
                                                <tr>
                                                    <td>Level</td>
                                                    <td>${emp.level}</td>
                                                </tr>
                                                <tr>
                                                    <td>Date of Birth</td>
                                                    <td>${emp.dob} (MM/DD/YYYY)</td>
                                                </tr>
                                                <tr>
                                                    <td>Date of Joining</td>
                                                    <td>${emp.doj} (MM/DD/YYYY)</td>
                                                </tr>
                                                    <tr>                                           
                                                        <td style="text-align: center"><a title="Delete" href="dlt_att?a=${emp.emp_id}" name="btn" style="color: red"  onclick="return confirm('Are You Sure ?');"><img src="images/delete1.png" style="height: 32px;"></a></td>
                                                        <td>
                                                            <a title="Update Details of ${emp.emp_email}" href="show_att?a=${emp.emp_id}" rel="group1" name="btn" class="fancybox"><img src="images/edit.png" style="height: 34px;vertical-align: text-bottom"></a>
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
