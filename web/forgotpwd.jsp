<%-- 
    Document   : index
    Created on : 14 Oct, 2012, 2:09:51 PM
    Author     : harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Forgot Password</title>
		<%@include file="head.jsp" %>
                              <script type="text/javascript">
function error()
{
    var a=document.forms["temp"]["hdn"].value;
    if(a!=null)
        {
    if (a=="True")
        {
            window.location = 'index.jsp';
            alert("Your Password is Send to your Email_Id Successfully.");
        }
    else if (a=="False")
        {
            alert("You are not Registered with this Email Id.");
        }
        }
}
function b()
{       
var j=0;
var a=document.getElementById('txt_email').value;
if(a==null || a=="")
    {
        document.getElementById('L1').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L1').style.display='none';
    }
  if(j==1)
      {
          return false;
      }
}
</script>
	</head>
	<body class="home" onload="error();">
    <%Object FP=session.getAttribute("FP");%>
    <form name="temp">
    
    <input type="hidden" name="hdn" id="hdn" value="<%= FP %>">
    </form>
    <% session.removeAttribute("FP");%>
		<!-- WRAPPER -->
		<div id="wrapper">
			
			<!-- HEADER -->
        <div id="header">
            <a href="index.jsp">    
                <img height="150px" id="logo" src="images/logo.jpg" alt="Help Desk" title="Home" /></a>
            <!-- Social -->
            <div id="social-holder">
                <ul class="social">
                    <li><a href="http://www.facebook.com" class="poshytip facebook" title="Become a fan">
                    </a></li>
                    <li><a href="http://www.twitter.com" class="poshytip twitter" title="Follow our tweets">
                    </a></li>
                    <li><a href="http://www.youtube.com" class="poshytip youtube" title="View our videos">
                    </a></li>
                    <li><a href="login.jsp" rel="group1" class="fancybox"><img src="img/social-icons/circular/login.png" class="poshytip login" title="Click hear to Login"></a></li>
                </ul>
            </div>
            <!-- ENDS Social -->
        </div>
        <!-- ENDS HEADER -->
			<!-- MAIN -->
			<div id="main">
				<!-- content -->
				<div id="content">
				<!-- title -->
				<div id="page-title">
					<span class="title">Forgot Password</span>
					<span class="subtitle"></span>
				</div>
				<!-- ENDS title -->
					<div id="page-content">
                                    <form method="post" name="regcom" id="contacts-form" action="forgotpw_c" defaultbutton="submit" defaultfocus="txt_email" onsubmit="return b()">
                                        <div class="field text">
                                            <label><span>* </span> Email :</label>
                                            <input type="email" id="txt_email" name="txt_email" value="" />
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L1" style="width: 250px;display:none;"><span>Please Enter Your Email Id</span></label>
                                        </div>
                                        
                                        <div class="field text">
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="Submit" value="Submit" id="submit" name="submit" style="width: 100px;">
                                        </div>
                                    </form>
				</div>
				</div>
				<!-- ENDS content -->
				<!-- Twitter -->
				<!-- ENDS Twitter -->
			</div>
			<!-- ENDS MAIN -->
			<%@include file="footer.jsp" %>
		</div>
		<!-- ENDS WRAPPER -->
	</body>
</html>