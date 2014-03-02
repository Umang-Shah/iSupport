<%-- 
    Document   : login
    Created on : Oct 22, 2012, 7:09:05 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
    </head>
    <body>
        <div id="main">
				<!-- content -->
				<div id="content">
                                    <form method="post" name="loginform" id="loginform" align="center" action="login_c" defaultbutton="loginsubmit" defaultfocus="un" onsubmit="return validateForm()">
                                        <table border="0">
                                            <thead>
                                                <tr>
                                                    <th colspan="2" align="center"> <h6> Login</h6></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr></tr>
                                                <tr>
                                                    <td>User Name</td>
                                                    <td><input type="email" value="Email Id" name="un" id="un" onfocus="defaultInput(this)" onblur="clearun(this)" /></td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>Password</td>
                                                    <td><input type="password" value="Password" name="pw" id="pw" onfocus="defaultInput(this)" onblur="clearpw(this)" /></td>
                                                </tr>
                                                <tr> </tr>
                                                <tr>
                                                    <td align="right"><input type="reset" value="Clear" /></td>
                                                    <td><input type="submit" value="Login" id="loginsubmit" name="loginsubmit"/></td>
                                                </tr>
                                                <tr></tr>
                                                <tr>
                                                    <td colspan="2" align="center"><a href="forgotpwd.jsp">Forgot Password</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
				</div>
				<!-- ENDS content -->
				<!-- Twitter -->
				<!-- ENDS Twitter -->
			</div>
    </body>
</html>
