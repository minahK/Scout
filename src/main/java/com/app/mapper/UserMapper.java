package com.app.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.app.dto.user.User;

@Mapper
public interface UserMapper {

	// 1) 아이디 중복 체크
	@Select("SELECT COUNT(*) FROM T_USER WHERE id = #{id}")
	int countById(@Param("id") String id);

	// 2) 이메일 중복 체크
	@Select("SELECT COUNT(*) FROM T_USER WHERE email = #{email}")
	int countByEmail(@Param("email") String email);

	// 3) 회원 가입 처리
	@Insert("INSERT INTO T_USER(id, pw, name, email) VALUES(#{id}, #{pw}, #{name}, #{email})")
	int insertUser(User user);

	// 3-1) 회원 가입 처리 (MERGE 방식)
	int saveUserMerge(User user);

	// 4) 로그인 시 사용자 정보 조회
	@Select("SELECT * FROM T_USER WHERE id = #{id}")
	User findById(@Param("id") String id);

	// 5) 비밀번호 찾기용 (이메일로 PW 조회)
	@Select("SELECT pw FROM T_USER WHERE email = #{email}")
	String findPasswordByEmail(@Param("email") String email);

	// 이메일 찾기
	@Select("SELECT email FROM T_USER WHERE id = #{id}")
	String findEmailById(@Param("id") String id);

	// 6) 비밀번호 재설정
	@Update("UPDATE T_USER SET pw = #{newPw} WHERE email = #{email}")
	int updatePwByEmail(@Param("email") String email, @Param("newPw") String newPw);

	User selectByEmail(@Param("email") String email);

	// 비밀번호 재설정 토큰으로 사용자 찾기
	User findByResetToken(@Param("token") String token);

	// 토큰 저장 (발급 시)
	void saveResetToken(@Param("userId") Long userId, @Param("token") String token);

	// 비밀번호 변경
	int updatePassword(@Param("userId") Long userId, @Param("password") String password);

	// 토큰 제거 (사용 후)
	void clearResetToken(@Param("userId") String userId);

	int updatePasswordByEmail(@Param("email") String email,
            @Param("pw") String pw);


}
