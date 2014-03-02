<%-- 
    Document   : admin_level_update
    Created on : 31 Oct, 2012, 9:00:44 AM
    Author     : harsh
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
var a=document.getElementById('name').value;
if(a==null || a=="")
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
          
      }
      else
          {
            $.ajax({
                        url:"update_level",
                        type:"POST",
                        data:{id:$("#id").val(),desc:$("#name").val()},    
                        success:function(dt){
                            alert(dt);
                            window.location = 'get_level_detail';
                        }
                    });
           }
}
</script>
    </head>
    <body>
        <form name="updtform" id="contacts-form" defaultbutton="Update" defaultfocus="#id">
                                        <c:forEach var="level" items="${level_details}">
                                            <input type="hidden" id="id" value="${level.level_id}">
                                        <div class="field text">
                                            <label><span>* </span> Level Name</label>
                                            <input value="${level.level_name}"  maxlength="30" id="name" type="text" name="name">
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L2" style="width: 250px;display:none;"><span>Please Enter Level Name</span></label>
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
