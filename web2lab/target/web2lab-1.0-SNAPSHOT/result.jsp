<jsp:useBean id="result" scope="request" class="ru.ravvcheck.web2lab.beans.Hit"/>
<%--
  Created by IntelliJ IDEA.
  User: RavvCheck1
  Date: 22.10.2023
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="assets/logo.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="stylesheets/main.css">
    <title>ravvchek -- project</title>
</head>
<body>
<td id="table" rowspan="2">
    <div class="top">
        <h2>Table</h2>
    </div>
    <div id="resultTable">
        <table>
            <thead>
            <tr>
                <th class="column-type1">X</th>
                <th class="column-type1">Y</th>
                <th class="column-type1">R</th>
                <th class="column-type2">Hit Result</th>
                <th class="column-type3">Current Time</th>
                <th class="column-type3">Execution Time</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>${result.getX()}</th>
                <th>${result.getY()}</th>
                <th>${result.getR()}</th>
                <th>${result.isHit()}</th>
                <th>${result.getCurrentTime()}</th>
                <th>${result.getExecutionTime()}</th>
            </tr>
            </tbody>
        </table>
    </div>
</td>
<%
    ServletContext context = request.getServletContext();
    request.setAttribute("results", context.getAttribute("results"));
%>
<a href="index.jsp">Exit</a>
</body>
</html>
