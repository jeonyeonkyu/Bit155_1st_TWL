package kr.or.bit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionForward {
	private boolean isRedirect = false;  //화면 아니면 로직 제어 결정하는것으로 쓴다
	private String path = null; //이동 경로( 뷰의 주소를 입력하는 것으로 쓴다)
	
	
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
