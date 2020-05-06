package com.DAO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.DTO.BoardDTO;

import util.Singleton_Helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	public static BoardDAO boardDAO;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public BoardDAO() {
    	 try{
         	conn = Singleton_Helper.getConnection("oracle");
         }catch(Exception e){
             e.printStackTrace();
         }
    }

	public static synchronized BoardDAO getInstance() {
		if (boardDAO == null) {
			boardDAO = new BoardDAO();
		}
		return boardDAO;
	}
	// +-------------½Ì±ÛÅæ ÆÐÅÏ Àû¿ë-------------+

	public List<BoardDTO> selectList() {
		List<BoardDTO> list = new ArrayList<>();

		try {
			String sql = "select * from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
				
			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoardNo(rs.getString("boardNo"));
				boardDTO.setBoardTitle(rs.getString("boardTitle"));
				boardDTO.setBoardAuthor(rs.getString("boardAuthor"));
				boardDTO.setBoardDate(rs.getString("boardDate"));
				boardDTO.setBoardCount(rs.getString("boardCount"));
				boardDTO.setBoardLike(rs.getString("boardLike"));
				list.add(boardDTO);
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

}
