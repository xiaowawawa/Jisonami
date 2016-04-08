package org.jisonami.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.jisonami.entity.Blog;
import org.jisonami.sql.DBUtils;
import org.jisonami.util.StringUtils;

public class BlogService {
	public boolean save(Blog blog) throws SQLException{
		blog.setId(StringUtils.generateUUID());
		Connection conn = DBUtils.getConnection();
		String sql = "insert into t_blog(id, title, content) values(?, ?, ?)";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, blog.getId());
		preStmt.setString(2, blog.getTitle());
		preStmt.setString(3, blog.getContent());
		int rowChange = preStmt.executeUpdate();
		preStmt.close();
		conn.close();
		if(rowChange != 0){
			return true;
		}
		return false;
	}
	public boolean edit(Blog blog){
		
		return false;
	}
	public Blog query(String id){
		
		return null;
	}
}
