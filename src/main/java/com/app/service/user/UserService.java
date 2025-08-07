package com.app.service.user;

import java.util.List;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface UserService {

	public int saveUser(User user);

	public int saveAdminUser(User user);

	public int saveCustomerUser(User user);

	public List<User> findUserList();

	public User findUserById(String id);

	public User checkUserLogin(User user);

	public int modifyUserPw(User user);

	public int modifyUser(User user);

	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition);

	public boolean isDuplicatedId(String id);

	/** 이메일 가입 여부 체크 */
	boolean existsByEmail(String email);

	/** 이메일로 비밀번호 조회 (기존 메서드) */
	String findPasswordByEmail(String email);
}
