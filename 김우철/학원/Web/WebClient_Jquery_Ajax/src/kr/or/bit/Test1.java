package kr.or.bit;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.axis.utils.IOUtils;

/**
 * Servlet implementation class Test1
 */
@WebServlet("/get.do")
public class Test1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Test1() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String addr = "http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=1159063000";
	        URL url = new URL(addr);
	         
	         
	        InputStream in = url.openStream();
	        CachedOutputStream bos = new CachedOutputStream();
	        IOUtils.copy(in, bos);
	        in.close();
	        bos.close();
	         
	        String data = bos.getOut().toString();     
	        out.println(data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
