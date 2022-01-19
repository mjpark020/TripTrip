package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import db.DBConn;
import vo.areaVo;

public class areaDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	public areaVo getAreaCol(int aCode) {
		ResultSet rs = null;
		areaVo aVo = null;
		
		String sql = "SELECT AREACODE, AREANAME ";
		sql += "FROM AREA ";
		sql += "WHERE AREACODE = ? ";
		
		try {
			DBConn   db  =  new DBConn();
			conn         =  db.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, aCode);
			
			rs = pstmt.executeQuery();
			int areaCode = 0;
			String areaName = "";
			
			while(rs.next()){
				areaCode = rs.getInt(1);
				areaName = rs.getString(2);
				
				aVo = new areaVo();
				aVo.setAreaCode(areaCode);
				aVo.setAreaName(areaName);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return aVo;
		
	}
	
	public ArrayList<areaVo> getAreaList() {
		ArrayList<areaVo> areaList = new ArrayList<>();
		ResultSet rs = null;
		
		String sql = "SELECT AREACODE, AREANAME ";
		sql += "FROM AREA ";
		
		try {
			DBConn   db  =  new DBConn();
			conn         =  db.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			int areaCode = 0;
			String areaName = "";
			
			while(rs.next()){
				areaCode = rs.getInt(1);
				areaName = rs.getString(2);
				
				areaVo aVo = new areaVo();
				aVo.setAreaCode(areaCode);
				aVo.setAreaName(areaName);
				areaList.add(aVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return areaList;
	}
	
	
	
	public ArrayList<areaVo> getSigunguList() {
		ArrayList<areaVo> areaList = new ArrayList<>();
		ResultSet rs = null;
		
		String sql = "SELECT S.AREACODE, A.AREANAME, S.SIGUNGUCODE, S.SIGUNGUNAME, S.NX, S.NY ";
		sql += "FROM AREA A JOIN SIGUNGU S ";
		sql += "ON A.AREACODE = S.AREACODE ";
		sql += " ORDER BY AREACODE ASC, SIGUNGUCODE ASC";
		
		try {
			
			DBConn   db  =  new DBConn();
			conn         =  db.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			int areaCode = 0;
			String areaName = "";
			int sigunguCode = 0;
			String sigunguName = "";
			int nx = 0;
			int ny = 0;
			
			
			while(rs.next()){
				areaCode = rs.getInt(1);
				areaName = rs.getString(2);
				sigunguCode = rs.getInt(3);
				sigunguName = rs.getString(4);
				nx = rs.getInt(5);
				ny = rs.getInt(6);
				areaVo aVo = new areaVo(areaCode, areaName, sigunguCode, sigunguName, nx, ny);
				areaList.add(aVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return areaList;
	}
	
	public ArrayList<areaVo> getSigunguList(int aCode) {
		ArrayList<areaVo> areaList = new ArrayList<>();
		ResultSet rs = null;
		
		String sql = "SELECT S.AREACODE, A.AREANAME, S.SIGUNGUCODE, S.SIGUNGUNAME, S.NX, S.NY ";
		sql += "FROM AREA A JOIN SIGUNGU S ";
		sql += "ON A.AREACODE = S.AREACODE ";
		sql += "WHERE S.AREACODE = ? ";
		sql += " ORDER BY S.AREACODE ASC, S.SIGUNGUCODE ASC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aCode);
			rs = pstmt.executeQuery();
			int areaCode = 0;
			String areaName = "";
			int sigunguCode = 0;
			String sigunguName = "";
			int nx = 0;
			int ny = 0;
			
			
			while(rs.next()){
				areaCode = rs.getInt(1);
				areaName = rs.getString(2);
				sigunguCode = rs.getInt(3);
				sigunguName = rs.getString(4);
				nx = rs.getInt(5);
				ny = rs.getInt(6);
				areaVo aVo = new areaVo(areaCode, areaName, sigunguCode, sigunguName, nx, ny);
				areaList.add(aVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return areaList;
	}
	
	
	public areaVo getSigunguName(int aCode, int gCode) {
		areaVo areaVo = null;
		ResultSet rs = null;
		
		String sql = "SELECT S.AREACODE, A.AREANAME, S.SIGUNGUCODE, S.SIGUNGUNAME, S.NX, S.NY ";
		sql += "FROM AREA A JOIN SIGUNGU S ";
		sql += "ON A.AREACODE = S.AREACODE ";
		sql += "WHERE S.AREACODE = ? AND S.SIGUNGUCODE = ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, aCode);
			pstmt.setInt(2, gCode);
			rs = pstmt.executeQuery();
			int areaCode = 0;
			String areaName = "";
			int sigunguCode = 0;
			String sigunguName = "";
			int nx = 0;
			int ny = 0;
			
			
			while(rs.next()){
				areaCode = rs.getInt(1);
				areaName = rs.getString(2);
				sigunguCode = rs.getInt(3);
				sigunguName = rs.getString(4);
				nx = rs.getInt(5);
				ny = rs.getInt(6);
				areaVo = new areaVo(areaCode, areaName, sigunguCode, sigunguName, nx, ny);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return areaVo;
	}
}
