package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

import com.DTO.UserDTO;

import util.Singleton_Helper;

public class AdminDAO {
	// +-------------½Ì±ÛÅæ ÆÐÅÏ Àû¿ë-------------+
	private static AdminDAO adminDAO;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	JSONArray jsonArray = new JSONArray();

	public AdminDAO() {
		try {
			conn = Singleton_Helper.getConnection("oracle");
		} catch (Exception e) {
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

	public int LoadJSON() { //ÃÑ È¸¿ø ¼ö
		String sql = "select count(*) from jo_member";
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.err.println(e);
			System.err.println("join SQLException error");
		} finally {
			Singleton_Helper.close(pstmt);
			Singleton_Helper.close(rs);
		}
		return count;
	}
}
