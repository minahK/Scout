package com.app.controller.customer;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.user.impl.CustomerDAO;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String rememberMe = req.getParameter("rememberMe") != null ? "Y" : "N";

		CustomerDAO dao = new CustomerDAO();
		try {
			dao.signUp(id, pw, email, name, phone, rememberMe);
			resp.sendRedirect("login.jsp");
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}
