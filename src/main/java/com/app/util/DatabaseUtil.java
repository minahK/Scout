package com.app.util;

import java.sql.*;

public class DatabaseUtil {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "YOUR_DB_USER";
	private static final String PASS = "YOUR_DB_PASS";

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, USER, PASS);
	}

	public static void close(AutoCloseable... resources) {
		for (AutoCloseable r : resources) {
			if (r != null) {
				try {
					r.close();
				} catch (Exception e) {
				}
			}
		}
	}
}
