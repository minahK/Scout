package com.app.controller.customer;

import com.app.service.user.PasswordResetService;
import com.app.service.user.impl.PasswordResetServiceImpl;
import com.app.dao.user.impl.UserDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/resetPw")
public class ResetPwServlet extends HttpServlet {
    private final PasswordResetService service = new PasswordResetServiceImpl();
    private final UserDAOImpl userDao = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String token = req.getParameter("token");
        try {
            if (!service.validateToken(token)) {
                resp.getWriter().println("토큰이 유효하지 않거나 만료되었습니다.");
                return;
            }
            req.getRequestDispatcher("/jsp/modifyPw.jsp")
               .forward(req, resp);
        } catch (Exception e) {
            resp.getWriter().println("오류: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String token = req.getParameter("token");
        String newPw = req.getParameter("newPassword");
        try {
            if (!service.validateToken(token)) {
                resp.getWriter().println("토큰이 유효하지 않거나 만료되었습니다.");
                return;
            }

            // 토큰으로 이메일 조회
            String email = service.getEmailByToken(token);

            // 비밀번호 업데이트
            userDao.updatePasswordByEmail(email, newPw);

            // 사용한 토큰 삭제
            service.deleteTokenByEmail(email);

            resp.sendRedirect("jsp/reset-success.jsp");
        } catch (Exception e) {
            resp.getWriter().println("오류: " + e.getMessage());
        }
    }
}
