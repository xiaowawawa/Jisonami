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

public class DeleteServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String blogId = req.getParameter("blogId");
		BlogService blogService = new BlogService();
		boolean result = false;
		try {
			result = blogService.delete(blogId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result){
			// 查询该用户下的所有博客
			List<Blog> blogs;
			try {
				blogs = blogService.queryByAuthor(req.getSession().getAttribute("username").toString());
				req.setAttribute("blogs", blogs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 返回博客列表
			req.getRequestDispatcher("/WEB-INF/content/blog/blog.jsp").forward(req, resp);
		}else{
			// 编辑不成功，返回错误提示
			
		}
	}
}
