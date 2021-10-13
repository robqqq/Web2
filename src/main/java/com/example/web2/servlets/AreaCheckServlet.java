package com.example.web2.servlets;

import com.example.web2.model.Limits;
import com.example.web2.model.Point;
import com.example.web2.model.PointChecker;
import com.example.web2.model.Results;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "AreaCheckServlet", value = "/area-check-servlet")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Limits<Double> xLimits = new Limits<>(-3d, 5d, true, true);
        Limits<Double> yLimits = new Limits<>(-3d, 5d, false, false);
        Limits<Double> rLimits = new Limits<>(1d, 5d, false, false);
        PointChecker pointChecker = new PointChecker(xLimits, yLimits, rLimits);
        double x = Double.parseDouble(request.getParameter("x_value"));
        double y = Double.parseDouble(request.getParameter("y_value"));
        double r = Double.parseDouble(request.getParameter("r_value"));
        Point point = new Point(x, y ,r);
        pointChecker.check(point);
        if (point.isValid()){
            Results results = (Results) request.getSession().getAttribute("results");
            if (results == null){
                results = new Results();
                results.addPoint(point);
                request.getSession().setAttribute("results", results);
            } else {
                results.addPoint(point);
            }
            getServletContext().getRequestDispatcher("/result_page.jsp").forward(request, response);
        } else {
            Logger.getLogger("AreaCheckServlet").warning("Incorrect parameters");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

}
