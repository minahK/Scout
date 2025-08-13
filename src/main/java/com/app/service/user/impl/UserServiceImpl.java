package com.app.service.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.user.UserDAO;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.mapper.UserMapper;
import com.app.service.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	UserMapper userMapper;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public int saveUser(User user) {

		int result = userDAO.saveUser(user);

		return result;
	}

	@Override
	public int saveCustomerUser(User user) {
		// 이메일 중복 체크
		if (existsByEmail(user.getEmail())) {
			throw new RuntimeException("이미 사용 중인 이메일입니다.");
		}

		try {
			int result = userDAO.saveUser(user);
			return result;
		} catch (Exception e) {
			log.error("회원 저장 중 오류 발생: ", e);
			throw new RuntimeException("회원 저장 중 오류가 발생했습니다.", e);
		}
	}

	@Override
	public List<User> findUserList() {

		List<User> userList = userDAO.findUserList();

		return userList;
	}

	@Override
	public User findUserById(String id) {
		return sqlSessionTemplate.selectOne("com.app.mapper.UserMapper.findUserById", // 변경됨
				id);
	}

	@Override
	public User checkUserLogin(User user) {
		User loginUser = sqlSessionTemplate.selectOne("com.app.mapper.UserMapper.checkUserLogin", user);
		return loginUser;
	}

	@Override
	public int modifyUserPw(User user) {

		int result = userDAO.modifyUserPw(user);

		return result;
	}

	@Override
	public int modifyUser(User user) {

		int result = userDAO.modifyUser(user);

		return result;
	}

	@Override
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition) {

		List<User> userList = userDAO.findUserListBySearchCondition(userSearchCondition);

		return userList;
	}

	@Override
	public boolean isDuplicatedId(String id) {

		User user = userDAO.findUserById(id); // 해당 ID로 DB에서 조회

		if (user == null) { // 해당 아이디 객체가 없다 -> id값 사용안한다 -> 중복 XXX
			return false;
		} else { // 아이디 객체가 있다 -> id값이 pk 사용되고 있다 -> 중복 OOO
			return true;
		}
	}

	@Override
	public boolean existsByEmail(String email) {
		try {
			return userMapper.countByEmail(email) > 0;
		} catch (Exception e) {
			log.error("이메일 중복 체크 중 오류 발생: ", e);
			return false;
		}
	}

	@Override
	public String findPasswordByEmail(String email) {
		return userMapper.findPasswordByEmail(email);
	}

	@Override
	public int modifyPasswordByEmail(String email, String newPassword) {
		// TODO Auto-generated method stub
		return 0;
	}

}