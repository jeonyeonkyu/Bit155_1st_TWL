package kr.or.bit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.dao.memodao;
import kr.or.bit.dto.memo;


@WebServlet("/MemoList")
public class MemoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemoList() {
        super();
       
    }
    
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//������ select .... view ������ �� ���� .....
		//view �� ������ ���� ���� (���� ....) >> memolist.jsp 
		try {
			 //��û �Ǵ� ... �ʿ���� (��û�� servlet 1���� ...)
			 //�� servlet ��ü��ȸ ....
			 
			 memodao dao = new memodao();
			 List<memo> memolist = dao.getMemoList();
			 System.out.println("memolist : " + memolist);
			 //������ ����
			 request.setAttribute("memolist", memolist);
			 
			 //view ������ ����
			 RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
			 
			 //forward 
			 dis.forward(request, response); 
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
