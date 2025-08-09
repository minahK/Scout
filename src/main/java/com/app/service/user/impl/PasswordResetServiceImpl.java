package com.app.service.user.impl;

import com.app.dao.user.impl.PasswordResetTokenDao;
import com.app.entity.PasswordResetToken;
import com.app.service.user.PasswordResetService;
import com.app.util.MailUtil;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class PasswordResetServiceImpl implements PasswordResetService {
    private final PasswordResetTokenDao repo = new PasswordResetTokenDao();

    @Override
    public String createToken(String email) throws Exception {
        repo.deleteByEmail(email);
        String token = UUID.randomUUID().toString();
        PasswordResetToken prt = new PasswordResetToken();
        prt.setEmail(email);
        prt.setToken(token);
        prt.setExpiryDate(LocalDateTime.now().plusHours(1));
        repo.save(prt);
        return token;
    }

    @Override
    public void sendResetLink(String email, String token) throws Exception {
        String url = "http://your-domain.com/app/jsp/modifyPw.jsp?token=" + token;
        MailUtil.send(email, "비밀번호 재설정 안내",
            "아래 링크를 클릭하여 비밀번호를 재설정하세요:\n" + url);
    }

    @Override
    public boolean validateToken(String token) throws Exception {
        Optional<PasswordResetToken> opt = repo.findByToken(token);
        return opt.isPresent() && opt.get().getExpiryDate().isAfter(LocalDateTime.now());
    }

    @Override
    public String findEmailByToken(String token) throws Exception {
        Optional<PasswordResetToken> opt = repo.findByToken(token);
        if (opt.isEmpty()) {
            throw new IllegalArgumentException("유효하지 않은 토큰입니다.");
        }
        return opt.get().getEmail();
    }

    @Override
    public void deleteTokenByEmail(String email) throws Exception {
        repo.deleteByEmail(email);
    }
    
    @Override
    public String getEmailByToken(String token) throws Exception {
        Optional<PasswordResetToken> opt = repo.findByToken(token);
        if (opt.isEmpty()) {
            throw new IllegalArgumentException("유효하지 않은 토큰입니다.");
        }
        return opt.get().getEmail();
    }
}
