package com.app.dao.user.impl;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * MyBatis SqlSessionFactory를 싱글톤으로 제공하는 유틸 클래스
 */
public class MyBatisUtil {

    // 싱글톤 SqlSessionFactory 인스턴스
    private static final SqlSessionFactory SQL_SESSION_FACTORY;

    static {
        try {
            // 클래스패스 하위에 위치한 mybatis-config.xml 경로
            String resource = "mybatis/mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);

            SQL_SESSION_FACTORY = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (Exception e) {
            // 초기화 실패 시 애플리케이션 시작 중단
            throw new ExceptionInInitializerError(
                "MyBatis 초기화 실패: " + e.getMessage()
            );
        }
    }

    /**
     * 싱글톤 SqlSessionFactory 반환
     *
     * @return SqlSessionFactory 인스턴스
     */
    public static SqlSessionFactory getSqlSessionFactory() {
        return SQL_SESSION_FACTORY;
    }
}
