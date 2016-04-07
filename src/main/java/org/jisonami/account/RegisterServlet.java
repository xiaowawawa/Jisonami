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
		// 获取用户注册信息
		User user = new User();
		user.setName(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		// 验证数据库里是否已注册
		UserService userService = new UserService();
		try {
			if(userService.exits(user)){
				// 提示该用户已注册
				req.setAttribute("error", "用户名已存在！");
				req.getRequestDispatcher("register.jsp").forward(req, resp);
			} else {
				// 将用户信息存到数据库
				try {
					userService.save(user);
				} catch (SQLException e) {
					e.printStackTrace();
					// 提示注册失败
				}
				// 提示注册成功，3秒后并跳转到登陆页面
				resp.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
