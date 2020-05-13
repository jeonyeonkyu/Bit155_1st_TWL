package kr.or.bit.dao;

import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class EmpDao {

	DataSource ds = null;

	public EmpDao() {
		try {
			Context context = new InitialContext(); // 현재 프로젝트에 이름기반 검색
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");// java:comp/env/ + name
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
