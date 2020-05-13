package kr.or.bit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//servlet 요청 : 화면전달이냐 로직제어(DB)냐 view의 경로가 어디냐 등.. -> 이런것들을 표준화 하고싶음
public class ActionForward  {
	//사실상 isRedirect는 필요없음
	private boolean isRedirect = false; //화면단을 가져갈거냐 로직을 제어할거냐
	private String path = null; //이동경로(뷰의 주소)

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
