package kr.or.bit.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MvcRegisterDao;
import kr.or.bit.dto.MvcRegister;

//ȸ�� ������ write�ϴ� ����
//�����ϴ� �Լ� : execute
public class MemberWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//7��������Ʈ URI�� ������ �ִ���
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//controller -> service ��ü ó��
		//dao , dto ó��
		
		MvcRegister dto = new MvcRegister();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		MvcRegisterDao dao = new MvcRegisterDao();
		int result = dao.writeOk(dto);
		
		String resultdata="";
		if(result > 0) {
			resultdata ="welcome to bit " + dto.getId() + "��";
		}else {
		   resultdata = "Insert Fail retry";
		}
		
		//3. ��� �����ϱ� 
		request.setAttribute("data", resultdata); //�ڡڡڡڡ�(��Ʈ�ѷ����� ���� request �̿�)
		//viewpage = "/WEB-INF/Register/Register_welcome.jsp";
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/Register/Register_welcome.jsp");
		
		return forward;
	}

}
