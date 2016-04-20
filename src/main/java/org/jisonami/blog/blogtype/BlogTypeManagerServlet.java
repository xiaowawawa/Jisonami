package org.jisonami.blog.blogtype;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.BlogType;
import org.jisonami.service.BlogService;
import org.jisonami.service.BlogTypeService;

public class BlogTypeManagerServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		BlogType blogType = new BlogType();
		String username = req.getSession().getAttribute("username").toString();
		blogType.setBlogAuthor(username);
		blogType.setName(req.getParameter("blogType"));
		BlogTypeService blogTypeService = new BlogTypeService();
		boolean result = false;
		try {
			result = blogTypeService.save(blogType);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(result){
			List<BlogType> blogTypes = null;
			try {
				blogTypes = blogTypeService.queryByAuthor(username);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			req.setAttribute("blogTypes", blogTypes);
			
			BlogService blogService = new BlogService();
			List<Integer> blogCounts = new ArrayList<Integer>();
			for (BlogType bt : blogTypes) {
				try {
					int blogCount = blogService.blogCountByBlogType(bt.getId());
					blogCounts.add(blogCount);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			req.setAttribute("blogCounts", blogCounts);
			
			req.getRequestDispatcher("/WEB-INF/content/blog/blogTypeManager.jsp").forward(req, resp);
		}else {
			// 保存博客类型出错
		}
	}

}
