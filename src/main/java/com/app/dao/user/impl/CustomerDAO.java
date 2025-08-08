package com.app.dao.user.impl;

import com.app.util.DatabaseUtil;
import java.sql.*;

public class CustomerDAO {

	// 회원가입
	public int signUp(String id, String pw, String email, String name, String phone, String rememberMe)
			throws SQLException {
		String sql = "INSERT INTO CUSTOMER " + "(ID, PASSWORD, EMAIL, NAME, PHONE, REMEMBER_ME) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, email);
			ps.setString(4, name);
			ps.setString(5, phone);
			ps.setString(6, rememberMe);
			return ps.executeUpdate();
		}
	}

	// 로그인
	public boolean signIn(String id, String pw) throws SQLException {
		String sql = "SELECT 1 FROM CUSTOMER WHERE ID = ? AND PASSWORD = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, id);
			ps.setString(2, pw);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next();
			}
		}
	}

	// 비밀번호 찾기
	public String findPasswordByEmail(String email) throws SQLException {
		String sql = "SELECT PASSWORD FROM CUSTOMER WHERE EMAIL = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			try (ResultSet rs = ps.executeQuery()) {
				return rs.next() ? rs.getString("PASSWORD") : null;
			}
		}
	}

	// 비밀번호 변경
	public int resetPassword(String id, String newPw) throws SQLException {
		String sql = "UPDATE CUSTOMER SET PASSWORD = ? WHERE ID = ?";
		try (Connection conn = DatabaseUtil.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, newPw);
			ps.setString(2, id);
			return ps.executeUpdate();
		}
	}
}
