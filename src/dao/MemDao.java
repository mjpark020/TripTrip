package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBConn;
import vo.MemVo;

public class MemDao {
	
	Connection			conn	=	null;
	PreparedStatement	pstmt	=	null;

	// 회원 가입
	public void insertmember(MemVo memVo) {
		
		try {
			
			DBConn	db	=	new	DBConn();
			conn		=	db.getConnection();
			String	sql	=	"INSERT INTO TRIPMEMBER( MEM_ID, MEM_PWD, EMAIL, MEM_NAME, TEL)";
			sql			+=	" VALUES( ?, ?, ?, ?, ? )";
			pstmt		=	conn.prepareStatement(sql);
			
			pstmt.setString(1, memVo.getId());
			pstmt.setString(2, memVo.getPassword());
			pstmt.setString(3, memVo.getEmail());
			pstmt.setString(4, memVo.getName());
			pstmt.setString(5, memVo.getTel());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 아이디 찾기
	public String findId(String name, String email){
		String		id		=	null;
		ResultSet	rs		=	null;
		
		try {
			DBConn	db	=	new	DBConn();	
			conn		=	db.getConnection();
			String	sql	=	"SELECT MEM_ID ";
			sql			+= " FROM TRIPMEMBER ";
			sql			+= " WHERE NAME = ? and EMAIL = ? ";
			pstmt		=	conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			
			rs	=	pstmt.executeQuery();
			while( rs.next() ){
				id	=	rs.getString("id");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}

	//	비밀번호 찾기
	public String findPw(String id, String email) {
		String		password	=	null;
		ResultSet	rs			=	null;
		
		try {
			DBConn	db	=	new	DBConn();	 
			conn		=	db.getConnection();
			String	sql	=	"SELECT MEM_PWD ";
			sql			+= " FROM TRIPMEMBER ";
			sql			+= " WHERE ID = ? and EMAIL = ? ";
			pstmt		=	conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			
			rs	=	pstmt.executeQuery();
			while( rs.next() ){
				password	=	rs.getString("password");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return password;
	}
}
