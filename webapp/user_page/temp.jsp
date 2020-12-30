<%--
  Created by IntelliJ IDEA.
  User: Trinh Quang Tien
  Date: 27/12/2020
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <% pageContext.setAttribute("name","5"); %>
    <p> <%= pageContext.getAttribute("name") %></p>
</body>
</html>
