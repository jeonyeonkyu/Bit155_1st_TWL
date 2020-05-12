package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.bit.dto.MvcRegister;

public class MvcRegisterDao {
	static DataSource ds;
	//1. �����ڿ��� ds ��ü �ʱ�ȭ
	//2. static �ʱ��� : static{ static ��� �ʱ�ȭ }
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	static {
		InitialContext ctx;
		try {
			 ctx = new InitialContext();
			 Context envctx= (Context)ctx.lookup("java:comp/env"); //�⺻����
			 ds =(DataSource)envctx.lookup("/jdbc/oracle");//context.xml ���� name="jdbc/oracle"
		}catch (Exception e) {
			System.out.println("look up Fail : " + e.getMessage());
		}
		 //Context context = new InitialContext(); //�̸���� �˻�
		 //ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); ///jdbc/oracle pool �˻�
		
		
	}
	
	//CRUD �Լ�
	public int writeOk(MvcRegister dto) {
		int row = 0;
		
		try {
			  conn = ds.getConnection();
			  String sql="insert into mvcregister(id,pwd,email) values(?,?,?)";
			  pstmt = conn.prepareStatement(sql);
			  
			  pstmt.setInt(1, dto.getId());
			  pstmt.setString(2, dto.getPwd());
			  pstmt.setString(3, dto.getEmail());
			  
			  row = pstmt.executeUpdate();
			  
		}catch (Exception e) {
			System.out.println("write ok Exception : " + e.getMessage());
			row = -1;
		}finally {
			if(pstmt != null)try{pstmt.close();}catch (Exception e){}
			if(conn != null) try{conn.close();}catch (Exception e){}  //��ȯ
			
		}
		System.out.println(row);
		return row;
	}
	
	//���� select �Լ�
	
	//���� select �Լ�
	
	//update �Լ�
	
	//delete �Լ�
	
	
	
}








