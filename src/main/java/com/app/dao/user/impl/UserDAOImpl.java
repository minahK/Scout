package com.app.dao.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.user.UserDAO;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public int updatePasswordByEmail(String email, String newPassword) throws Exception {
        try (SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession(true)) {
            Map<String, String> params = new HashMap<>();
            params.put("email", email);
            params.put("password", newPassword);
            return session.update("com.app.mapper.UserMapper.updatePasswordByEmail", params);
        }
    }

    @Override
    public int saveUser(User user) {
        try {
            int result = sqlSessionTemplate.insert("com.app.mapper.UserMapper.saveUser", user);
            return result;
        } catch (Exception e) {
            // Oracle 무결성 제약 조건 위반 예외 처리
            if (e.getMessage().contains("UQ_T_USER_EMAIL") || e.getMessage().contains("ORA-00001")) {
                throw new RuntimeException("이미 사용 중인 이메일입니다.", e);
            }
            throw new RuntimeException("회원 저장 중 오류가 발생했습니다.", e);
        }
    }

    @Override
    public List<User> findUserList() {
        List<User> userList = sqlSessionTemplate.selectList("com.app.mapper.UserMapper.findUserList");
        return userList;
    }

    @Override
    public User findUserById(String id) {
        User user = sqlSessionTemplate.selectOne("com.app.mapper.UserMapper.findUserById", id);
        return user;
    }

    @Override
    public User checkUserLogin(User user) {
        User loginUser = sqlSessionTemplate.selectOne("com.app.mapper.UserMapper.checkUserLogin", user);
        return loginUser;
    }

    @Override
    public int modifyUserPw(User user) {
        int result = sqlSessionTemplate.update("com.app.mapper.UserMapper.modifyUserPw", user);
        return result;
    }

    @Override
    public int modifyUser(User user) {
        int result = sqlSessionTemplate.update("com.app.mapper.UserMapper.modifyUser", user);
        return result;
    }

    @Override
    public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition) {
        List<User> userList = sqlSessionTemplate.selectList(
            "com.app.mapper.UserMapper.findUserListBySearchCondition",
            userSearchCondition
        );
        return userList;
    }
}
