package com.dasol.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionProvider {
	public static Connection getConnection() throws SQLException, NamingException {
		//return DriverManager.getConnection("jdbc:apache:commons:dbcp:myboard");
	     //java:comp/env/jdbc/mysql
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/mysql"); //java:comp/env/ 규칙 + 이름

		return ds.getConnection(); //함수가 POOL 에있는 connection 객체 얻어오기
	}
}
