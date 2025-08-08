package com.app.service.user;

public interface PasswordResetService {

    String createToken(String email) throws Exception;

    void sendResetLink(String email, String token) throws Exception;

    boolean validateToken(String token) throws Exception;

    // 토큰으로 이메일 조회
    String findEmailByToken(String token) throws Exception;

    // 이메일로 토큰 삭제
    void deleteTokenByEmail(String email) throws Exception;

    String getEmailByToken(String token) throws Exception;


}
