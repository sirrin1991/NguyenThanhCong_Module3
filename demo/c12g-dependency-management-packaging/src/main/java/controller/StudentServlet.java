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
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"", "/student"})
public class StudentServlet extends HttpServlet {

    private StudentService studentService = new StudentServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
                String name = request.getParameter("name");
                String dateOfBirth = request.getParameter("dateOfBirth");

                Student student = new Student(id, name, dateOfBirth);

                String msg = null;
                if (this.studentService.save(student)) {
                    msg = "Update successfully!";
                    loadList(request, response);
                } else {
                    msg = "Update failed!";

                    request.setAttribute("msg", msg);
                    request.setAttribute("studentObj", student);
                    request.getRequestDispatcher("update_student.jsp").forward(request, response);
                }
        }
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
                Integer idDelete = Integer.parseInt(request.getParameter("id"));
                break;
            case "transaction":
                String msg = this.studentService.callTransaction();
                request.setAttribute("msgInfo", msg);
                request.getRequestDispatcher("result_transaction.jsp").forward(request, response);
                break;
            case "search":
                String keywordJSP = request.getParameter("keyword");
                List<Student> studentList = this.studentService.searchByKeyword(keywordJSP);

                request.setAttribute("studentListServlet", studentList);
                request.setAttribute("keywordJSP", keywordJSP);
                request.getRequestDispatcher("list_by_jstl.jsp").forward(request, response);

                break;
            default:
                loadList(request, response);
        }
    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msgServlet", "Hello Gradle!");
        request.setAttribute("studentListServlet", this.studentService.findAll());
        request.getRequestDispatcher("list_by_jstl.jsp").forward(request, response);
    }
}
