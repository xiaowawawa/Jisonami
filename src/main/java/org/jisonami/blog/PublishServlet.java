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
		// ��ȡҳ��blog��Ϣ
		Blog blog = new Blog();
		blog.setTitle(req.getParameter("title"));
		blog.setContent(req.getParameter("content"));
		blog.setAuthor(req.getSession().getAttribute("username").toString());
		BlogService blogService = new BlogService();
		try {
			blogService.save(blog);
		} catch (SQLException e) {
			e.printStackTrace();
			// ��ʾ����ʧ��
		}
		// ��ѯ���û��µ����в���
		List<Blog> blogs;
		try {
			blogs = blogService.queryByAuthor(req.getSession().getAttribute("username").toString());
			req.setAttribute("blogs", blogs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// ��ʾ�����ɹ���3�����ת��blogҳ��
		req.getRequestDispatcher("/WEB-INF/content/blog/blog.jsp").forward(req, resp);
	}
}
