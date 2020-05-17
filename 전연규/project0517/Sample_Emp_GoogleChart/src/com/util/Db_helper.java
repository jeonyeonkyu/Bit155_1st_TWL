package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Db_helper {
	private static Connection conn = null; // public > private

	private Db_helper() {
	}

	public static Connection getConnection() {
		if (conn != null) {
			// System.out.println("conn is not null");
			return conn;
		}
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bit","1004");

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// System.out.println("conn return");
		return conn;
	}

	public static void DBClose() {
		if (conn != null) {
			try {
				conn.close();
				conn = null;
			} catch (Exception e) {

			}
		}
	}

	/*public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
*/
	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
