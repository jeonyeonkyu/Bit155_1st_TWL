package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.Dto;
import com.util.Db_helper;

import net.sf.json.JSONArray;

public class Dao {
	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	public Dao() {
		con = Db_helper.getConnection();
	}

	public JSONArray getSal(int a) {
		JSONArray json=null;
		List<Dto> list = new ArrayList();
		try {
			String query = "select ename, deptno,sal from emp where deptno=?";
			pstm = con.prepareStatement(query);
			pstm.setInt(1, a);
			rs = pstm.executeQuery();

			while (rs.next()) {
				Dto dto = new Dto();
				String ename=rs.getString("ename");
				int deptno = rs.getInt("deptno");
				int sal = rs.getInt("sal");
				dto.setEname(ename);
				dto.setDeptno(deptno);
				dto.setSal(sal);
				list.add(dto);
			}
			json = JSONArray.fromObject(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return json;
	}
	
	public JSONArray getAllSal() {
		JSONArray json=null;
		List<Dto> list = new ArrayList();
		try {
			String query = "select ename, deptno,sal from emp";
			pstm = con.prepareStatement(query);
			rs = pstm.executeQuery();

			while (rs.next()) {
				Dto dto = new Dto();
				String ename=rs.getString("ename");
				int deptno = rs.getInt("deptno");
				int sal = rs.getInt("sal");
				dto.setEname(ename);
				dto.setDeptno(deptno);
				dto.setSal(sal);
				list.add(dto);
			}
			json = JSONArray.fromObject(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return json;
	}

}
