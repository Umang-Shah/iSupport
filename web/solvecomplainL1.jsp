<%-- 
    Document   : solvecomplain
    Created on : Nov 2, 2012, 5:10:40 PM
    Author     : durva
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html><head>  
        <%@include file="head.jsp" %>
        <%
            String secs = "1";
            String compid = request.getAttribute("compid").toString();
            System.out.println("compid::" + compid);
            String mins = request.getAttribute("time").toString();
        %>  
        <script type="text/javascript">
    window.onbeforeunload = function() {
        return "Dude, are you sure you want to leave? Think of the kittens!";
    }
</script>
        <script type="text/javascript">
            function b()
            {       
                var a=document.getElementById('sol').value;
                if(a==null || a=="")
                {
                    document.getElementById('L1').style.display='block';
                    return false;
                }
                else
                {
                    document.getElementById('L1').style.display='none';
                    return true;
                }
                return true;
            }
        </script>
        <script>  
            <!--  
            var mins = <%=mins%>; // write mins to javascript  
            var secs = <%=secs%>;
            var comp_id=<%=compid%>;// write secs to javascript  

            function showKeyCode(e)
            {

                var keycode =(window.event) ? event.keyCode : e.keyCode;

                if(keycode == 116)
                {
                    event.keyCode = 0;
                    event.returnValue = false;
                    return false;
                }
            }
            function timer()  
            {  
                // tic tac  
                if( --secs == -1 )  
                {  
                    secs = 59;  
                    --mins;  
                }  
  
                // leading zero? formatting  
                if( secs < 10 ) secs = "0" + secs;               
                if( mins < 10 ) mins = "0" + parseInt( mins, 10 );  
  
                // display  
                document.forma.mins.value = mins;   
                document.forma.secs.value = secs;  
  
                // continue?  
                if( secs == 0 && mins == 0 ) // time over  
                {  
                    window.alert("Time Up, Your work has been Escalated");
                    document.forma.comp_id.value=comp_id; 
                    document.location.href="escalate?compid="+comp_id;
                }  
                else // call timer() recursively every 1000 ms == 1 sec  
                {  
                    window.setTimeout( "timer()", 1000 );  
                }  
            }

            //-->  
        </script>
    </head>  

    <body onKeyDown ="showKeyCode();" >  
        <!-- WRAPPER -->
        <div id="wrapper">
            <%@include file="navigation_att.jsp" %>
            <div id="main">

                <!-- content -->
                <div id="content">
                    <!-- title -->
                    <div id="page-title">
                        <span class="title">Solve Complaint</span>
                    </div>
                    <!-- ENDS title -->
                    <!-- page-content -->
                    <div id="page-content">
                        <c:forEach items="${comps}"  var="comp"> 
                            <form name="forma" method="post" id="contacts-form" action="solved" onsubmit="return b()">  
                                <input type="hidden" name="comp_id" />   
                                <div class="field text">
                                    <label><span>&nbsp; </span> Time remaining</label>
                                    <input type="text" name="mins" size="1" style="border:0px solid black;text-align:left;width: 15px"><label style="width: 2px">.</label><input type="text" name="secs" size="1" style="border:0px solid black;width: 20px">  
                                </div>
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>&nbsp; </span> Complain ID </label>
                                    <input value="${comp.comp_id}" maxlength="30" type="text" name="compid" readonly  style="border:0px solid black;">
                                </div>
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>&nbsp; </span> Complain Title </label>
                                    <label>${comp.comp_title}</label>
                                </div>
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>&nbsp; </span> Description </label>
                                    <textarea id="des" name="des" style="height: 200px;" readonly="readonly">${comp.comp_desc}</textarea>
                                </div>
                                <br><br><br><br><br><br><br><br><br>
                                <div class="field text"><label>&nbsp;</label><label><span>&nbsp;</span></label></div>
                                <div class="field text">
                                    <label><span>* </span> Complain Solution </label>
                                    <textarea id="sol" name="sol" style="height: 200px;"></textarea>
                                </div>
                                <div class="field text">
                                    <label>&nbsp;</label>
                                    <label id="L1" style="width: 250px;display:none;"><span>Please Enter Complain Solution</span></label>
                                </div>
                                <br><br><br><br><br><br><br>
                                <div class="field text">
                                    <label>&nbsp;</label>
                                    <label id="L1" style="width: 250px;display:none;"><span>Please Enter Complain Solution</span></label>
                                </div>
                                <table><tr><td width="100px;">&nbsp;</td><td><input type="submit" value="Submit" style="width: 150px;"></td>
                                </table>
                            </form>         
                                    <table><tr>
                  
                                            <td width="100px;">&nbsp;</td><td><a href="escalate?compid=${comp.comp_id}"  onclick="return confirm('Are You Sure ?');">Escalate</a></td>
                  
                                            <td width="100px;">&nbsp;</td><td><a href="add_back?compid=${comp.comp_id}" onclick="return confirm('Are You Sure ?');">Add Back To Queue</a></td>
                  
                                        </tr></table>
                                </c:forEach>        
                    </div>
                    <!-- ENDS page-content -->
                </div>
                <!-- ENDS content -->
            </div>
            <%@  include file="footer.jsp" %>
        </div>
        <!-- ENDS WRAPPER -->

        <script>  
            <!--
            timer();
            //-->
        </script> 


    </body></html>  

