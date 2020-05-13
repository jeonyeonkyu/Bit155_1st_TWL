package kr.or.kosta;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//localhost:8090/WebServlet_3/MemoServlet
@WebServlet("/MemoServlet")
public class Memoservlet extends HttpServlet {
 private static final long serialVersionUID = 1L;
       
   
    public Memoservlet() {
        super();
       
    }

 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doProcess(request, response);
 }

 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 doProcess(request, response);
 }
 private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  //1.�ѱ�ó��
  //2.������ �ޱ�
  //3.DB����
  //4.Insert ����
  //5.���䱸��
	 
	 
	 
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html;charset=UTF-8"); //Ŭ���Ʈ���� ������ �������� ���� ����
  PrintWriter out = response.getWriter();
  
  String id = request.getParameter("id");
  String email = request.getParameter("email");
  String memo = request.getParameter("memo");
  //out.print(id + "," + email + "," + memo);
  
  
  try{
   Class.forName("oracle.jdbc.OracleDriver");
   Connection conn =null;
   PreparedStatement pstmt = null;
   conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit","1004");
   
   //out.print("DB���� : " +conn.isClosed());
   String sql="insert into memo(id,email,content) values(?,?,?)";
   
   pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, id);
   pstmt.setString(2, email);
   pstmt.setString(3, memo);
   
   int n = pstmt.executeUpdate();
   
   if(n>0){ //�ڡڡڡڡ�
	    out.print("<script>");
     	out.print("alert('��ϼ���..');");
     	out.print("location.href='MemoList';"); 
     	//�ּ�â�� �Է� enter (F5) ��û
     	//localhost:8090/WebServlet_3/MemoList
    out.print("</script>");
   }else{ //insert ���� ���������� ��� ...
	    out.print("<script>");
	    out.print("alert('��Ͻ���..');");
	    out.print("location.href='memo.html';");
	    out.print("</script>");
   }
   
   if(pstmt != null) pstmt.close();
   if(conn != null)  conn.close();
  }catch(Exception e){
   out.print("<b> ���� :" +  e.getMessage()  + "</b>");
   
  }
  
  
     
  
  
 }
 
}
