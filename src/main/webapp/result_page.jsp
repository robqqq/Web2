<%@ page import="com.example.web2.model.Results" %>
<%@ page import="com.example.web2.model.Point" %>
<%--
  Created by IntelliJ IDEA.
  User: RoBQ
  Date: 05.10.2021
  Time: 3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="Web-programming - Lab 2" name="description">
    <meta content="Bavykin Roman Alekseevich" name="author">
    <title>Web-programming - Lab 2</title>
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="images/icon.ico">
</head>
<body>
    <header>
            <span>
                Bavykin Roman Alekseevich, P3210, V-10201
            </span>
    </header>

    <div id="result">
        <%
            Results results = (Results) request.getSession().getAttribute("results");
            Point point = results.getFirst();
        %>
        <table class="result_table">
            <tr>
                <th class="variable">X</th>
                <th class="variable">Y</th>
                <th class="variable">R</th>
                <th>Result</th>
            </tr>
            <tr>
                <th><%= point.getX() %></th>
                <th><%= point.getY() %></th>
                <th><%= point.getR() %></th>
                <th style="color: <%= point.getResult() ? "green" : "darkred" %>"><%= point.getResult() %></th>
            </tr>
        </table>
    </div>

    <div class="form">
        <form method="get" action="index.jsp">
            <button type="submit" >Go back</button>
        </form>
    </div>
</body>
</html>
