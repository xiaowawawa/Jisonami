package org.jisonami.sql;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtils {
	static Properties properties = new Properties();
	static {
		try {
			properties.load(DBUtils.class.getClassLoader().getResourceAsStream("org/jisonami/sql/DBConfig.properties"));
			Class.forName(properties.getProperty("driver"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException{
		return DriverManager.getConnection(properties.getProperty("url"), 
				properties.getProperty("user"),
				properties.getProperty("pass"));
	}
	
	public static void execute(String sql) throws SQLException{
		Connection conn = DBUtils.getConnection();
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.execute();
		preStmt.close();
		conn.close();
	}
	
	public static void main(String[] args) throws IOException, SQLException {
		Connection conn = DriverManager.getConnection(properties.getProperty("url"), 
				properties.getProperty("user"),
				properties.getProperty("pass"));
		String sql = "select * from v$datafile";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		ResultSet rs = preStmt.executeQuery();
		System.out.println(rs);
		rs.close();
		preStmt.close();
		conn.close();
	}
}
