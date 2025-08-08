package com.app.service.email;

import javax.mail.MessagingException;

public interface EmailService {
    /**
     * 비밀번호 재설정 이메일 전송
     *
     * @param to     수신자 이메일 주소
     * @param token  비밀번호 재설정 토큰
     * @throws MessagingException 메일 전송 실패 시 예외 발생
     */
    void sendPasswordResetEmail(String to, String token) throws MessagingException;
}
