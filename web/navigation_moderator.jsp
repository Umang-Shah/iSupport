<%@page import="model.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DBConnection"%>
<%
Object uid = session.getAttribute("userid");
int lgn =Integer.parseInt(session.getAttribute("Login").toString());
if(lgn!=3)
{
    response.sendRedirect("Logout");
}
String user=session.getAttribute("email").toString();
%>
<!-- HEADER -->
<div id="header">

    <a href="mod_home.jsp"><img id="logo" src="images/logo4.png" alt="iSupport" title="Home" height="100"/></a>
                                
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
					<li ><a href="moderator_home.jsp">Home</a></li>
					
                                        <li><a href="ShowComplaints">View Complaints</a></li>
                                        <li><a hef="#">My Account</a>
						<ul>
                                                        <li><a href="mod_show_detail">Update Profile</a></li>
							<li><a href="mod_change_password.jsp">Chang Password</a></li>
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
			<!-- ENDS Breadcrumb-->	
				
			</div>

<!-- ENDS HEADER -->