package com.app.service.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.common.CommonCode;
import com.app.dao.user.UserDAO;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.user.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Override
	public int saveUser(User user) {

		int result = userDAO.saveUser(user);

		return result;
	}

	@Override
	public int saveAdminUser(User user) {
		//관리자 계정 추가 할때 필요한 체크 로직....

		//user.setUserType("ADM");
		user.setUserType( CommonCode.USER_USERTYPE_ADMIN );
		int result = userDAO.saveUser(user);
		log.info("saveAdminUser 관리자 계정 추가 : {}", user);

		return result;
	}

	@Override
	public int saveCustomerUser(User user) {
		//사용자 계정 추가 할때 필요한 체크 로직....

		//user.setUserType("CUS");
		user.setUserType( CommonCode.USER_USERTYPE_CUSTOMER );
		int result = userDAO.saveUser(user);

		return result;
	}

	@Override
	public List<User> findUserList() {
		
		List<User> userList = userDAO.findUserList();
		
		return userList;
	}

	@Override
	public User findUserById(String id) {
		
		User user = userDAO.findUserById(id);
		
		return user;
	}

	@Override
	public User checkUserLogin(User user) {  
		//매개변수로 들어온 User 객체에 id, pw, userType 로그인을 처리할 수 있는 정상적인 값을 가지고 있는지 여부 체크
		//메소드 주요 로직 -> 로그인 처리 성공? 실패?

		//id pw 일치하는가?
		
		
		/*
		// 케이스 1) DB에서 정보를 조회 한 후 -> Service Layer 상태에서 비교하는 로직을 수행! 
		
		//사용자 정보를 조회해서, id pw 맞나 확인
		User loginUser = userDAO.findUserById(user.getId());
		
		// if(loginUser != null)		
		if( loginUser != null && loginUser.getPw().equals(user.getPw())
					&& loginUser.getUserType().equals(user.getUserType()) ) {
			return loginUser;
		}
		// checkUserLogin 메소드 호출 -> return null? id,pw 틀렸다
		//   return user객체 ? -> 맞다!
			
		return null;
		*/
		
		/*
			return 의미가 담긴 코드 (SUC, FAL, LCK)...
			int 숫자 return -> 1:성공 2:id는 맞는데 비번이 틀렸다 3:아이디없다
							 4:신고로잠겼다 5: 휴면계정 6:...
		 */
		
		// 케이스 2) DB에서 쿼리를 통해, 정상여부 체크 로직 수행
		// userDAO.checkUserLogin -> sql query 상에서 id, pw, userType 동일한 경우를 체크
		User loginUser = userDAO.checkUserLogin(user);
		
		return loginUser;  //조회:O 객체, 조회:X null
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
		
		User user = userDAO.findUserById(id); //해당 ID로 DB에서 조회
		
		if(user == null) {  //해당 아이디 객체가 없다 -> id값 사용안한다 -> 중복 XXX
			return false;	
		} else { //아이디 객체가 있다 -> id값이 pk 사용되고 있다 -> 중복 OOO
			return true;
		}
	}
}












