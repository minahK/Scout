package com.app.service.email.impl;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.app.service.email.EmailService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {

    private final JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromAddress;

    @Value("${app.reset.password.base-url}")
    private String resetBaseUrl;

    @Override
    public void sendPasswordResetEmail(String to, String token) throws MessagingException {
        String resetLink = resetBaseUrl + "?token=" + token;

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
        helper.setFrom(fromAddress);
        helper.setTo(to);
        helper.setSubject("[앱 이름] 비밀번호 재설정 안내");

        String text = new StringBuilder()
            .append("안녕하세요.\n\n")
            .append("비밀번호 재설정을 요청하셨다면 아래 링크를 클릭하세요:\n")
            .append(resetLink).append("\n\n")
            .append("이 링크는 발송 후 1시간 동안만 유효합니다.\n")
            .append("요청하지 않으셨다면 이 메일을 무시해 주세요.\n\n")
            .append("감사합니다.")
            .toString();

        helper.setText(text);
        mailSender.send(message);
    }
}
