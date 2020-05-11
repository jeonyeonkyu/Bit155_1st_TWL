package DAO;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import net.sf.json.JSONArray;

import DTO.CalendarDTO;
import util.Singleton_Helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CalendarDAO {
	public static CalendarDAO calendarDAO;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;

	public CalendarDAO() {
    	 try{
         	conn = Singleton_Helper.getConnection("oracle");
         }catch(Exception e){
             e.printStackTrace();
         }
    }

	public static synchronized CalendarDAO getInstance() {
		if (calendarDAO == null) {
			calendarDAO = new CalendarDAO();
		}
		return calendarDAO;
	}

	public List<CalendarDTO> selectList() {
		List<CalendarDTO> list = new ArrayList<>();

		try {
			String sql = "select * from calendar";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				CalendarDTO calendarDTO = new CalendarDTO();
				calendarDTO.setId(rs.getLong("c_id"));
				calendarDTO.setTitle(rs.getString("c_title"));
				calendarDTO.setStart(rs.getString("c_start"));
				calendarDTO.setEnd(rs.getString("c_end"));
				list.add(calendarDTO);
			}
			
		} catch (Exception e) {
			System.out.println(e);
			System.err.println("selectList SQLException error");
		} finally {
			Singleton_Helper.close(rs);
			Singleton_Helper.close(pstmt);
		}
		return list;
	}
	
	
	  public int input(CalendarDTO calendarDTO){
	        StringBuffer query = new StringBuffer();
	        query.append("INSERT INTO calendar").append(" VALUES (?, ?, ?, ?)");
	        try{
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setLong(1, calendarDTO.getId());
	            pstmt.setString(2, calendarDTO.getTitle());
	            pstmt.setString(3, calendarDTO.getStart());
	            pstmt.setString(4, calendarDTO.getEnd());
	            result = pstmt.executeUpdate();
	        } catch(SQLException e){
	        	System.err.println(e);
	            System.err.println("input SQLException error");
	        } finally {
	        	 Singleton_Helper.close(pstmt);
	        }
	        return result;
	    }
	  
	  
	  public int delete(Long c_id){
	        StringBuffer query = new StringBuffer();
	        query.append("delete from calendar").append(" where c_id = ?");
	        try{
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setLong(1, c_id);
	            result = pstmt.executeUpdate();
	        } catch(SQLException e){
	        	System.err.println(e);
	            System.err.println("delete SQLException error");
	        } finally {
	        	 Singleton_Helper.close(pstmt);
	        }
	        return result;
	    }
	  
	  public int update(CalendarDTO calendarDTO) {
	        StringBuffer query = new StringBuffer();
	        query.append("UPDATE calendar SET c_title = ?, ");
	        query.append("c_start = ?, ");
	        query.append("c_end = ? ");
	        query.append("WHERE c_id = ?");

	        try {
	            pstmt = conn.prepareStatement(query.toString());
	            pstmt.setString(1, calendarDTO.getTitle());
	            pstmt.setString(2, calendarDTO.getStart());
	            pstmt.setString(3, calendarDTO.getEnd());
	            pstmt.setLong(4, calendarDTO.getId());
	            result = pstmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.err.println("update SQLException error");
	        } finally {
	        	 Singleton_Helper.close(pstmt);
	        }
	        return result;
	    }
	
	
	
}
