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
    <title>Home</title>
    <script type="text/javascript">    
function validateForm()
{
    var x=document.forms["loginform"]["un"].value;
    if (x==null || x=="" || x=="Email Id") 
    {
      alert("Please Enter Your Email Id");
      return false;
    }
    else
    {
            var y=document.forms["loginform"]["pw"].value;
            if(y==null || y=="" || y=="Password")
            {
                alert("Please Enter Your Password");
                return false;
            }
            else
            {
                return true;
            }
    }
}
</script>
<script type="text/javascript">
function error()
{
    var a=document.forms["temp"]["hdn"].value;
    if(a=="False")
        {
            alert("Invalide User Name or Password")
        }
}
</script>

    <%@  include file="head.jsp" %>
</head>
<body class="home" onload="error()">
    <%Object Login=session.getAttribute("Login");%>
    <form name="temp">
    <input type="hidden" value="<%=Login%>" id="hdn" name="hdn">
    </form>
    <%
        session.removeAttribute("userid");
        session.removeAttribute("Login");
    %>
    <!-- WRAPPER -->
    <div id="wrapper">
        <!-- HEADER -->
        <div id="header">
            <a href="index.jsp">    
                <img height="150px" id="logo" src="images/logo.jpg" alt="Help Desk" title="Home" /></a>
            <!-- Social -->
            <div id="social-holder">
                <ul class="social">
                    <li><a href="http://www.facebook.com" class="poshytip facebook" title="Become a fan" target="_blank">
                    </a></li>
                    <li><a href="http://www.twitter.com" class="poshytip twitter" title="Follow our tweets" target="_blank">
                    </a></li>
                    <li><a href="http://www.youtube.com" class="poshytip youtube" title="View our videos" target="_blank">
                    </a></li>
                    <%--<li><a href="#" class="poshytip login" id="flip" title="Click hear to Login"></a>
                        <div id="panel">
                            <div class="top-login">
                                <form method="post" name="loginform" id="loginform" align="center" action="Login" defaultbutton="loginsubmit" defaultfocus="un" onsubmit="return validateForm()">
                                    <input type="email" value="Email Id" name="un" id="un" onfocus="defaultInput(this)"
                                        onblur="clearun(this)" />
                                    <br>
                                    <input type="password" value="Password" name="pw" id="pw" onfocus="defaultInput(this)"
                                        onblur="clearpw(this)" />
                                    <br>
                                    <input type="submit" value="Login" id="loginsubmit" name="loginsubmit"/><input type="reset" value="Clear" />
                                    <br>
                                    <a href="footer.jsp" id="fp" title="Click Hear to Recover Your Password" align="center">Forgot Password</a>
                                </form>
                                
                            </div>
                        </div>
                    </li>--%>
                    
                    <li><a href="login.jsp" rel="group1" class="fancybox"><img src="img/social-icons/circular/login.png" class="poshytip login" title="Click hear to Login"></a></li>
                    
                </ul>
            </div>
            <!-- ENDS Social -->
        </div>
        <!-- ENDS HEADER -->
        <!-- Slider -->
        <div id="slider-block">
            <div id="slider-holder">
                <div id="slider">
                    <img src="images/01.jpg" title="Welcome to the Next Generation of Help Desk" />
                    <img src="images/02.jpg" title="Welcome to the Next Generation of Help Desk" />
                    <img src="images/03.png" title="to the Next Generation of Help Desk" />
                    <img src="images/04.jpg" title="You can also look out at our various products" />
                    <img src="images/05.png" title="You can also look out at our various products" />
                    <img src="images/06.png" title="You can also look out at our various products" />
                </div>
            </div>
        </div>
        <!-- ENDS Slider -->
        <%@  include file="footer.jsp" %>
    </div>
    <!-- ENDS WRAPPER -->
</body>
</html>