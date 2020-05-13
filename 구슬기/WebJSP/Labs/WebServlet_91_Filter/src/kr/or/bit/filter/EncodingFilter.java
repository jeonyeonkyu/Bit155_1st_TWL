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
	
	public void init(FilterConfig fConfig) throws ServletException {
		//최초 요청시 컴파일 되고 한번만 실행
		//fConfig parameter 통해서 변수값을 read (web.xml)
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("Filter init 함수 : " + this.encoding);
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		
		//요청이 들어왔을때 실행되는구문
		if(request.getCharacterEncoding() == null) { //얘도 겟터함수있어서 읽으면 get쓰면 set가능
			System.out.println("before : " + request.getCharacterEncoding()); //캐릭터인코딩 설정안되면 이렇게 가고
			
			request.setCharacterEncoding(this.encoding); //한줄 .... 공통의 역할을 한다
			
			System.out.println("after :" + request.getCharacterEncoding());  //여기서 이제UTF-8찍혀야함

		}
		//request 요청이 들어오면 chain위의 코드는 다 실행된다 
		
		chain.doFilter(request, response); 
		
		//response (응답 코드 처리가 실행 될때)
		 // 응답을 했을때 실행되는 구문
	      //아무것도 안하고걍 나가는것만 확인할게요
			System.out.println("response 응답 처리");
	}
	
	
	
    public EncodingFilter() {
       
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	

	


}
