<%-- 
    Document   : admin_change_password
    Created on : Oct 30, 2012, 1:52:20 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        		<title>Change Password</title>
<script type="text/javascript">
function b()
{       
var j=0;
var a=document.getElementById('txt_old').value;
var b=document.getElementById('txt_new').value;
var c=document.getElementById('txt_confirm').value;
var k=document.getElementById('op').value;
if(a==null || a=="")
    {
        document.getElementById('L1').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L1').style.display='none';
        if(a!=k)
              {
                    document.getElementById('L5').style.display='block';
                    j=1;
              }
              else
                  {
                      document.getElementById('L5').style.display='none';
                  }

    }

if(b==null || b=="")
    {
        document.getElementById('L2').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L2').style.display='none';
    }

if(c==null || c=="")
    {
        document.getElementById('L3').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L3').style.display='none';
    }
if(c!=null && b!=null && c!="" && b!="" && c!=b)
    {
        document.getElementById('L4').style.display='block';
        j=1;
    }
    else
        {
            document.getElementById('L4').style.display='none';
        }
if(j==1)
      {
          return false;
      }
}
</script>
   <script type="text/javascript">
function error()
{
    var a=document.forms["temp"]["hdn"].value;
    if(a=="False")
        {
            alert("Something Goes Wrong")
        }
        else if(a=="True")
            {
                alert("Password Changed Successfully")
                window.location="admin_home.jsp";
            }
}
</script>
		<%@include file="head.jsp" %>
	</head>
	<body class="home" onload="error()">
<%Object Error=session.getAttribute("Success");
session.removeAttribute("Success");%>
<form name="temp">
    <input type="hidden" value="<%=Error%>" id="hdn" name="hdn">
</form>
		<!-- WRAPPER -->
		<div id="wrapper">
			<%@include file="navigation_admin.jsp" %>
			<!-- MAIN -->
			<div id="main">
                            
				<!-- content -->
				<div id="content">
                                    <!-- title -->
				<div id="page-title">
					<span class="title">Change Password</span>
					<span class="subtitle"></span>
				</div>
				<!-- ENDS title -->
                                
				<!-- page-content -->
				<div id="page-content">
                                    <form method="post" name="regcom" id="contacts-form" action="Admin_Chng_Pw" defaultbutton="submit" defaultfocus="txt_old" onsubmit="return b()">
                                                                <% 
                                                                    String ps=null;
                                                                    dbConn.connect();
                                                                    rs = dbConn.customQuery("SELECT Emp_Password FROM employee WHERE Employee_id = '"+ uid + "'");
                                                                    while(rs.next())
                                                                    {
                                                                        ps=rs.getString(1);
                                                                    }
                                                                    %>
                                                                    <input type="hidden" value="<%=ps%>" name="op" id="op">
                                        <div class="field text">
                                            <label><span>* </span> Old Password</label>
                                            <input type="password" name="txt_old" id="txt_old" value="" />
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L1" style="width: 250px;display:none;"><span>Please Enter Your Old Password</span></label>
                                            <label id="L5" style="width: 250px;display:none;"><span>Wrong Old Password</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>* </span> New Password</label>
                                            <input type="password" name="txt_new" id="txt_new" value="" />
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L2" style="width: 250px;display:none;"><span>Please Enter Your New Password</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>* </span> Confirm Password</label>
                                            <input type="password" name="txt_confirm" id="txt_confirm" value="" />
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L3" style="width: 250px;display:none;"><span>Please Re-Enter Your New Password</span></label>
                                            <label id="L4" style="width: 250px;display:none;"><span>Please Enter Same New Password</span></label>
                                        </div>
                                        
                                        <div class="field text">
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="Submit" value="Submit" id="submit" name="submit" style="width: 100px;">
                                        </div>
                                        </form>
				</div>
				<!-- ENDS page-content -->
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
