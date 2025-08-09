package com.app.repository;

import com.app.entity.PasswordResetToken;
import java.util.Optional;

public interface PasswordResetTokenRepository {
    void save(PasswordResetToken prt) throws Exception;
    Optional<PasswordResetToken> findByToken(String token) throws Exception;
    void deleteByEmail(String email) throws Exception;
}
