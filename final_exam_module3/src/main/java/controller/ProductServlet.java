package controller;

import model.bean.Category;
import model.bean.Product;
import model.service.CategoryService;
import model.service.CategoryServiceImpl;
import model.service.ProductService;
import model.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "StudentServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                createProduct(request,response);
                break;
            default:
                loadList(request,response);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String price =request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        String categoryId = request.getParameter("categoryId");

        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setColor(color);
        product.setDescription(description);
        product.setCategoryId(categoryId);

        Map<String,String> mapError = productService.add(product);
        List<Category> list = categoryService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");

        if(mapError.isEmpty()){
            String result = "Successfully";
            request.setAttribute("result",result);
            request.setAttribute("list",list);
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }else {
            request.setAttribute("mapError",mapError);
            request.setAttribute("list",list);
            request.setAttribute("product",product);
            try {
                requestDispatcher.forward(request,response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                productService.delete(id);
                loadList(request,response);
                break;
            default:
                loadList(request,response);
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/update.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Category> list = categoryService.findAll();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> list = productService.findAll();
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


}
