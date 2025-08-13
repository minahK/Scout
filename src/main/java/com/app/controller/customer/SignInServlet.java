package com.app.controller.customer;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.dao.user.impl.CustomerDAO;

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		CustomerDAO dao = new CustomerDAO();
		try {
			if (dao.signIn(id, pw)) {
			    HttpSession session = req.getSession(true);
			    session.setAttribute("id", id);           // ✅ String 로그인 아이디는 'id'에 저장
			    // session.setAttribute("loginUserId", id);  // ❌ 여기에 String 넣지 마세요
			    resp.sendRedirect(req.getContextPath() + "/community/main");
			    return;
			} else {
				resp.getWriter().println("로그인 실패");
			}
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
}
