<%-- 
    Document   : feedback
    Created on : Nov 2, 2012, 10:02:57 PM
    Author     : Kushal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form type="get" action="set_feedback">
    <c:forEach var="com" items="${feedback}">
        <table>
            <tr>
                <td>Subject</td>
                <td>${com.comp_title}</td>
            </tr>
            <tr>
                <td>Your Feedback</td>
                <td><textarea cols="30" rows="5" name="fdbk">${com.feedback}</textarea></td>
            </tr>
            <tr>
                <td><input type="hidden" name="id" value="${com.comp_id}"></td>
                <td><input type="submit"></td>
            </tr>
        </table>
    </c:forEach>
        </form>
    </body>
</html>
