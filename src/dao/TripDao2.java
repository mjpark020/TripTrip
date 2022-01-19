package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import db.DBConn;
import vo.TripVo;

public class TripDao2 {
	
	private  Connection         conn ;
	private  PreparedStatement  pstmt;

	public  List<TripVo> getCommuList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TripVo> clist = new ArrayList<TripVo>();
		String aData = "\"page\": \"1\",\"total\": \"3\",\"records\": \"23\",";
		String aData1 = "";

	
		
		try {
			DBConn   db   =  new DBConn();
			conn          =  db.getConnection();
			
			String   sql  =  "SELECT  NUM,TAG,TITLE,WRITER "; 
			sql += "FROM COMMULIST";
			pstmt         =  conn.prepareStatement(sql);
			
			rs    =   pstmt.executeQuery(); 
			
			while (rs.next()) {
		
				int num = rs.getInt("num");
				String tag = rs.getString("tag");
				String title = rs.getString("title");
				String whiter = rs.getString("writer");

				
				
				TripVo tvo = new TripVo(num,tag,title,whiter);
				
       
            	
            	clist.add(tvo);
            
			}

			System.out.println(clist);
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//         try {
//            if (rs != null)
//               rs.close();
////            if (pstmt != null)
////               pstmt.close();
//         } catch (SQLException e) {
//         }
		}
		return clist;
	}

	
	// 검색어로 찾기
	public  List<TripVo> getCommuList(String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TripVo> clist = new ArrayList<TripVo>();
		
		
		
		
		try {
			DBConn   db   =  new DBConn();
			conn          =  db.getConnection();
			
			String   sql  =  "SELECT  NUM,TAG,TITLE,WRITER "; 
			sql += "FROM COMMULIST WHERE TAG LIKE ? OR TITLE LIKE ? OR WRITER LIKE ?";
			pstmt         =  conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setString(3, "%"+keyword+"%");
			
			rs    =   pstmt.executeQuery(); 
			
			TripVo tvo = null;
			
			if(rs.next() == true) {
				while (rs.next()) {
					
					int num = rs.getInt("num");
					String tag = rs.getString("tag");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					
					tvo = new TripVo(num,tag,title,writer);
					
					clist.add(tvo);
					System.out.println("있는값");
					
				}
			}else {
				
				tvo = new TripVo(0,"","","");
				System.out.println("빈값");
				clist.add(tvo);
				
			}
			
			
			
			
			System.out.println(clist);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
//	         try {
//	            if (rs != null)
//	               rs.close();
////	            if (pstmt != null)
////	               pstmt.close();
//	         } catch (SQLException e) {
//	         }
		}
		return clist;
	}
	
	
	
	public void insert(TripVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		DBConn   db   =  new DBConn();
		conn          =  db.getConnection();
		String   sql  =  "INSERT INTO COMMULIST(NUM,TAG,TITLE,WRITER, CONTENT) "; 
		sql += "VALUES ((SELECT NVL(MAX(NUM),0)+1 FROM COMMULIST), ?,?,?,? )";
		pstmt         =  conn.prepareStatement(sql);
		
		pstmt.setString(1, vo.getTag());
		pstmt.setString(2, vo.getTitle());
		pstmt.setString(3, vo.getWriter());
		pstmt.setString(4, vo.getWriter());
		
		rs    =   pstmt.executeQuery(); 
		

		
		

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
//     try {
//        if (rs != null)
//           rs.close();
////        if (pstmt != null)
////           pstmt.close();
//     } catch (SQLException e) {
//     }
	}		
	}
	
	
	
	
	public void update(TripVo vo,int num) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DBConn   db   =  new DBConn();
		conn          =  db.getConnection();
		String   sql  =  "UPDATE COMMULIST ";
		sql  += "SET ";
		sql  +=	"TAG = ?, ";
		sql	 += "TITLE = ?, ";
		sql  += "WRITER = ? ";
		sql  += "WHERE NUM = ? ";
		try {
					
			pstmt         =  conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getTag());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getWriter());
			pstmt.setInt(4,num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
	     try {
	        if (rs != null)
	           rs.close();
	        if (pstmt != null)
	           pstmt.close();
	     } catch (SQLException e) {
	     }
		}		
		
		
	}

	public void delet(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		DBConn   db   =  new DBConn();
		conn          =  db.getConnection();
		String   sql  =  "DELETE FROM COMMULIST ";
				 sql += "WHERE NUM = ?";
		pstmt         =  conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
				
		rs    =   pstmt.executeQuery(); 
		

		
		

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
//     try {
//        if (rs != null)
//           rs.close();
////        if (pstmt != null)
////           pstmt.close();
//     } catch (SQLException e) {
//     }
	}		
	}
	

}