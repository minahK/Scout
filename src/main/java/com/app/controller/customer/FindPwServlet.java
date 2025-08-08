package com.app.controller.customer;

import com.app.service.user.PasswordResetService;
import com.app.service.user.impl.PasswordResetServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {
    private final PasswordResetService service = new PasswordResetServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String msg;
        try {
            String token = service.createToken(email);
            service.sendResetLink(email, token);
            msg = "이메일로 재설정 링크를 발송했습니다.";
        } catch (Exception e) {
            msg = "오류 발생: " + e.getMessage();
        }
        req.setAttribute("msg", msg);
        req.getRequestDispatcher("/jsp/findPw.jsp")
           .forward(req, resp);
    }
}
