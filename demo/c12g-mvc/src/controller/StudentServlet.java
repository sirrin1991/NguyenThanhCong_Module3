package controller;

import model.bean.Student;
import model.service.StudentService;
import model.service.impl.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"", "/student"})
public class StudentServlet extends HttpServlet {

    private StudentService studentService = new StudentServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {
            case "create":
                // your code
                break;
            case "update":
                Integer id = Integer.parseInt(request.getParameter("id"));
                Student studentFromService = this.studentService.findById(id);

                request.setAttribute("studentObj", studentFromService);
                request.getRequestDispatcher("update_student.jsp").forward(request, response);
                break;
            case "delete":
                // your code
                break;
            default:
                request.setAttribute("studentListServlet", this.studentService.findAll());
                request.getRequestDispatcher("list_by_jstl.jsp").forward(request, response);
        }

    }
}
