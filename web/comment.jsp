<%-- 
    Document   : index
    Created on : 14 Oct, 2012, 2:09:51 PM
    Author     : harsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Comment</title>
		<%@include file="head.jsp" %>
	</head>
	<body class="home">
		<!-- WRAPPER -->
		<div id="wrapper">
                    <%@include file="navigation.jsp" %>
			<!-- MAIN -->
			<div id="main">
				<!-- content -->
				<div id="content">
					<!-- title -->
				<div id="page-title">
					<span class="title">Comment</span>
					<span class="subtitle">Register your Comment.</span>
				</div>
				<!-- ENDS title -->
				<!-- page-content -->
				<div id="page-content">
                                    <table>

                                        <tbody>
                                            <tr></tr>
                                            <tr>
                                                <th>Complaint Id</th>
                                                <td><input type="text" name="txt_id" value="" readonly="readonly" /></td>
                                            </tr>
                                            <tr>
                                                <th>Title</th>
                                                <td><input type="text" name="txt_title" value="" readonly="readonly" /></td>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <td><textarea name="txt_desc" rows="4" cols="20" readonly="readonly">
                                                    </textarea></td>
                                            </tr>
                                            <tr>
                                                <th>Solution</th>
                                                <td><textarea name="txt_solution" rows="4" cols="20" readonly="readonly">
                                                    </textarea></td>
                                            </tr>
                                            <tr>
                                                <th>Status</th>
                                                <td><input type="text" name="txt_status" value="" readonly="readonly" /></td>
                                            </tr>
                                            <tr>
                                                <th>Comment</th>
                                                <td><textarea name="txt_comment" rows="4" cols="20">
                                                    </textarea></td>
                                            </tr>
                                            <tr>
                                                <th><input type="reset" value="Clear" name="Cancel" /></td>
                                                <td><input type="submit" value="Submit" name="Submit" /></td>
                                            </tr>
                                        </tbody>
                                    </table>

				</div>
                                </div>
				<!-- ENDS content -->
			</div>
			<!-- ENDS MAIN -->
			<%@include file="footer.jsp" %>
		</div>
		<!-- ENDS WRAPPER -->
	</body>
</html>