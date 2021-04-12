package controller;

import model.bean.Customer;
import model.service.ServiceRepository;
import model.service.imp.ServiceRepositoryImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = {"", "/customers"})
public class CustomerServlet extends HttpServlet {
    private  ServiceRepository serviceRepository = new ServiceRepositoryImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                createCustomer(request,response);
                break;
            case "edit":
                updateInformationCustomer(request,response);
                listCustomers(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                listCustomers(request,response);
                break;
            default:
                listCustomers(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                showCreateForm(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                showDeleteForm(request,response);
                break;
            default:
                listCustomers(request,response);

        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomers(HttpServletRequest request, HttpServletResponse response){
        List<Customer> list = this.serviceRepository.findAll();
        request.setAttribute("customers",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request , HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = this.serviceRepository.findAll().size() +1;
        Customer customer = new Customer(id,name,email,address);
        this.serviceRepository.save(customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/create.jsp");
        request.setAttribute("message", "New customer was created");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void showEditForm(HttpServletRequest request , HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.serviceRepository.findById(id);
        request.setAttribute("customerObj", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void showDeleteForm(HttpServletRequest request , HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.serviceRepository.findById(id);
        request.setAttribute("customerObj", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/delete.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void updateInformationCustomer(HttpServletRequest request , HttpServletResponse response){
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = new Customer(id,name,email,address);
        serviceRepository.update(id,customer);
    }

    private void deleteCustomer(HttpServletRequest request , HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String confirm = request.getParameter("name");
        if(confirm.equals("Yes")){
            serviceRepository.remove(id);
        }
    }


}

