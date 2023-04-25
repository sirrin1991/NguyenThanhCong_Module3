package controller;

import model.Person;
import service.IPersonService;
import service.PersonService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PersonServlet", urlPatterns = "/person")
public class PersonServlet extends HttpServlet {
    private IPersonService personService = new PersonService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if (role != null) {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }

            switch (action) {
                case "create":
                    create(request, response);
                    break;
                case "edit":
                    if ("emp".equals(role)) {
                        response.sendRedirect("/person?msg=Not%20permitted");
                    } else {
                        edit(request, response);
                    }
                    break;
//                case "showdeleteform":
//                    showFormDelete(request, response);
//                    break;
            }
        }else {
            response.sendRedirect("/");
        }

    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Person person = personService.findById(id);
        if (person == null) {
            try {
                response.sendRedirect("/person?msg=Not%20exists");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            person.setName(name);
            person.setAddress(address);
            person.setEmail(email);
            personService.update(person);
            try {
                response.sendRedirect("/person?msg=Update%20successfully");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String date = request.getParameter("birthday");
        System.out.println(date);
//        String select = request.getParameter("select");
//        String div1 = null;
//        String div2 = null;
//        if("div1".equals(select)){
//             div1 = request.getParameter("div1");
//        }else if ("div2".equals(select)){
//             div2 = request.getParameter("div2");
//        }
//        System.out.println("select: " + select+ ". Div1: " + div1 + ". Div2: " + div2);
        Person person = new Person();
        person.setName(name);
        person.setAddress(address);
        person.setEmail(email);
        person.setStatus(true);
        person.setDate(date);
        Map<String, String> map = personService.save(person);
        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("map", map);
        if (map.isEmpty()) {
            try {
                person = null;
                httpSession.setAttribute("per", person);
                response.sendRedirect("/person?msg=New%20customer%20was%20created");
//                map.clear();
//                person.
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            httpSession.setAttribute("per", person);
            try {
                response.sendRedirect("/person");
            } catch (IOException e) {
                e.printStackTrace();
            }
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
//            try {
//                requestDispatcher.forward(request,response);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if(role != null){
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                case "search":
                    search(request, response);
                    break;
                case "showcreateform":
                    showFormCreate(request, response);
                    break;
                case "showeditform":
                    if ("emp".equals(role)) {
                        response.sendRedirect("/person?msg=Not%20permitted");
                    } else {
                        showFormEdit(request, response);
                    }
                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "view":
                    view(request, response);
                    break;
                case "clear":
                    clear(request, response);
                    break;
                default:
                    showList(request, response);
            }
        }else {
            response.sendRedirect("/");
        }

    }

    private void clear(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.setAttribute("map", null);
        try {
            response.sendRedirect("/person");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void view(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Person person = personService.findById(id);
        request.setAttribute("per", person);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/info.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        personService.remove(id);
        try {
            response.sendRedirect("/person?msg=Delete%20Successfully%20!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
//        RequestDispatcher requestDispatcher;
//        int id = Integer.parseInt(request.getParameter("id"));
//        Person person = personService.findById(id);
//
//        if (person == null) {
//            requestDispatcher = request.getRequestDispatcher("/error.jsp");
//        } else {
//            request.setAttribute("per", person);
//            requestDispatcher = request.getRequestDispatcher("/delete.jsp");
//        }
//        try {
//            requestDispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher;
        int id = Integer.parseInt(request.getParameter("id"));
        Person person = personService.findById(id);

        if (person == null) {
            requestDispatcher = request.getRequestDispatcher("/error.jsp");
        } else {
            request.setAttribute("per", person);
            requestDispatcher = request.getRequestDispatcher("/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        String name = request.getParameter("name");
        List<Person> list = personService.searchByName(name);
        request.setAttribute("list", list);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        Map<String, String> map = (Map<String, String>) session.getAttribute("map");
        Person per = (Person) session.getAttribute("per");
        request.setAttribute("map", map);
        request.setAttribute("per", per);
        String msg = request.getParameter("msg");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        List<Person> list = personService.list();

        if (list.size() == 0) {
            request.setAttribute("emptyMsg", "Danh sách hiện tại đang trống");
        } else {
            request.setAttribute("list", list);
            request.setAttribute("msg", msg);
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
