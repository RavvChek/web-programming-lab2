package ru.ravvcheck.web2lab.servlets;


import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.ravvcheck.web2lab.beans.Results;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@MultipartConfig
@WebServlet(name = "controller", value = "/controller")
public class ControllerServlet extends HttpServlet {
    Results results;

    public ControllerServlet() {
        results = new Results();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = getServletContext();
        if (context.getAttribute("results") == null) {
            getServletContext().setAttribute("results", results);
        }
        String xStr = req.getParameter("x");
        String yStr = req.getParameter("y");
        String rStr = req.getParameter("r");
        long startTime = System.nanoTime();
        req.setAttribute("results", context.getAttribute("results"));
        if (xStr == null || yStr == null || rStr == null || xStr.isEmpty() || yStr.isEmpty() || rStr.isEmpty()) {
            req.setAttribute("results", context.getAttribute("results"));
            context.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }
        req.setAttribute("startTime", startTime);
        req.setAttribute("results", context.getAttribute("results"));
        context.getRequestDispatcher("/areaCheck").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = getServletContext();
        req.setAttribute("results", context.getAttribute("results"));
        getServletContext()
                .getRequestDispatcher("/index.jsp")
                .forward(req, resp);
    }
}
