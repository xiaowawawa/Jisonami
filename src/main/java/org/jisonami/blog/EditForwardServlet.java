package org.jisonami.blog;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.Blog;
import org.jisonami.entity.BlogType;
import org.jisonami.service.BlogService;
import org.jisonami.service.BlogTypeService;

public class EditForwardServlet extends HttpServlet {

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
		
		BlogTypeService blogTypeService = new BlogTypeService();
		String blogTypeIds = blog.getBlogType();
		String blogTypes = "";
		List<String> blogTypeIdList = Arrays.asList(blogTypeIds.split(","));
		for(int i=0;i<blogTypeIdList.size();i++){
			String blogTypeId = blogTypeIdList.get(i);
			BlogType blogType = null;
			try {
				blogType = blogTypeService.queryById(blogTypeId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(i < blogTypeIdList.size()-1){
				blogTypes = blogTypes + blogType.getName() + ",";
			} else {
				blogTypes = blogTypes + blogType.getName();
			}
		}
		if(blogTypeIds!=null && !"".equals(blogTypeIds)){
			req.setAttribute("blogTypeIds", blogTypeIds);
		}
		if(blogTypes!=null && !"".equals(blogTypes)){
			req.setAttribute("blogTypes", blogTypes);
		}
		
		req.getRequestDispatcher("/WEB-INF/content/blog/edit.jsp").forward(req, resp);
	}

}
