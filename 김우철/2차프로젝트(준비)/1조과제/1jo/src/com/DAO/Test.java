package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
public class Test {

	public JSONArray getAllMembersJSONArray() {

		Connection conn = null;
		 JSONArray jsonArray = new JSONArray();
		 JSONObject responseObj = new JSONObject();
		try {
		    //드라이버 호출, 커넥션 연결
			Class.forName("oracle.jdbc.OracleDriver");
		    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bit","1004");

			ResultSet rs = null;
		    //DB에서 뽑아온 데이터(JSON) 을 담을 객체. 후에 responseObj에 담기는 값

		String query = "select count(*) from jo_member";


		PreparedStatement pstm = conn.prepareStatement(query);
		    rs = pstm.executeQuery(query);

		    
		   
		    //ajax에 반환할 JSON 생성
		   

		    JSONObject lineObj = null;
		    int count = 0;
			while (rs.next()) {
					count = rs.getInt(1);
			    	lineObj = new JSONObject();
		        	lineObj.put("count", count);
		        	jsonArray.add(lineObj);
		    } 

		/* responseObj.put("dustlist", dustlist); */
		    /* out.print("kwc" + responseObj.toString()); */
		   // request.setAttribute("mCount", count);


		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			if (conn != null) {
		        try {
		            conn.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }
		

		}

		return jsonArray;

	} // getAllMembersJSONArray()

}
