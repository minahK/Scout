package com.app.service.email;

import javax.mail.MessagingException;

public interface MailService {

    default void sendMail(String to, String subject, String htmlContent) throws MessagingException {
        // 인터페이스 레벨의 기본 구현 (필요시 구현체에서 @Override)
        throw new UnsupportedOperationException("구현체에서 반드시 재정의하세요");
    }
}
