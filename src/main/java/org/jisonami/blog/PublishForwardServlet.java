package org.jisonami.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.BlogType;
import org.jisonami.service.BlogTypeService;

public class PublishForwardServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getSession().getAttribute("username").toString();
		BlogTypeService blogTypeService = new BlogTypeService();
		List<BlogType> blogTypeList = null;
		try {
			blogTypeList = blogTypeService.queryByAuthor(username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("blogTypeList", blogTypeList);
		req.getRequestDispatcher("/WEB-INF/content/blog/publish.jsp").forward(req, resp);
	}
}
