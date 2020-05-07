package com.DAO;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.UserDTO;

import util.Singleton_Helper;

public class UserDAO {
    // +-------------½Ì±ÛÅæ ÆÐÅÏ Àû¿ë-------------+
    private static UserDAO userDAO;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private int result;

    public UserDAO(){
        try{
        	conn = Singleton_Helper.getConnection("oracle");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static synchronized UserDAO getInstance() {
        if(userDAO == null){
            userDAO = new UserDAO();
        }
        return userDAO;
    }
    // +-------------½Ì±ÛÅæ ÆÐÅÏ Àû¿ë-------------+

    public int join(UserDTO userDTO){
        StringBuffer query = new StringBuffer();
        query.append("INSERT INTO jo_member").append(" VALUES (?, ?, ?, ?, ?, ?, ? ,?)");
        try{
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, userDTO.getUserId());
            pstmt.setString(2, userDTO.getUserPw());
            pstmt.setString(3, userDTO.getUserPwcheck());
            pstmt.setString(4, userDTO.getUserName());
            pstmt.setString(5, userDTO.getUserEmail());
            pstmt.setString(6, userDTO.getUserAddress());
            pstmt.setString(7, userDTO.getUserDetailAddress());
            pstmt.setString(8, userDTO.getUserPhone());
            result = pstmt.executeUpdate();
        } catch(SQLException e){
        	System.err.println(e);
            System.err.println("join SQLException error");
        } finally {
        	 Singleton_Helper.close(pstmt);
        }
        return result;
    }
    
    public int login(String userId, String userPw){
        StringBuffer query = new StringBuffer();
        query.append("SELECT userPw").append(" FROM jo_member").append(" WHERE userId = ?");
        try{
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString("userPw").equals(userPw)) {
                    return 1;
                } else {
                    return 0;
                }
            }
        } catch(SQLException e){
            System.err.println(e);
            System.err.println("login SQLException error");
        } finally {
        	 Singleton_Helper.close(pstmt);
        }
        return -1;
    }
  
}