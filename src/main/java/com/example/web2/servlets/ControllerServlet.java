package com.example.web2.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "ControllerServlet", value = "/controller-servlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xStr = request.getParameter("x_value");
        String yStr = request.getParameter("y_value");
        String rStr = request.getParameter("r_value");
        if (xStr == null || yStr == null || rStr == null){
            Logger.getLogger("ControllerServlet").warning("One of the parameters is not set");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            try {
                Double.parseDouble(xStr);
                Double.parseDouble(yStr);
                Double.parseDouble(rStr);
                getServletContext().getRequestDispatcher("/area-check-servlet").forward(request, response);
            } catch (NumberFormatException e) {
                Logger.getLogger("ControllerServlet").warning("One of the parameters is not a number");
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
