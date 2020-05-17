package com.dasol.noti.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.dasol.jdbc.ConnectionProvider;
import com.dasol.noti.dao.MyNotiDAO;
import com.dasol.noti.model.MyNotification;

public class ReadMyNotiService {
	MyNotiDAO myNotiDAO = new MyNotiDAO();
	
	public NotiData readMyNoti(int myId) throws NamingException {
		try (Connection conn = ConnectionProvider.getConnection()){
			List<MyNotification> notiList = myNotiDAO.getMyNotiList(conn, myId);
			return new NotiData(notiList);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean isNotiCheck(int myId) throws NamingException {
		try (Connection conn = ConnectionProvider.getConnection()) {
			int falseCnt = myNotiDAO.selectFalseCount(conn, myId);
			if (falseCnt == 0) {
				return true;
			}
			return false;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}