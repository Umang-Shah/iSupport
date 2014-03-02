<%-- 
    Document   : admin_add_level
    Created on : 31 Oct, 2012, 9:11:15 AM
    Author     : harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                        url:"add_level",
                        type:"POST",
                        data:{name:$("#name").val()},    
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
        <form name="updtform" id="contacts-form" defaultbutton="Update" >
                                            <input type="hidden" id="id">
                                            <div class="field text">
                                            <label><span>* </span> Level Name</label>
                                            <input  maxlength="30" id="name" type="text" name="name">
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L2" style="width: 250px;display:none;"><span>Please Enter Level Name</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span>&nbsp;</label>
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="button" onclick="b();" value="Add" id="Update" name="Update" style="width: 100px;">
                                        </div>
                                    </form>

    </body>
</html>
