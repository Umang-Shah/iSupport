
<!-- HEADER -->
<div id="header">
<%
Object uid =session.getAttribute("userid");
String user=session.getAttribute("email").toString();
Object lgn =session.getAttribute("Login");
if(lgn!="customer")
{
    response.sendRedirect("Logout");
}
%>
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
					<li ><a href="cust_home.jsp">HOME</a></li>
					<li><a hef="#">COMPLAIN</a>
						<ul>
							<li><a href="register_complaint.jsp">Register Complain</a></li>
							<li><a href="complains.jsp">Your Complains</a></li>
							<li><a href="recomplain.jsp">Re-Complain</a></li>
                                                        <li><a href="comment.jsp">Feedback</a></li>	
						</ul>
					</li>
                                        <li><a hef="#">MY ACCOUNT</a>
						<ul>
                                                        <li><a href="show_detail">Update Profile</a></li>
							<li><a href="change_password.jsp">Chang Password</a></li>
						</ul>
					</li>
                                        
					<li><a href="">FAQs</a></li>
                                        
				</ul>
				<!-- Navigation -->	
				
				<!-- search -->
				<div class="top-search">
                                    <p style="color: white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome ! <%= user %></p>
				</div>
				<!-- ENDS search -->
				
				<!-- headline -->
				
				<!-- ENDS headline -->
				<!-- Breadcrumb-->
			<div id="breadcrumbs">
				<a title="Home" href="index.html">Home</a>
				<a title="Complaint"  href="#">Complaint</a>
				Register Complaint
			</div>
			<!-- ENDS Breadcrumb-->	
				
			</div>

<!-- ENDS HEADER -->