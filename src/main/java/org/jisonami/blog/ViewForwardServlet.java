package org.jisonami.blog;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.Blog;
import org.jisonami.service.BlogService;

public class ViewForwardServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String blogId = req.getParameter("blogId");
		BlogService blogService = new BlogService();
		Blog blog = null;
		try {
			blog = blogService.queryById(blogId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(blog!=null){
			req.setAttribute("blog", blog);
		}
		req.getRequestDispatcher("/WEB-INF/content/blog/view.jsp").forward(req, resp);
	}
}
