package org.jisonami.account;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jisonami.entity.User;
import org.jisonami.service.UserService;

public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// ��ȡ�û�ע����Ϣ
		User user = new User();
		user.setName(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		// ��֤���ݿ����Ƿ���ע��
		UserService userService = new UserService();
		try {
			if(userService.exits(user)){
				// ��ʾ���û���ע��
				req.setAttribute("error", "�û����Ѵ��ڣ�");
				req.getRequestDispatcher("register.jsp").forward(req, resp);
			} else {
				// ���û���Ϣ�浽���ݿ�
				try {
					userService.save(user);
				} catch (SQLException e) {
					e.printStackTrace();
					// ��ʾע��ʧ��
				}
				// ��ʾע��ɹ���3�����ת����½ҳ��
				resp.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
