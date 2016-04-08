package org.jisonami.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jisonami.entity.User;
import org.jisonami.sql.DBUtils;
import org.jisonami.util.StringUtils;

public class UserService {
	public boolean validate(User user) throws SQLException{
		Connection conn = DBUtils.getConnection();
		String sql = "select name,password from t_user t where t.name = ? and t.password = ?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, user.getName());
		preStmt.setString(2, user.getPassword());
		ResultSet rs = preStmt.executeQuery();
		boolean hasNextRow = rs.next();
		rs.close();
		preStmt.close();
		conn.close();
		if(hasNextRow){
			return true;
		}
		return false;
	}
	public boolean save(User user) throws SQLException{
		user.setId(StringUtils.generateUUID());
		Connection conn = DBUtils.getConnection();
		String sql = "insert into t_user(id, name, password) values(?, ?, ?)";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, user.getId());
		preStmt.setString(2, user.getName());
		preStmt.setString(3, user.getPassword());
		int rowChange = preStmt.executeUpdate();
		preStmt.close();
		conn.close();
		if(rowChange != 0){
			return true;
		}
		return false;
	}
	public boolean exits(User user) throws SQLException{
		if(query(user.getName())){
			return true;
		}
		return false;
	}
	public boolean query(String username) throws SQLException{
		Connection conn = DBUtils.getConnection();
		String sql = "select * from t_user t where t.name = ?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, username);
		ResultSet rs = preStmt.executeQuery();
		boolean hasNextRow = rs.next();
		rs.close();
		preStmt.close();
		conn.close();
		if(hasNextRow){
			return true;
		}
		return false;
	}
}
