package org.jisonami.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.jisonami.entity.Blog;
import org.jisonami.sql.DBUtils;
import org.jisonami.util.JDBCUtils;
import org.jisonami.util.StringUtils;

public class BlogService {
	public boolean save(Blog blog) throws SQLException{
		blog.setId(StringUtils.generateUUID());
		Connection conn = DBUtils.getConnection();
		String sql = "insert into t_blog(id, title, content, author, publishTime) values(?, ?, ?, ?, ?)";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, blog.getId());
		preStmt.setString(2, blog.getTitle());
		preStmt.setString(3, blog.getContent());
		preStmt.setString(4, blog.getAuthor());
		preStmt.setTimestamp(5, new Timestamp(blog.getPublishTime().getTime()));
		int rowChange = preStmt.executeUpdate();
		preStmt.close();
		conn.close();
		if(rowChange != 0){
			return true;
		}
		return false;
	}
	public boolean delete(String id) throws SQLException{
		Connection conn = DBUtils.getConnection();
		String sql = "delete from t_blog t where t.id = ?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, id);
		int rowChanges = preStmt.executeUpdate();
		preStmt.close();
		conn.close();
		if(rowChanges != 0){
			return true;
		} else {
			return false;
		}
	}
	public boolean edit(Blog blog) throws SQLException{
		Connection conn = DBUtils.getConnection();
		String sql = "update t_blog t set t.title = ? , t.content = ? where t.id = ?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, blog.getTitle());
		preStmt.setString(2, blog.getContent());
		preStmt.setString(3, blog.getId());
		int rowChanges = preStmt.executeUpdate();
		preStmt.close();
		conn.close();
		if(rowChanges != 0){
			return true;
		} else {
			return false;
		}
	}
	public Blog queryById(String id) throws SQLException, IOException{
		Connection conn = DBUtils.getConnection();
		String sql = "select * from t_blog t where t.id = ?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, id);
		ResultSet rs = preStmt.executeQuery();
		
		// 根据id查应该是只有一行数据的
		Blog blog = new Blog();
		if(rs.next()){
			blog.setId(rs.getString("id"));
			blog.setTitle(rs.getString("title"));
			blog.setContent(JDBCUtils.clobToString(rs.getClob("content")));
		}
		
		rs.close();
		preStmt.close();
		conn.close();
		return blog;
	}
	public List<Blog> queryByAuthor(String author) throws SQLException, IOException{
		Connection conn = DBUtils.getConnection();
		String sql = "select * from t_blog t where t.author = ?";
		PreparedStatement preStmt = conn.prepareStatement(sql);
		preStmt.setString(1, author);
		ResultSet rs = preStmt.executeQuery();
		
		List<Blog> blogs = new ArrayList<Blog>();
		while(rs.next()){
			Blog blog = new Blog();
			blog.setId(rs.getString("id"));
			blog.setTitle(rs.getString("title"));
			blog.setContent(JDBCUtils.clobToString(rs.getClob("content")));
			blog.setPublishTime(rs.getTimestamp("publishTime"));
			blogs.add(blog);
		}
		
		rs.close();
		preStmt.close();
		conn.close();
		return blogs;
	}
	
	public static void main(String[] args) throws SQLException, IOException {
		new BlogService().queryByAuthor("jison");
	}
}
