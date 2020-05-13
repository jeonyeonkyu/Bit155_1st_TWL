package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.MemoAddService;
import kr.or.bit.service.MemoIdCheckService;
import kr.or.bit.service.MemoListService;

@WebServlet("*.memo")
public class FrontMemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontMemoController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		if (url_Command.equals("/MemoAdd.memo")) { // �۾��� ó��
			// UI+����
			action = new MemoAddService();
    		forward = action.execute(request, response);
    		System.out.println("MedoAddSerivce ����");
		} else if (url_Command.equals("/MemoList.memo")) { // ��Ϻ���
			action = new MemoListService();
    		forward = action.execute(request, response);
    		System.out.println("MemoListService ����");
			// UI+����
		} else if (url_Command.equals("/MemoId.memo")) { // �񵿱�(ID ��� ����)
			action = new MemoIdCheckService();
    		forward = action.execute(request, response);
    		System.out.println("MemoIdCheckService ����");
			// UI+����
		} else if (url_Command.equals("/MemoView.memo")) { // ���� �ִٸ� �󼼺���
			// UI�� ����...
			//��) /WEB-INF/views/memoview.jsp�� �ִٰ� ����...
			forward = new ActionForward(); //�̰žȽᵵ�Ǵµ� ����ȭ(ǥ��ȭ)���ֱ� ���� ���
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/memoview.jsp");
		}

		// 4. �� �����ϱ�
		// RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		if (forward != null) {
			if (forward.isRedirect()) { // true (���ΰ�ħ..)
				response.sendRedirect(forward.getPath());
				// sendRedirect ��������!! ���⼭�� �н���
			} else { // false(��� �ڿ��� isRedirect()�� �� false�� Ÿ�� �Ұ���) �׷��� �ּҰ� �ȹٲ�
				// ����Ǽ� 1 : UI
				// ����Ǽ� 2 : UI + ����
				// forward : URL �ּ� ��ȭ ���� view�� ������ ���� �� �ִ�
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		// 5. forward(request ��ü�� �ּҰ��� ����)
		// dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
