<%-- 
    Document   : time_update
    Created on : Nov 5, 2012, 4:56:13 PM
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
var a=document.getElementById('time').value;
if(a==null || a=="")
    {
        
        document.getElementById('L1').style.display='block';
        j=1;
    }
else
    {
        document.getElementById('L1').style.display='none';
        if(isNaN(a)||a.indexOf(" ")!=-1)
        {
           document.getElementById('L2').style.display='block';
           j=1;
        }
        else
           {
               document.getElementById('L2').style.display='none';
           }
    }
  if(j==1)
      {
          
      }
      else
          {
            $.ajax({
                        url:"update_time",
                        type:"POST",
                        data:{cid:$("#cat_id").val(),lid:$("#lev_id").val(),time:$("#time").val()},    
                        success:function(dt){
                            alert(dt);
                            window.location = 'get_time_detail';
                        }
                    });
           }
}
</script>
    </head>
    <body>
        <form name="updtform" id="contacts-form" defaultbutton="Update">
            <c:forEach var="time" items="${time_details}">
                                            <input type="hidden" id="lev_id" value="${time.level_id}">
                                            <input type="hidden" id="cat_id" value="${time.cat_id}">
                                            <div class="field text">
                                            <label><span>&nbsp; </span> Level Name</label>
                                            ${time.level_name}
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                        </div>
                                        <div class="field text">
                                            <label><span>&nbsp; </span> Category Name</label>
                                            ${time.category_desc}
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                        </div>
                                             <div class="field text">
                                            <label><span>* </span> Time</label>
                                            <input value="${time.time}" maxlength="30" id="time" type="text" name="time"> minutes
                                        </div>
                                        
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L1" style="width: 250px;display:none;"><span>Please Enter Time</span></label>
                                            <label id="L2" style="width: 250px;display:none;"><span>Please Enter Numeric Values</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span>&nbsp;</label>
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="button" onclick="b();" value="Update" id="Update" name="Update" style="width: 100px;">
                                        </div>
                                        </c:forEach>
                                    </form>
    </body>
</html>
