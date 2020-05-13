package kr.or.bit.action;

//servlet에서 받는 요청은 화면전달 OR 로직작업(DB작업) , view의 경로 설정 등... 
public class ActionForward {
	private boolean isRedirect = false; //화면 아니면 로직제어
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
