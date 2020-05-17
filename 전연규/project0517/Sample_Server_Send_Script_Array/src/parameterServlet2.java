

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class parameterServlet2
 */
@WebServlet("/json.kosta2")
public class parameterServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
     public parameterServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//클라이언트에서 넘긴 데이터 받기 
        String[] aStr = request.getParameterValues("string[]");         
        
        //배열의 값 출력1
        System.out.println("배열에 들어있는값 : "+Arrays.toString(aStr));
        
        //배열의 값 출력2
        for(String str : aStr){
            System.out.println(str);
        }
        
        //클라이언트에 값 전달.
        //요청한곳에 응답. json형식 및 다양한 형식으로 전달 가능
        if(aStr != null){            
            PrintWriter out = response.getWriter();
            out.write("[\""+aStr[0]+"\",\""+aStr[1]+"\"]");
            out.close();
        }            
 		
 		
 	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
