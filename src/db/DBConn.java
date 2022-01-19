package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	private String driver = "oracle.jdbc.OracleDriver";
	private String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	private String dbuid = "test01";
	private String dbpwd = "1234";
	
	private Connection conn = null;
	
	public Connection getConnection() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(dburl, dbuid, dbpwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return conn;
	}
}
