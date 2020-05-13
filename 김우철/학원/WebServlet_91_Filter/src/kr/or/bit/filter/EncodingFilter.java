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
	
	//���� �����
	private String encoding;
	
	//s
	public void init(FilterConfig fConfig) throws ServletException {
		//���������� ���� ��û�� ������ �ǰ� �ѹ��� �����
		//fConfig parameter ���ؼ� �������� read(web.xml)
		this.encoding = fConfig.getInitParameter("encoding");
		System.out.println("Filter init �Լ� : " + this.encoding);
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//ü�� ���� ��û�� �������� �����ϴ� �ڵ�(request)
		if(request.getCharacterEncoding() == null) {
			System.out.println("before : " + request.getCharacterEncoding());
			request.setCharacterEncoding(this.encoding); //���� ...����(����)
			System.out.println("after : " + request.getCharacterEncoding()); //UTF-8;
		}
		chain.doFilter(request, response);
		//response (���� �ڵ� ó���� ���� �� ��)
		//ü�α��� ������ ������ �����ϴ� �ڵ�
			System.out.println("response ���� ó��");
		
	}


    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	

}
