package bit.or.team4.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bit.or.team4.dto.emp;

@WebFilter("*.do")
public class SessionFilter implements Filter {
   private List<String> accessList;
   
    public SessionFilter() {
       accessList = new ArrayList<String>();
       accessList.add("/loginRedirect.do");
       accessList.add("/");
       accessList.add("/login.do");
       //accessList.add("/Emplist.do"); //삭제
       accessList.add("/GoHome.do");
       accessList.add("/index.jsp");
       accessList.add("/index.html");
       accessList.add("/Logout.do");
    }

   public void destroy() {
   }

   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      
      HttpServletRequest req = (HttpServletRequest) request;
      
      String uri = req.getRequestURI();
       String contextPath = req.getContextPath();
       String url = uri.substring(contextPath.length());

//      System.out.println("Filter URI : " + url);
//      System.out.println("포함 여부 : " + accessList.contains(url) );
       
      if(!accessList.contains(url)) {
         HttpSession session = req.getSession();
         
         String admin = (String)session.getAttribute("userid");
         if(!(admin=="admin")) {
            HttpServletResponse res = (HttpServletResponse) response;
            res.sendRedirect("GoHome.do");
            return;
         }      
      }
      
      chain.doFilter(request, response);
      
      
   }

   public void init(FilterConfig fConfig) throws ServletException {
      
   }

}