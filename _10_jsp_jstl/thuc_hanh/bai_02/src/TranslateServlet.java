import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TranslateServlet",urlPatterns = "/translate")
public class TranslateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String ,String> map = new HashMap<>();
        map.put("Hello","Xin chào");
        map.put("Good bye","Tạm biệt");
        map.put("Sorry","Xin lỗi");
        map.put("Class","Lớp");
        map.put("Object","Đối tượng");

        String string = request.getParameter("word");
        String result = map.get(string);
        if(result != null){
            request.setAttribute("result",result);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/translate.jsp");
            requestDispatcher.forward(request,response);
        }
    }
}
