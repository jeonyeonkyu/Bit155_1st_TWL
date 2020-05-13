package kr.or.bit.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response);
	//서블릿의 함수 parameter와 같음 추상함수라서 상속받을 때 함수를 무조건 구현해야 하고 리턴타입이 ActionFoward 타입이어야 한다.
	
}
