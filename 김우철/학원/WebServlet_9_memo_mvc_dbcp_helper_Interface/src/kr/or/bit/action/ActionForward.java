package kr.or.bit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet ��û : ȭ�������̳� ��������(DB)�� view�� ��ΰ� ���� ��.. -> �̷��͵��� ǥ��ȭ �ϰ����
public class ActionForward  {
	//��ǻ� isRedirect�� �ʿ����
	private boolean isRedirect = false; //ȭ����� �������ų� ������ �����Ұų�
	private String path = null; //�̵����(���� �ּ�)

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
