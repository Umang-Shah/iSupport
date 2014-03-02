<%-- 
    Document   : admin_add_att
    Created on : Nov 4, 2012, 1:05:02 AM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <link rel="stylesheet" href="css/jquery-ui.css" />
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
                var c=document.getElementById('email').value;
                if(c==null || c=="")
                {
                    document.getElementById('L10').style.display='block';
                    j=1;
                }
                else
                {
                    document.getElementById('L10').style.display='none';
                }

                var b=document.getElementById('add').value;
                if(b==null || b=="")
                {
                    document.getElementById('L7').style.display='block';
                    j=1;
                }
                else
                {
                    document.getElementById('L7').style.display='none';
                }
    
                var z=document.getElementById('cno').value;  
                if(z==null || z=="")
                {
                    document.getElementById('L8').style.display='block';
                    j=1;
                }
                else
                {
                    document.getElementById('L8').style.display='none';
        
                    if(isNaN(z)||z.indexOf(" ")!=-1)
                    {
                        document.getElementById('L6').style.display='block';
                        j=1;
                    }
                    else
                    {
                        document.getElementById('L6').style.display='none';
                    }
                }
                var txtDate=document.getElementById('dob').value;  
                var aoDate,separator,txtDate,            // needed for creating array and object
                ms,               // date in milliseconds
                month, day, year; // (integer) month, day and year
                // if separator is not defined then set '/'
                if (separator === undefined) {
                    separator = '/';
                }
                // split input date to month, day and year
                aoDate = txtDate.split(separator);
                // array length should be exactly 3 (no more no less)
                if (aoDate.length !== 3) {
                    document.getElementById('L11').style.display='block';
                    j=1;
                }
                else
                {
                    document.getElementById('L11').style.display='none';
        
                    // define month, day and year from array (expected format is m/d/yyyy)
                    // subtraction will cast variables to integer implicitly
                    month = aoDate[0] - 1; // because months in JS start from 0
                    day = aoDate[1] - 0;
                    year = aoDate[2] - 0;
                    // test year range
                    if (year < 1000 || year > 3000) {
                        document.getElementById('L11').style.display='block';
                        j=1;
                    }
                    else
                    {
                        document.getElementById('L11').style.display='none';
        
                        // convert input date to milliseconds
                        ms = (new Date(year, month, day)).getTime();
                        // initialize Date() object from milliseconds (reuse aoDate variable)
                        aoDate = new Date();
                        aoDate.setTime(ms);
                        // compare input date and parts from Date() object
                        // if difference exists then input date is not valid
                        if (aoDate.getFullYear() !== year ||
                            aoDate.getMonth() !== month ||
                            aoDate.getDate() !== day) {
                            document.getElementById('L11').style.display='block';
                            j=1;
                        }
                        else
                        {
                            document.getElementById('L11').style.display='none';
                        }
                    }
                }
                var txtDate=document.getElementById('doj').value;  
                var aoDate,separator,txtDate,            // needed for creating array and object
                ms,               // date in milliseconds
                month, day, year; // (integer) month, day and year
                // if separator is not defined then set '/'
                if (separator === undefined) {
                    separator = '/';
                }
                // split input date to month, day and year
                aoDate = txtDate.split(separator);
                // array length should be exactly 3 (no more no less)
                if (aoDate.length !== 3) {
                    document.getElementById('L12').style.display='block';
                    j=1;
                }
                else
                {
                    document.getElementById('L12').style.display='none';
        
                    // define month, day and year from array (expected format is m/d/yyyy)
                    // subtraction will cast variables to integer implicitly
                    month = aoDate[0] - 1; // because months in JS start from 0
                    day = aoDate[1] - 0;
                    year = aoDate[2] - 0;
                    // test year range
                    if (year < 1000 || year > 3000) {
                        document.getElementById('L12').style.display='block';
                        j=1;
                    }
                    else
                    {
                        document.getElementById('L12').style.display='none';
        
                        // convert input date to milliseconds
                        ms = (new Date(year, month, day)).getTime();
                        // initialize Date() object from milliseconds (reuse aoDate variable)
                        aoDate = new Date();
                        aoDate.setTime(ms);
                        // compare input date and parts from Date() object
                        // if difference exists then input date is not valid
                        if (aoDate.getFullYear() !== year ||
                            aoDate.getMonth() !== month ||
                            aoDate.getDate() !== day) {
                            document.getElementById('L12').style.display='block';
                            j=1;
                        }
                        else
                        {
                            document.getElementById('L12').style.display='none';
                        }
                    }
                }

   

                if(j==1)
                {
          
                }
                else
                {
                    $.ajax({
                        url:"add_att",
                        type:"POST",
                        data:{cat:$("#cat").val(),lev:$("#lev").val(),email:$("#email").val(),fnames:$("#fnames").val(),lnames:$("#lnames").val(),cno:$("#cno").val(),add:$("#add").val(),dob:$("#dob").val(),doj:$("#doj").val()},    
                        success:function(dt){
                            alert(dt);
                            window.location = 'get_att_detail';
                        }
                    });
                }
            }
        </script>
    </head>
    <body>
        <form name="updtform" id="contacts-form" defaultbutton="Update" defaultfocus="#fname">
            <input type="hidden" id="id">
            <div class="field text">
                <label><span>* </span> Email Id</label>
                <input  maxlength="30" id="email" type="text" name="User_fname">@isupport.com
            </div>
            <div class="field text">
                <label>&nbsp;</label>
                <label id="L10" style="width: 250px;display:none;"><span>Please Enter Email Id</span></label>
            </div>
            <div class="field text">
                <label><span>* </span> First Name</label>
                <input  maxlength="30" id="fnames" type="text" name="User_fname">
            </div>
            <div class="field text">
                <label>&nbsp;</label>
                <label id="L1" style="width: 250px;display:none;"><span>Please Enter First Name</span></label>
            </div>
            <div class="field text">
                <label><span>&nbsp;</span> Last Name</label>
                <input  maxlength="30" id="lnames" type="text" name="User_lname">
            </div>                      
            <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
            <div class="field text">
                <label><span>* </span> Contact Number</label>
                <input maxlength="14" id="cno" type="text" name="cno">
            </div>

            <div class="field text">
                <label>&nbsp;</label>
                <label id="L6" style="width: 250px;display: none"><span>Please Enter Only Numeric Values</span></label>
                <label id="L8" style="width: 250px;display: none"><span>Please Enter Contact Number</span></label>
            </div>
            <div class="field text" style="height: 100px">
                <label><span>* </span> Address</label>
                <textarea name="add" id="add" style="height: 100px; width: 300px"></textarea>
            </div>
            <br>
            <div class="field text">
                <label>&nbsp;</label>
                <label id="L7" style="width: 250px;display:none;"><span>Please Enter Address</span></label>
            </div>
            <div class="field text">
                <label><span>* </span> Category </label>
                <select name="cat" id="cat">
                    <c:forEach var="c" items="${cat}">
                        <option value="${c.cat_id}">${c.cat_desc}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
            <div class="field text">
                <label><span>* </span> Level </label>
                <select name="lev" id="lev">
                    <c:forEach var="d" items="${lev}">
                        <option value="${d.level_id}">${d.level_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>            

            <div class="field text">
                <label><span>* </span> Date Of Birth</label>
                <input  maxlength="30" type="text" id="dob"  name="dob">(MM/DD/YYYY)
            </div>                      
            <div class="field text"><label>&nbsp;</label><label id="L11" style="width: 250px;display:none;"><span>Invalid Date </span></label></div>
            <div class="field text">
                <label><span>* </span> Date Of Joining</label>
                <input  maxlength="30" type="text" id="doj"  name="doj">(MM/DD/YYYY)
            </div>
            <div class="field text"><label>&nbsp;</label><label id="L12" style="width: 250px;display:none;"><span>Invalid Date </span></label></div>

            <div class="field text">
                <label><span>&nbsp;</span>&nbsp;</label>
                <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                <input type="button" onclick="b();" value="Add" id="Update" name="Update" style="width: 100px;">
            </div>
        </form>
    </body>
</html>
