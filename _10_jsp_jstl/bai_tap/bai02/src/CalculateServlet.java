import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculateServlet",urlPatterns = "/calculation")
public class CalculateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double num1 = Double.parseDouble(request.getParameter("number1"));
        double num2 = Double.parseDouble(request.getParameter("number2"));
        String cal = request.getParameter("cal");
        double result=0;
        String notice = null;
        switch (cal){
            case "sum":
                result = num1 + num2;
                notice = String.valueOf(result);
                request.setAttribute("result",notice);
                break;
            case "sub":
                result = num1 - num2;
                notice = String.valueOf(result);
                request.setAttribute("result",notice);
                break;
            case "mul":
                result = num1*num2;
                notice = String.valueOf(result);
                request.setAttribute("result",notice);
                break;
            case "div":
//                try{
//                    if(num2 == 0){
//                        throw  new ArithmeticException();
//                    }else {
//                        result = num1 / num2;
//                        notice = String.valueOf(result);
//                        request.setAttribute("result",notice);
//                    }
//                }catch (ArithmeticException e){
//                    notice = "ERROR DIVISION BY 0";
//                    request.setAttribute("result",notice);
//                    request.getRequestDispatcher("result.jsp").forward(request,response);
//                }
                if(num2 == 0){
                    notice ="ERROR DIVISION BY 0";
                    request.setAttribute("result",notice);
                    request.getRequestDispatcher("result.jsp").forward(request,response);
                }
                break;
        }

       request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}
