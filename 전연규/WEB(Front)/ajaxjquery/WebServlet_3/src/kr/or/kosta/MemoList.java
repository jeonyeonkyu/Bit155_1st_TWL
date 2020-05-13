package kr.or.kosta;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MemoList")
public class MemoList extends HttpServlet {
 private static final long serialVersionUID = 1L;
       

    public MemoList() {
        super();
       
    }

 
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doProcess(request, response);
 }

 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doProcess(request, response);
 }

 private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  //memo  ��ü ������ ��ȸ
  //ȭ�� ���� ���
  response.setContentType("text/html; charset=utf-8"); 
        PrintWriter out = response.getWriter(); 
         
        //select ���� �̿��ؼ� memo ���̺� �ִ�  
        //���ڵ���� ������ table���·� �ٸ� �����ش�. 
         
        //[1] DB�� �����Ͽ� select�� ���� 
         
        try { 
         Class.forName("oracle.jdbc.OracleDriver");
         Connection conn = null;
         PreparedStatement  ps = null;
         conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","bit", "1004");
           
            String sql="select * from memo"; 
            ps = conn.prepareStatement(sql); 
             
            ResultSet  rs = ps.executeQuery(); 
             
            out.println("<body><div align=center>"); 
            out.println("<hr color=green width=400><h2> Line Memo List </h2><hr color=green width=400>"); 
            out.println("<table width='500' border='1'>" 
                         +"<tr bgcolor='gold'><th width='25%'>Writer</th>" 
                         +"<th width='50%'>MemoContent</th><th width='25%'>Email</th></tr>");         
            while(rs.next()){//------------------------- 
                String id = rs.getString("id"); 
                String str = rs.getString("content"); 
                String email = rs.getString("email"); 
                 
                 
                out.println("<tr><td>"+id+"</td>"); //�ۼ��� 
                out.println("<td>"+str+"</td>"); //�޸𳻿� 
                out.println("<td>"+email+"</td></tr>"); //�̸���                 
            }//while-------------------------------------         
             
            out.println("</table></div><center><a href='memo.html'>�۾���</a></center></body>"); 

            rs.close(); 
            ps.close(); 
            conn.close(); 
             
        } catch (Exception e) { 
             
            out.println("<font color=red> ���� : "); 
            out.println(e.getMessage()+"<br/>"); 
            out.println("</font>"); 
        } 
         
        out.close(); 
    }//End service()------------ 
}
