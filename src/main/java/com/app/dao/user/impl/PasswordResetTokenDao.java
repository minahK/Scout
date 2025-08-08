package com.app.dao.user.impl;

import com.app.entity.PasswordResetToken;
import com.app.repository.PasswordResetTokenRepository;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.Optional;

public class PasswordResetTokenDao implements PasswordResetTokenRepository {
    private final String URL = "jdbc:oracle:thin:@//HOST:1521/SID";
    private final String USER = "DB_USER";
    private final String PASS = "DB_PASS";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }

    @Override
    public void save(PasswordResetToken prt) throws Exception {
        String sql = "INSERT INTO PASSWORD_RESET_TOKEN (EMAIL, TOKEN, EXPIRY_DATE) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, prt.getEmail());
            ps.setString(2, prt.getToken());
            ps.setTimestamp(3, Timestamp.valueOf(prt.getExpiryDate()));
            ps.executeUpdate();
        }
    }

    @Override
    public Optional<PasswordResetToken> findByToken(String token) throws Exception {
        String sql = "SELECT ID, EMAIL, TOKEN, EXPIRY_DATE FROM PASSWORD_RESET_TOKEN WHERE TOKEN = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, token);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    PasswordResetToken prt = new PasswordResetToken();
                    prt.setId(rs.getLong("ID"));
                    prt.setEmail(rs.getString("EMAIL"));
                    prt.setToken(rs.getString("TOKEN"));
                    prt.setExpiryDate(rs.getTimestamp("EXPIRY_DATE").toLocalDateTime());
                    return Optional.of(prt);
                }
            }
        }
        return Optional.empty();
    }

    @Override
    public void deleteByEmail(String email) throws Exception {
        String sql = "DELETE FROM PASSWORD_RESET_TOKEN WHERE EMAIL = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.executeUpdate();
        }
    }
}
