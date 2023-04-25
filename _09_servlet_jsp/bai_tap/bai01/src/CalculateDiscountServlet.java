import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculateDiscountServlet",urlPatterns = "/calculate")
public class CalculateDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String decs = request.getParameter("desc");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double discountAmount = price *discount*0.01;
        double newPrice = price - discountAmount;
        request.setAttribute("Desc",decs);
        request.setAttribute("price",price);
        request.setAttribute("discount",discount);
        request.setAttribute("discountAmount",discountAmount);
        request.setAttribute("newPrice",newPrice);
        RequestDispatcher a = request.getRequestDispatcher("display-discount.jsp");
        a.forward(request,response);
    }
}
