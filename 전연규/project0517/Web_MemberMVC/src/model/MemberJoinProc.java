package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/proc.do")
public class MemberJoinProc extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberBean bean=new MemberBean();
		bean.setId(request.getParameter("id"));
		bean.setAge(request.getParameter("age"));
		bean.setEmail(request.getParameter("email"));
		String[] arr=request.getParameterValues("hobby");
		String data="";
		for(String string : arr){
			data +=string + " ";//하나의 스트림으로 데이터 연결				
		}
		bean.setHobby(data);
		bean.setInfo(request.getParameter("info"));
		bean.setJob(request.getParameter("job"));
		String pass1=request.getParameter("pass1");
		String pass2=request.getParameter("pass2");
		bean.setPass1(pass1);
		bean.setPass2(pass2);
		bean.setTel(request.getParameter("tel"));
			
		//패스워드가 같을 경우에만 데이터 베이스에 저장
		if(pass1.equals(pass2)){
			//데이터 베이스 객체 생성
			MemberDAO mdao =new MemberDAO();
			mdao.insertMember(bean);
			
			RequestDispatcher dis =request.getRequestDispatcher("MemberlistCon.do");
		    dis.forward(request, response);
					
		}else{
			request.setAttribute("msg", "패스워드가 일치 하지 않습니다.");
			RequestDispatcher dis =request.getRequestDispatcher("LoginError.jsp");
			dis.forward(request, response);
		}
	}

	
	
}


