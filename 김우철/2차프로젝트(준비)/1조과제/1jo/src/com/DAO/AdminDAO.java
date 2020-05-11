package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import com.DTO.UserDTO;

import util.ConnectionHelper;

public class AdminDAO {
	// +-------------½Ì±ÛÅæ ÆÐÅÏ Àû¿ë-------------+
	private static AdminDAO adminDAO;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	JSONArray jsonArray = new JSONArray();
	DataSource ds = null;

	public AdminDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");// java:comp/env/ + name
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static synchronized AdminDAO getInstance() {
		if (adminDAO == null) {
			adminDAO = new AdminDAO();
		}
		return adminDAO;
	}
	// +-------------½Ì±ÛÅæ ÆÐÅÏ Àû¿ë-------------+

	public int LoadJSON() { // ÃÑ È¸¿ø ¼ö
		String sql = "select count(*) from jo_member";
		Connection conn = null;
		int count = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.err.println(e);
			System.err.println("join SQLException error");
		} finally {
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(rs);
			ConnectionHelper.close(conn);
		}
		return count;
	}
}
