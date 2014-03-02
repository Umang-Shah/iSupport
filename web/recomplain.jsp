<%-- 
    Document   : recomplain
    Created on : Oct 28, 2012, 3:48:04 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Re-Complain</title>
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
					<span class="title">Re-Complain</span>
					<span class="subtitle"></span>
				</div>
				<!-- ENDS title -->
				
				<!-- page-content -->
				<div id="page-content">
                                <%
            dbConn.connect();
            ResultSet r = dbConn.customQuery("Select * from complain where Cust_id=" + uid);   
%>                            
    <input type="text" name="btnval">
         <table>
             <thead>
             <th>
                 Complain Subjects
             </th>
             
             </thead>
           <tbody>
            
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
                                                <tr>
                                                    <td>FeedBack : </td>
                                                    <td><textarea id="com" name="com" rows="10" cols="50"></textarea></td>
                                                </tr>  
                                                <tr>
                                                    <td>FeedBack : </td>
                                                    <td>
                                                        <form method="post" name="frm" id="contacts-form" action="Del_Complain">                        
                                                            <input type="image" value="<%= r.getString(1)%>" src="images/DeleteRed.png" title="Re-Complain" name="image" width="30" height="30"  onclick="{document.btnval.value=this.value;document.frm.submit();}">
                                                        </form></td>
                                                </tr>
                                                
                                            </table>
                                        </div>
                                        </p>
                                        
                                    
                                </div>
			</div>
                </td>
                
            </tr>
            <%} %>
            
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
