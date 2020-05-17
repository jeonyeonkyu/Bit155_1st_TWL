
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/json.kosta")
public class parameterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public parameterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String command = request.getParameter("command");
    	String name = request.getParameter("name");
    	String[] arr = request.getParameterValues("array[]");   
    
    	System.out.println("command : " + command);
		System.out.println("name : " + name);
		System.out.println("arr : " + arr);
		
		for(String str : arr){
            System.out.println(str);
        }
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
