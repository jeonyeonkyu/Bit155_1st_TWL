package com.DAO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.DTO.BoardDTO;

import util.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	public static BoardDAO boardDAO;
	private PreparedStatement pstmt;
	private ResultSet rs;
	DataSource ds = null;

	public BoardDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");// java:comp/env/ + name
		} catch (NamingException e) {
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
		String sql = "select * from jo_board";
		List<BoardDTO> list = new ArrayList<>();
		Connection conn = null;
		try {
			conn = ds.getConnection();
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
			ConnectionHelper.close(rs);
			ConnectionHelper.close(pstmt);
			ConnectionHelper.close(conn);
		}
		return list;
	}

}
