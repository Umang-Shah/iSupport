<%-- 
    Document   : cust_home
    Created on : Oct 20, 2012, 5:11:59 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Welcome To "E-HelpDesk"</title>
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
					<span class="title">Home</span>
					<span class="subtitle">Thanks for using E-HelpDesk.</span>
				</div>
				<!-- ENDS title -->
				
				<!-- page-content -->
				<div id="page-content">
                                     <div id="slider-block">
            <div id="slider-holder">
                <div id="slider">
                    <img src="images/01.jpg" title="Welcome to the Next Generation of Help Desk" />
                    <img src="images/02.jpg" title="Welcome to the Next Generation of Help Desk" />
                    <img src="images/03.png" title="to the Next Generation of Help Desk" />
                    <img src="images/04.jpg" title="You can also look out at our various products" />
                    <img src="images/05.png" title="You can also look out at our various products" />
                    <img src="images/06.png" title="You can also look out at our various products" />
                </div>
            </div>
        </div>
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