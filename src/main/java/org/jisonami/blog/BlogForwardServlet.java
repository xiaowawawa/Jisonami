package org.jisonami.blog;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.Blog;
import org.jisonami.service.BlogService;

public class BlogForwardServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String blogTypeId = req.getParameter("blogTypeId");
		BlogService blogService = new BlogService();
		// 查询该用户下的所有博客
		List<Blog> blogs = null;
		try {
			if(blogTypeId!=null && !"".equals(blogTypeId)){
				blogs = blogService.queryByBlogType(blogTypeId);
			} else {
				blogs = blogService.queryByAuthor(req.getSession().getAttribute("username").toString());
			}
			req.setAttribute("blogs", blogs);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.getRequestDispatcher("/WEB-INF/content/blog/blog.jsp").forward(req, resp);
	}

}
