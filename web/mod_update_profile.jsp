<%-- 
    Document   : mod_update_profile
    Created on : Oct 30, 2012, 11:08:21 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          
      }
      else
          {
            $.ajax({
                        url:"mod_update_detail",
                        type:"POST",
                        data:{fnames:$("#fnames").val(),lnames:$("#lnames").val(),cno:$("#cno").val(),add:$("#add").val(),datepicker:$("#datepicker").val()},    
                        success:function(dt){
                            alert(dt);
                        }
                    });
           }
}
</script>
    </head>
    <body class="home">
		<!-- WRAPPER -->
		<div id="wrapper">
                    <%@include file="navigation_moderator.jsp" %>
			<!-- MAIN -->
			<div id="main">
				<!-- content -->
				<div id="content">
				<!-- title -->
				<div id="page-title">
					<span class="title">Update Profile</span>
					<span class="subtitle">Here you can Update your Profile Details.</span>
				</div>
				<!-- ENDS title -->
			<!-- page-content -->
                                                                   
                            <div id="page-content">
                                    <form name="updtform" id="contacts-form">
                                        <c:forEach var="emp" items="${emp_details}">  
                                        <div class="field text">
                                            <label><span>* </span> First Name :</label>
                                            <input value="${emp.emp_first_name}" maxlength="30" id="fnames" type="text" name="User_fname">
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L1" style="width: 250px;display:none;"><span>Please Enter Your First Name</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span> Last Name :</label>
                                            <input value="${emp.emp_last_name}" maxlength="30" id="lnames" type="text" name="User_lname">
                                        </div>                      
                                        <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                        
                                        <div class="field text">
                                            <label><span>&nbsp;</span> Contact Number :</label>
                                            <input maxlength="14" id="cno" value="${emp.emp_contact_no}" type="text" name="cno">
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L6" style="width: 250px;display: none"><span>Please Enter Only Numeric Values</span></label>
                                        </div>
                                        <div class="field text" style="height: 100px">
                                            <label><span>&nbsp;</span> Address :</label>
                                            <textarea name="add" id="add" style="height: 100px; width: 300px">${emp.emp_address}</textarea>
                                        </div>
                                        <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span> Date of Birth :</label>
                                            <input value="${emp.dob}" maxlength="30" readonly="readonly" type="text" id="datepicker"  name="datepicker">(MM/DD/YYYY)
                                        </div>                      
                                        <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="button" onclick="b();" value="Update" id="Update" name="Update" style="width: 100px;">
                                        </div>
                                        </c:forEach> 
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
