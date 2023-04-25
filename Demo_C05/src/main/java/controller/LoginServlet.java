package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "LoginServlet", urlPatterns = {"", "/login"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user_name") == null) {
            String name = request.getParameter("user_name");
            String pwd = request.getParameter("password");
            String ck = request.getParameter("ck");

            if ("adm".equals(name) && "123".equals(pwd)) {
                assert false;
                session.setAttribute("user_name", name);
                session.setAttribute("role", "adm");
                if ("on".equals(ck)) {
                    Cookie ck1 = new Cookie("user_name", name);
                    Cookie ck2 = new Cookie("pwd", pwd);
                    ck1.setMaxAge(1000);
                    ck2.setMaxAge(1000);
                    response.addCookie(ck1);
                    response.addCookie(ck2);
                }
                response.sendRedirect("/person");
            } else if ("emp".equals(name) && "123".equals(pwd)) {
                assert false;
                session.setAttribute("user_name", name);
                session.setAttribute("role", "emp");
                response.sendRedirect("/person");
            } else {
                request.setAttribute("msg", pwd);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
                requestDispatcher.forward(request, response);
            }
        } else {
            response.sendRedirect("/person");
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
//        Cookie[] ck = request.getCookies();
        boolean checkUser = false;

        if (action == null) {
            action = "";
        }
        if ("".equals(action)) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}
