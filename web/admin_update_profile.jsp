<%-- 
    Document   : admin_update_profile
    Created on : Oct 30, 2012, 11:08:21 AM
    Author     : Kushal
--%>

<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Profile</title>
                <link rel="stylesheet" href="css/jquery-ui.css" />
                <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" /> 
                <script src="js/jquery-1.8.2.js"></script>
                <script src="js/jquery-ui.js"></script>
                           <script>
    $(function() {
        $( "#datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
    </script>
   
		<%@include file="head.jsp" %>
                <script type="text/javascript">
function b()
{       
var j=0;
var a=document.getElementById('fnames').value;
if(a==null || a=="")
    {
        document.getElementById('L1').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L1').style.display='none';
    }
var z=document.getElementById('cno').value;  
   if(isNaN(z)||z.indexOf(" ")!=-1)
       {
           document.getElementById('L6').style.display='block';
           j=1;
       }
       else
           {
               document.getElementById('L6').style.display='none';
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
                    <%@include file="navigation_admin.jsp" %>
			<!-- MAIN -->
			<div id="main">
				<!-- content -->
				<div id="content">
				<!-- title -->
				<div id="page-title">
					<span class="title">Update Profile</span>
					<span class="subtitle">Hear you can Update your Profile Details.</span>
				</div>
				<!-- ENDS title -->
			<!-- page-content -->
                                                                    <%      
                                                                                Employee e=new Employee(uid);
                                                                                dbConn.connect();
                                                                                String fn=null,ln=null,cno=null,Add=null,dob=null;
                                                                                rs = dbConn.customQuery("SELECT * FROM employee WHERE Employee_id = '"+ uid +"'" );
                                                                                while(rs.next())
                                                                                {
                                                                                    fn=rs.getString(2);
                                                                                    ln=rs.getString(3);
                                                                                    Add=rs.getString(5);
                                                                                    cno=rs.getString(6);
                                                                                    dob=rs.getString(9);
                                                                                }
                                                                             %>
                            <div id="page-content">
                                    <form method="post" name="updtform" id="contacts-form" action="admin_update_detail" defaultbutton="Update" defaultfocus="un" onsubmit="return b()">
                                        <div class="field text">
                                            <label><span>* </span> First Name :</label>
                                            <input value="<%=fn%>" maxlength="30" id="fnames" type="text" name="User_fname">
                                        
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L1" style="width: 250px;display:none;"><span>Please Enter Your First Name</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span> Last Name :</label>
                                            <input value="<%=ln%>" maxlength="30"id="lnames" type="text" name="User_lname">
                                        </div>                      
                                        <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                        
                                        <div class="field text">
                                            <label><span>&nbsp;</span> Contact Number :</label>
                                            <input maxlength="14" id="cno" value="<%=cno%>" type="text" name="cno">
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L6" style="width: 250px;display: none"><span>Please Enter Only Numeric Values</span></label>
                                        </div>
                                        <div class="field text" style="height: 100px">
                                            <label><span>&nbsp;</span> Address :</label>
                                            <textarea name="add" style="height: 100px; width: 300px"><%=Add%></textarea>
                                        </div>
                                        <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span> Date of Birth :</label>
                                            <input value="<%=dob%>" readonly="readonly" type="text"  id="datepicker"  name="datepicker"/>(MM/DD/YYYY)
                                        </div>                      
                                        <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="Submit" value="Update" id="Update" name="Update" style="width: 100px;">
                                        </div>
                                        </form>
				</div>
				<!-- ENDS content -->
				<!-- Twitter -->
				<!-- ENDS Twitter -->
			</div>
                        </div>
			<!-- ENDS MAIN -->
			<%@include file="footer.jsp" %>
                </div>
		<!-- ENDS WRAPPER -->
	</body>
</html>
