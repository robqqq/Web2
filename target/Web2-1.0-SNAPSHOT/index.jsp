<%@ page import="com.example.web2.model.Point" %>
<%@ page import="java.util.Collection" %>
<%@ page import="com.example.web2.model.Results" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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

    <script src="plotClickHandler.js"></script>
    <script src="validator.js"></script>

    <header>
        <span>
            Bavykin Roman Alekseevich, P3210, V-10201
        </span>
    </header>

    <div id="plot">
        <svg id="plot-svg">
            <rect class="plot-figure" height="100" width="100" x="150" y="50"></rect>
            <polygon class="plot-figure" points="100 150, 150 150, 150 200"></polygon>
            <path class="plot-figure" d="M150 150 h 50 a 50 50 0 0 1 -50 50 Z"></path>
            <line class="plot-grid" x1="10" x2="290" y1="150" y2="150" stroke="black"></line>
            <line class="plot-grid" x1="150" x2="150" y1="10" y2="290" stroke="black"></line>
            <line class="plot-grid" x1="50" x2="50" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="100" x2="100" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="200" x2="200" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="250" x2="250" y1="147" y2="153" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="50" y2="50" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="100" y2="100" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="200" y2="200" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="153" y1="250" y2="250" stroke="black"></line>
            <line class="plot-grid" x1="285" x2="290" y1="147" y2="150" stroke="black"></line>
            <line class="plot-grid" x1="285" x2="290" y1="153" y2="150" stroke="black"></line>
            <line class="plot-grid" x1="147" x2="150" y1="15" y2="10" stroke="black"></line>
            <line class="plot-grid" x1="153" x2="150" y1="15" y2="10" stroke="black"></line>
            <text x="280" y="145">X</text>
            <text x="245" y="145">R</text>
            <text x="190" y="145">R/2</text>
            <text x="85" y="145">-R/2</text>
            <text x="40" y="145">-R</text>

            <text x="155" y="20">Y</text>
            <text x="155" y="55">R</text>
            <text x="155" y="105">R/2</text>
            <text x="155" y="205">-R/2</text>
            <text x="155" y="255">-R</text>
            <%
                Results results = (Results) request.getSession().getAttribute("results");
                if (results != null) {
                    Collection<Point> points = results.getResults();
                    for (Point point: points){
                        double x = point.getX();
                        double y = point.getY();
                        double r = point.getR();
                        String color = point.getResult() ? "green" : "darkred";
                        double cx = 150 + x / r * 100;
                        double cy = 150 - y / r * 100;
            %>
            <circle style="fill:<%= color %>;
                    stroke:<%= color %>;
                    fill-opacity: 0.5;"
                    class="point"
                    r="3"
                    cx="<%= cx %>"
                    cy="<%= cy %>"></circle>"
            <%
                    }
                }
            %>
        </svg>
    </div>

    <div class="form">
        <form id="input" method="get" action="controller-servlet">
            <p class="variable">
                X =
                <label for="x"></label>
                <input id="x" type="text" name="x_value" placeholder="(-3 ... 5)">
            </p>
            <p class="varialbe">
                Y =
                <label>
                    <input type="checkbox" value="-3" name="y_value">-3
                    <input type="checkbox" value="-2" name="y_value">-2
                    <input type="checkbox" value="-1" name="y_value">-1
                    <input type="checkbox" value="0" name="y_value">0
                    <input type="checkbox" value="1" name="y_value">1
                    <input type="checkbox" value="2" name="y_value">2
                    <input type="checkbox" value="3" name="y_value">3
                    <input type="checkbox" value="4" name="y_value">4
                    <input type="checkbox" value="5" name="y_value">5
                </label>
            </p>
            <p class="variable">
                R =
                <label>
                    <input type="radio" value="1" name="r_value">1
                    <input type="radio" value="2" name="r_value">2
                    <input type="radio" value="3" name="r_value">3
                    <input type="radio" value="4" name="r_value">4
                    <input type="radio" value="5" name="r_value">5
                </label>
            </p>
            <p class="buttons">
                <button id="submit_button" type="submit">Submit</button>
            </p>
        </form>
    </div>

    <div hidden id="error">
        <p id="error_message">Something went wrong</p>
    </div>

    <div id="results">
        <table class="result_table">
            <tr>
                <th class="variable">X</th>
                <th class="variable">Y</th>
                <th class="variable">R</th>
                <th>Result</th>
            </tr>
            <%
                if (results != null) {
                    Collection<Point> points = results.getResults();
                    for (Point point: points){
            %>
            <tr>
                <th><%= point.getX() %></th>
                <th><%= point.getY() %></th>
                <th><%= point.getR() %></th>
                <th style="color: <%=point.getResult() ? "green" : "red"%>;"><%= point.getResult() %></th>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</body>
</html>