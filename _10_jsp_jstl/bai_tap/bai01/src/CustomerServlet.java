import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> list = new ArrayList<>();
        list.add(new Customer("Taylor Swift","13/12/1989","USA","https://upload.wikimedia.org/wikipedia/commons/5/58/Rhode_Island_Red_Rooster2.JPG"));
        list.add(new Customer("Adam Levine","18/03/1979","USA",""));
        list.add(new Customer("Bruno Mars","08/10/1985","USA",""));
        list.add(new Customer("Adele","05/05/1988","UK",""));
        request.setAttribute("list", list);
//        request.getRequestDispatcher("/index.jps").forward(request, response);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);

    }
}
