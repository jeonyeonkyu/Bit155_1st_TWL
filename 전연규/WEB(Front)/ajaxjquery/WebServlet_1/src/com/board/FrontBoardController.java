package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/ProntBoardController")
public class FrontBoardController extends HttpServlet {
       
    public FrontBoardController() {
        super();
    }
    //GET, POST �ΰ��� ��û��Ŀ� ���ؼ� �����ϴ� �Լ�
    //doGet(), doPost() �ڵ� ȣ��
    //1.servlet�� �����ϴ� �Լ� : service() �Լ�
    //2.������ �Լ�(������ ����) : doGET, doPOST ó��
    //doProcess()
    
    private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
    	//�� �Լ��� GET, POST ��û�� �Ѵ� ó��
    	System.out.println("Ŭ���̾�Ʈ ��û : " + method);
    	
    	//1.�ѱ� ó��
    	
    	//2.��û �ޱ�(request)
    	
    	//3.��û �Ǵ�(�Ǵ��� ���� : parameter) : command ���
    	//3.1 parameter ���� �Ǵ�
    	//3.2 http://localhost:8090/WebServlet_1/board?cmd=login&userid=kglim
    	
    	//String str = request.getParameter("cmd");
    	//if(str.equals("login'){ �α��� ó�� }
    	
    	//board?cmd=boardlist
    	//String str = request.getParameter("cmd");
    	//if(str.equals("boardlist") { �Խ��� ó�� }
    	
    	//cmd�� �ݴ�Ǵ� ���(URL �ּ� �Ǵ�) : ***URL ���
    	//3.2 http://localhost:8090/WebServlet_1/board/boardlist
    	//3.2 http://localhost:8090/WebServlet_1/board/boardwrite?title=hello&content=
    	//������ �ּҰ����� �Ǵ� : /boardlist ��Ϻ���
    	//					//boardwrite �۾���
    	//�������� �ּҰ��Ǵ����� �����ҵ�?
    	
    	//4.�������(scope : request, session, application)
    	//������ request�� ���� ��� 
    	
    	//5.view ����
    	//view page : jsp����
    	//WebContent > board > boardlist.jsp
    	//WebContent > error > error404.jsp
    	//�� �ڵ� ������ : ���� ����
    	//http://localhost:8090/WebServlet_1/board/boardEditOk.jsp : >> URL ��� (Ŭ���̾�Ʈ�� ���� �ּ�â�� ����� �ȵǴ� �ּ�)
    	//�������� forward�ϴ� ���� ����ڰ� ���� url�� ���� ���� ���ƾ� �ϱ� ������
    	//�� �Ǽȷ� ȸ������ �α��� ����� �� ���������� ��������..
    	//���� ������Ʈ������ JSP ���� ....??? �����̿�;;
    	//�ذ� : ���� ���� : WEB-INF >> views ���� >
    	//1. WEB-INF >> views >> board >> boardlist.jsp
    	//2. WEB-INF >> views >> error >> error404.jsp
    	//WAS ���ο����� ���� ���� ���� : forward ������� ó������ �� ���� �ڵ带 read ����
    	
    	//6.view���� ����� ��ü ����(forward)
    	
    	///////////////////////////////////// �ǽ� ����
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	//1.��û�ޱ�(command ���)
    	//http://localhost:8090/WebServlet_1/board?cmd=list
    	String cmd = request.getParameter("cmd");
    	
    	//2.��û �Ǵ�(���� ����)
    	String viewpage = null;
    	//cmd >> null >> error.jsp ��
    	//cmd >> boardlist >> list.jsp ��
    	//cmd >> boardwrite >> write.jsp ��
    	
    	if(cmd == null) {
    		viewpage = "/error/error.jsp";
    	}else if(cmd.equals("boardlist")) {
    		viewpage = "/board/boardlist.jsp";
    		//���� ���� ó��
    		//DB ����...select ... ��ü�� ��� ... ����
    		//boardDao dao = new boardDao();
    		//List<board> boardlist = dao.selectBoardList();
    		//request.setAttribute("list", boardlist);
    		//forward >> view ���� >> boardlist.jsp
    		//EL & JSTL
    		//<c:set var="list" value="<%= request.getAttribute("list") %>"
    		//<c:set var="memolist" value="${requestScope.memolist}"></c:set>
    		//<c:forEach ȭ�����...
    	}else if(cmd.equals("boardwrite")) {
    		viewpage = "/board/boardwrite.jsp";
    	}else if(cmd.equals("Login")) {//�� ���߿����� ...��������
    		viewpage = "/WEB-INF/views/login/login.jsp"; //�� ����...
    	}else {
    		viewpage = "/error/error.jsp";
    	}
    	
    	//3.�������
    	//���� ..
    	//List<Emp> list=  new ArrayList<>();
    	//list.add(new Emp(2000, "������"));
    	//....
    	//request.setAttibute("emplist", list);
    	
    	//4.view ����
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	
    	//5.������ ����(forward)
    	dis.forward(request, response);    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}
