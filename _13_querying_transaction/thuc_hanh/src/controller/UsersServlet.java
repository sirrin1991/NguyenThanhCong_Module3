package controller;

import model.bean.Users;
import model.service.UsersService;
import model.service.imp.UsersServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersServlet", urlPatterns = {"", "/users"})
public class UsersServlet extends HttpServlet {
    private UsersService usersService = new UsersServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createUser(request, response);
                break;
            case "edit":
                edit(request, response);
                listUsers(request, response);
                break;
            case "delete":
                delete(request, response);
                listUsers(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "addPer":
                addPermission(request,response);
                break;
            default:
                listUsers(request, response);
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "sort":
                sort(request, response);
                break;
            case "addPermission":
                showAddPermissionFrom(request, response);
                break;
            default:
                listUsers(request, response);

        }
    }

    private void showAddPermissionFrom(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Users user = usersService.findById(id);
        request.setAttribute("userObj", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/addpermision.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void addPermission(HttpServletRequest request, HttpServletResponse response) {
        int id1 = Integer.parseInt(request.getParameter("userId"));
        int id2 = Integer.parseInt(request.getParameter("perId"));
        Users user = usersService.findById(id1);
        String msg = usersService.transaction(id1,id2);
        request.setAttribute("userObj",user);
        request.setAttribute("mess",msg);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/addpermision.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Users> list = usersService.searchByName(name);
        request.setAttribute("listFinal", list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/search.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void sort(HttpServletRequest request, HttpServletResponse response) {
        List<Users> list = usersService.sort();
        request.setAttribute("listFinal", list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) {
        List<Users> list = usersService.findAll();
        request.setAttribute("listFinal", list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Users user = usersService.findById(id);
        request.setAttribute("userObj", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/delete.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String confirm = request.getParameter("name");
        if (confirm.equals("Yes")) {
            usersService.remove(id);
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Users user = usersService.findById(id);
        request.setAttribute("userObj", user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Users user = new Users(name, email, address);
        usersService.update(id, user);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Users user = new Users(name, email, address);
        boolean check = usersService.save(user);
        String msg = null;
        if (check) {
            msg = "Update successfully!";
        } else {
            msg = "Create failed";
        }
        request.setAttribute("mes", msg);
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
