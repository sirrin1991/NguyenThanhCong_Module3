import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DictionaryServlet",urlPatterns = "/translate")
public class DictionaryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String,String> map = new HashMap<>();
        map.put("Hello","Xin chào");
        map.put("Class","Lớp");
        map.put("Object","Đối tượng");
        map.put("Read","Đọc");
        map.put("Write","Viết");

        String word = request.getParameter("word");
        String result = map.get(word);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        if(result != null){
            writer.println("Word: " +word);
            writer.println("<br>");
            writer.println("Result: " +result);
        }else {
            writer.println("Not found");
        }
        writer.println("</html>");
    }
}
