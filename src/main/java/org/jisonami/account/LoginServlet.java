package org.jisonami.account;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.Blog;
import org.jisonami.entity.User;
import org.jisonami.service.BlogService;
import org.jisonami.service.UserService;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// ��ȡ�û���½��Ϣ
		User user = new User();
		user.setName(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		// ��֤�û���Ϣ�Ƿ������ݿ�ƥ��
		UserService userService = new UserService();
		try {
			if(userService.validate(user)){
				// ��ƥ�䣬��ת��blog��ҳ
				req.getSession().setAttribute("username", user.getName());
				// ��ѯ���û��µ����в���
				BlogService blogService = new BlogService();
				List<Blog> blogs = blogService.queryByAuthor(user.getName());
				req.setAttribute("blogs", blogs);
				req.getRequestDispatcher("/WEB-INF/content/blog/blog.jsp").forward(req, resp);
			} else {
				// ����ƥ�䣬��ʾ�û������������
				req.setAttribute("error", "�û������������");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
