package controller;

import model.bean.Product;
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

@WebServlet(name = "ProductServlet" ,urlPatterns = {"","/products"})
public class ProductServlet extends HttpServlet {
    ServiceRepository serviceRepository = new ServiceRepositoryImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            case "edit":
                updateProductInformation(request,response);
                listProduct(request,response);
                break;
            case "delete":
                deleteProductById(request,response);
                listProduct(request,response);
                break;
            default:
                listProduct(request,response);
        }
    }

    private void updateProductInformation(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = new Product(id,name,description,Double.parseDouble(price));
        serviceRepository.edit(id,product);
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
                listProduct(request,response);

        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> list = this.serviceRepository.findAll();
        request.setAttribute("productList",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createProduct(HttpServletRequest request , HttpServletResponse response) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        int id = this.serviceRepository.findAll().size() +1;
        Product product = new Product(id,name,description,Double.parseDouble(price));
        this.serviceRepository.save(product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/create.jsp");
        request.setAttribute("message", "New product was created");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteProductById(HttpServletRequest request , HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String confirm = request.getParameter("name");
        if(confirm.equals("Yes")){
            serviceRepository.delete(id);
        }
    }
    private void showDeleteForm(HttpServletRequest request , HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.serviceRepository.findById(id);
        request.setAttribute("customerObj", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/delete.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.serviceRepository.findById(id);
        request.setAttribute("customerObj", product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


}
