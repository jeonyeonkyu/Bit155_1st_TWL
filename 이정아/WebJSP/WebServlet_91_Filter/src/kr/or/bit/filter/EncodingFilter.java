package kr.or.bit.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


//@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter {
	
	private String encoding;
	
	
    public EncodingFilter() {
     
    }

	public void destroy() {
		
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		//필터가 최초요청 됐을 시 컴파일되고 한번만 실행되는 함수 fconfig라는 파라미터값을 받아와서 초기 설정된 변수값을 read할 수 있다.(web.xml)
		this.encoding = fConfig.getInitParameter("encoding"); //이렇게 해줌으로써 코드는 손 안대도 되고 xml파일만 바꿔주면 됨.
		System.out.println("fileter init함수 : " + this.encoding);
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException { //실행되면 dofilter가 강제실행
		//doFilter를 기준으로 요청을 받았을 때 실행되는 내용
		if(request.getCharacterEncoding() == null) {
			System.out.println("before" + request.getCharacterEncoding());
			
			request.setCharacterEncoding(this.encoding); //이 코드가 UTF-8로 설정해주는 코드 ( init 함수에서  this.encoding으로 넘겨줌)
			
			System.out.println("after: " + request.getCharacterEncoding());
		}
		
		chain.doFilter(request, response);
		//response (응답코드가 실행될 때)
		//응답을 할 때 실행되는 코드 지금은 딱히 정의하지 않음
		System.out.println("response 응답 처리");
	}


	

}















