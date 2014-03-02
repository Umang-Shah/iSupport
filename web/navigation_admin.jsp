<%@page import="java.sql.ResultSet"%>
<%@page import="Model.DBConnection"%>
<%
Object uid = session.getAttribute("userid");
Object user=null;
Object lgn = session.getAttribute("Login");
if(lgn!="Adm")
{
    response.sendRedirect("Logout");
}

        DBConnection dbConn = new DBConnection();
        dbConn.connect();
        ResultSet rs = dbConn.customQuery("SELECT Emp_Email FROM employee WHERE Employee_id = "+ uid);
        while(rs.next())
            {
                user=rs.getString(1);
            }
        
%>
<!-- HEADER -->
<div id="header">
				<a href="cust_home.jsp"><img id="logo" src="images/logo.jpg"/></a>
                                
				<!-- Social -->
				<div id="social-holder" >
                                    
					<ul class="social">
                    <li><a href="http://www.facebook.com" class="poshytip facebook" title="Become a fan" target="_blank">
                    </a></li>
                    <li><a href="http://www.twitter.com" class="poshytip twitter" title="Follow our tweets" target="_blank">
                    </a></li>
                    <li><a href="http://www.youtube.com" class="poshytip youtube" title="View our videos" target="_blank">
                    </a></li>
                    <li><a href="Logout" class="poshytip logout" title="Click hear to Logout"></a>
                    </li>
                </ul>
				</div>
				<!-- ENDS Social -->
                                 
				<!-- Navigation -->
				<ul id="nav" class="sf-menu" >
					<li ><a href="admin_home.jsp">HOME</a></li>
                                        
					<li><a hef="#">Manage</a>
						<ul>
							<li><a href="manage_category.jsp"> Category</a></li>
							<li><a href="manage_employee.jsp">Employee</a></li>
						</ul>
					</li>
					<li><a href="#">Reports</a></li>
                                        <li><a href="#">My Account</a>
                                            <ul>
                                                <li><a href="admin_update_profile.jsp"> Update Profile</a></li>
                                                <li><a href="admin_change_password.jsp">Change Password</a></li>
                                            </ul>
                                        </li>
				</ul>
				<!-- Navigation -->	
				
				<!-- search -->
				<div class="top-search">
                                    <p style="color: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome ! <%=user%></p>
				</div>
				<!-- ENDS search -->
				
				<!-- headline -->
				
				<!-- ENDS headline -->
				<!-- Breadcrumb-->
			<div id="breadcrumbs">
				<a title="Home" href="index.html">Home</a>
				<a title="Complaint"  href="features.html">Complaint</a>
				Register Complaint
			</div>
			<!-- ENDS Breadcrumb-->	
				
			</div>

<!-- ENDS HEADER -->