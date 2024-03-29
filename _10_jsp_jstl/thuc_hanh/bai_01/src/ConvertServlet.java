import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ConvertServlet",urlPatterns = "/convert")
public class ConvertServlet extends HttpServlet {
    private static final float RATE = 22000;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float money = Float.parseFloat(request.getParameter("money"));
        float result = money * RATE;
        List<String> list = new ArrayList<>();
        list.add("tung");
        list.add("cong");
        request.setAttribute("result",result);
        request.setAttribute("list",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("convert.jsp");
        requestDispatcher.forward(request,response);
    }
}
