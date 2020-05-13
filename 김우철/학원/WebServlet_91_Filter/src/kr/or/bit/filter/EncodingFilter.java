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
	
	//변수 만들기
	private String encoding;
	
	//s
	public void init(FilterConfig fConfig) throws ServletException {
		//필터파일의 최초 요청시 컴파일 되고 한번만 실행됨
		//fConfig parameter 통해서 변수값을 read(web.xml)
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("Filter init 함수 : " + this.encoding);
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//체인 기준 요청이 들어왔을때 실행하는 코드(request)
		if(request.getCharacterEncoding() == null) {
			System.out.println("before : " + request.getCharacterEncoding());
			request.setCharacterEncoding(this.encoding); //한줄 ...공통(보조)
			System.out.println("after : " + request.getCharacterEncoding()); //UTF-8;
		}
		chain.doFilter(request, response);
		//response (응답 코드 처리가 실행 될 때)
		//체인기준 응답을 했을때 실행하는 코드
			System.out.println("response 응답 처리");
		
	}


    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	

}
