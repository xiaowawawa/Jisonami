package org.jisonami.blog.blogtype;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.BlogType;
import org.jisonami.service.BlogTypeService;

public class BlogTypeManagerForwardServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BlogTypeService blogTypeService = new BlogTypeService();
		String username = req.getSession().getAttribute("username").toString();
		List<BlogType> blogTypes = null;
		try {
			blogTypes = blogTypeService.queryByAuthor(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("blogTypes", blogTypes);
		req.getRequestDispatcher("/WEB-INF/content/blog/blogTypeManager.jsp").forward(req, resp);
	}

}
