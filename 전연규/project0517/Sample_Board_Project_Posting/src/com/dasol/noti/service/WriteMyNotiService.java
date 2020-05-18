package com.dasol.noti.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.dasol.jdbc.ConnectionProvider;
import com.dasol.jdbc.JdbcUtil;
import com.dasol.noti.dao.MyNotiDAO;
import com.dasol.noti.model.MyNotification;

public class WriteMyNotiService {
	
	MyNotiDAO myNotiDAO = new MyNotiDAO();
	
	public void writeMyNoti(MyNotification myNoti) {
		Connection conn = null;
		try {
			try {
				conn = ConnectionProvider.getConnection();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			conn.setAutoCommit(false);
			myNotiDAO.insert(conn, myNoti);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			 throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
