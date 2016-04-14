package org.jisonami.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.Blog;
import org.jisonami.service.BlogService;

public class PublishServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取页面blog信息
		Blog blog = new Blog();
		blog.setTitle(req.getParameter("title"));
		blog.setContent(req.getParameter("content"));
		blog.setAuthor(req.getSession().getAttribute("username").toString());
		BlogService blogService = new BlogService();
		try {
			blogService.save(blog);
		} catch (SQLException e) {
			e.printStackTrace();
			// 提示发布失败
		}
		// 查询该用户下的所有博客
		List<Blog> blogs;
		try {
			blogs = blogService.queryByAuthor(req.getSession().getAttribute("username").toString());
			req.setAttribute("blogs", blogs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 提示发布成功，3秒后跳转到blog页面
		req.getRequestDispatcher("/WEB-INF/content/blog/blog.jsp").forward(req, resp);
	}
}
