<%-- 
    Document   : complains
    Created on : Oct 22, 2012, 2:41:21 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Complains</title>
    <%@  include file="head.jsp" %>
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
					<span class="title">Your Complains</span>
					<span class="subtitle">Click on Subject to see complain in Detail.</span>
				</div>
				<!-- ENDS title -->
				
				<!-- page-content -->
				<div id="page-content">
<%
            dbConn.connect();
            ResultSet r = dbConn.customQuery("Select * from complain where Cust_id=" + uid);   
%>
        
         <table>
             <thead>
             <th>
                 Complain Subjects
             </th>
             <th width="50px">
                 Remove
             </th>
             </thead>
           <tbody>
            <form method="post" name="frm" id="contacts-form" action="Del_Complain">                        
            <input type="hidden" name="btnval">
               <% while (r.next()) {%>
            <tr>
                <td><h6 class="toggle-trigger"><a href="#"><%=r.getString(9) %></a></h6>
			<div class="toggle-container">
                                <div class="block">
					<p>
                                        <div class="field text">
                                            <table>
                                                <tr>
                                                    <td style="width: 100px">Description : </td>
                                                    <td><%=r.getString(3) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Status : </td>
                                                    <td><%=r.getString(4) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Solution : </td>
                                                    <td><%=r.getString(8) %></td>
                                                </tr>
                                            </table>
                                        </div>
                                        </p>
                                </div>
			</div>
                </td>
                <td align="center">
                                    <input type="image" value="<%= r.getString(1)%>" src="images/DeleteRed.png" title="Remove This Complain" name="image" width="30" height="30"  onclick="{document.frm.btnval.value=this.value;document.frm.submit();}">
                </td>
            </tr>
            <%} %>
            </form>
           </tbody>
       </table>		

                                    
                                    
                                    
                                
        
				</div>
				<!-- ENDS page-content -->

			</div>
			<!-- ENDS content -->
			</div>
        <%@  include file="footer.jsp" %>
    </div>
    <!-- ENDS WRAPPER -->
</body>

</html>
