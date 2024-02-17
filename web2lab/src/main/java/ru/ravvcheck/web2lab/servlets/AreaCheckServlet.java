package ru.ravvcheck.web2lab.servlets;


import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.ravvcheck.web2lab.beans.Hit;
import ru.ravvcheck.web2lab.beans.Results;

import java.io.IOException;
import java.text.DecimalFormat;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

@WebServlet(name = "areaCheck", value = "/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    private static final double X_MIN = -5, X_MAX = 5;
    private static final double Y_MIN = -5, Y_MAX = 5;
    private static final double R_MIN = -5, R_MAX = 5;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context = getServletContext();
        String xStr = req.getParameter("x");
        String yStr = req.getParameter("y");
        String rStr = req.getParameter("r");

        double x;
        double y;
        double r;

        try {
            x = Double.parseDouble(xStr);
            y = Double.parseDouble(yStr);
            r = Double.parseDouble(rStr);
        } catch (NumberFormatException e) {
            throw new RuntimeException("Wrong type arguments!");
        }
        Results results = (Results) context.getAttribute("results");

        long startTime = Long.parseLong(req.getAttribute("startTime").toString());
        long endTime = System.nanoTime();

        Hit hit = new Hit();
        hit.setX(x);
        hit.setY(y);
        hit.setR(r);
        hit.setResult(isHit(x, y, r));
        hit.setCurrentTime(ZonedDateTime.now().format(DateTimeFormatter.ofPattern("mm:hh:yy", Locale.forLanguageTag("RU"))));
        DecimalFormat df = new DecimalFormat("#.###");
        hit.setExecutionTime("" + (endTime - startTime) * 0.001);
        results.getResults().add(hit);
        context.setAttribute("results", results);
        req.setAttribute("result", hit);
        req.setAttribute("results", context.getAttribute("results"));
        context.getRequestDispatcher("/result.jsp").forward(req, resp);
    }

    private boolean isHit(double x, double y, double r) {
        if (x > X_MAX || x < X_MIN) {
            return false;
        }
        if (y > Y_MAX || y < Y_MIN) {
            return false;
        }
        if (r > R_MAX || r < R_MIN) {
            return false;
        }
        return isCircle(x, y, r) || isRectangle(x, y, r) || isTriangle(x, y, r);
    }

    private boolean isRectangle(double x, double y, double r) {
        return y >= -r && x <= r && x >= 0 && y <= 0;
    }

    private boolean isCircle(double x, double y, double r) {
        return x * x + y * y <= (r * r) / 4 && x <= 0 && y <= 0;
    }

    private boolean isTriangle(double x, double y, double r) {
        return x <= 0 && y >= 0 && y <= x + r;
    }
}
