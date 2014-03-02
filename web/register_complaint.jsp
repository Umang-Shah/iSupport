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
		<title>Register Complaint</title>
		<%@include file="head.jsp" %>
                       <script type="text/javascript">
function b()
{       
var j=0;
var a=document.getElementById('sub').value;
if(a==null || a=="")
    {
        document.getElementById('L1').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L1').style.display='none';
    }
var z=document.getElementById('com').value;  
if(z==null || z=="")
    {
        document.getElementById('L2').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L2').style.display='none';
    }
   
  if(j==1)
      {
          return false;
      }
}
</script>
	</head>
	<body class="home">
		<!-- WRAPPER -->
		<div id="wrapper">
			
			
                        <%@include file="navigation.jsp" %>
			<div id="main">
			
			<!-- content -->
			<div id="content">
				
				<!-- title -->
				<div id="page-title">
					<span class="title">Register Complaint</span>
					<span class="subtitle">Register your Complain.</span>
				</div>
				<!-- ENDS title -->
				
				<!-- page-content -->
				<div id="page-content">
                                    <form method="post" name="regcom" id="contacts-form" action="reg_com_c" defaultbutton="submit" defaultfocus="sub" onsubmit="return b()">
                                        <div class="field text">
                                            <label><span>* </span> Subject :</label>
                                            <input value="" maxlength="30" id="sub" type="text" name="sub">
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L1" style="width: 250px;display:none;"><span>Please Enter Subject</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>* </span> Complain :</label>
                                            <textarea id="com" name="com"></textarea>
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L2" style="width: 250px;display:none;"><span>Please Enter Your Complain</span></label>
                                        </div>
                                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                        <div class="field text">
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="Submit" value="Submit" id="submit" name="submit" style="width: 100px;">
                                        </div>
                                        </form>
				</div>
				<!-- ENDS page-content -->

			</div>
			<!-- ENDS content -->
			</div>
		<!-- ENDS MAIN -->
                    <%@include file="footer.jsp" %>
		</div>
		<!-- ENDS WRAPPER -->
	</body>
</html>