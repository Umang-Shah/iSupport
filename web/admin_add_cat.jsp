<%-- 
    Document   : admin_add_cat
    Created on : Nov 4, 2012, 11:30:59 AM
    Author     : Harsh
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
var a=document.getElementById('desc').value;
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
                        url:"add_cat",
                        type:"POST",
                        data:{desc:$("#desc").val()},    
                        success:function(dt){
                            alert(dt);
                            window.location = 'get_cat_detail';
                        }
                    });
           }
}
</script>
    </head>
    <body>
        <form name="updtform" id="contacts-form" defaultbutton="Update" defaultfocus="#cid">
                                            <input type="hidden" id="id">
                                            <div class="field text">
                                            <label><span>* </span> Category Name</label>
                                            <input  maxlength="30" id="desc" type="text" name="desc">
                                        </div>
                                        <div class="field text">
                                            <label>&nbsp;</label>
                                            <label id="L2" style="width: 250px;display:none;"><span>Please Enter Category Name</span></label>
                                        </div>
                                        <div class="field text">
                                            <label><span>&nbsp;</span>&nbsp;</label>
                                            <label><span>&nbsp;</span><input type="reset" value="Clear" name="reset" style="width: 100px;"></label>
                                            <input type="button" onclick="b();" value="Add" id="Update" name="Update" style="width: 100px;">
                                        </div>
                                    </form>

    </body>
</html>
