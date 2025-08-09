package com.app.controller.customer;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//import com.app.common.CommonCode;
import com.app.dto.api.ApiResponse;
import com.app.dto.api.ApiResponseHeader;
import com.app.dto.user.User;
import com.app.dto.user.UserDupCheck;
import com.app.service.email.EmailService;
import com.app.service.user.PasswordResetService;
import com.app.service.user.UserService;
import com.app.util.LoginManager;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Scout")
@RequiredArgsConstructor
public class CustomerController {

	private final UserService userService;
	private final PasswordResetService passwordResetService;
	private final EmailService emailService;

	// 1) 회원가입 폼 보여주기
	@GetMapping("/signup")
	public String signupForm(Model model) {
		model.addAttribute("user", new User());
		return "customer/signup";
	}

	// 2) 회원가입 처리
	@PostMapping("/signup")
	public String signupAction(@ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {

		// 디버그용: 넘어온 값 확인
		System.out.println("가입 정보 → id: " + user.getId() + ", pw: " + user.getPw() + ", name: " + user.getName()
				+ ", email: " + user.getEmail());
		

		int result = userService.saveCustomerUser(user);
		if (result > 0) {
			redirectAttributes.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
			return "redirect:/Scout/signin";
		}

		redirectAttributes.addFlashAttribute("error", "회원가입에 실패했습니다. 다시 시도하세요.");
		return "redirect:/Scout/signup";
	}

	// 아이디 중복확인 (plain text)
	@ResponseBody
	@PostMapping("/checkDupId")
	public String checkDupId(@RequestBody String id) {
		boolean exists = userService.isDuplicatedId(id);
		return exists ? "Y" : "N";
	}

	// 아이디 중복확인 (JSON)
	@ResponseBody
	@PostMapping("/checkDupIdJson")
	public ApiResponse<String> checkDupIdJson(@RequestBody UserDupCheck userDupCheck) {
		boolean exists = userService.isDuplicatedId(userDupCheck.getId());

		ApiResponseHeader header = new ApiResponseHeader();
		header.setResultCode("0000");
		header.setResultMessage("success");

		ApiResponse<String> response = new ApiResponse<>();
		response.setHeader(header);
		response.setBody(exists ? "Y" : "N");
		return response;
	}

	// 로그인 폼
	@GetMapping("/signin")
	public String signinForm() {
		return "customer/signin";
	}

	// 로그인 처리
	@PostMapping("/signin")
	public String signinAction(User user, HttpSession session) {
//		user.setUserType(CommonCode.USER_USERTYPE_CUSTOMER);
		User loginUser = userService.checkUserLogin(user);

		if (loginUser == null) {
			return "customer/signin";
		}
		session.setAttribute("loginUser", loginUser);
		LoginManager.setSessionLoginUserId(session, loginUser.getId());
		return "redirect:/";
	}

	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		if (!LoginManager.isLogin(session)) {
			return "redirect:/Scout/signin";
		}

		String loginUserId = LoginManager.getLoginUserId(session);
		User user = userService.findUserById(loginUserId);
		model.addAttribute("user", user);
		return "customer/mypage";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		LoginManager.logout(session);
		return "redirect:/main";
	}

	// 비밀번호 변경 폼
	@GetMapping("/modifyPw")
	public String modifyPwForm() {
		return "customer/modifyPw";
	}

	// 비밀번호 변경 처리
	@PostMapping("/modifyPw")
	public String modifyPwAction(User user, HttpSession session) {
		user.setId(LoginManager.getLoginUserId(session));
		int result = userService.modifyUserPw(user);
		if (result > 0) {
			return "redirect:/Scout/mypage";
		}
		return "customer/modifyPw";
	}

	// 비밀번호 찾기 폼
	@GetMapping("/findPw")
	public String findPwForm() {
		return "customer/findPw";
	}

	// 비밀번호 재설정 링크 발송 처리
	@PostMapping("/sendResetLink")
	public String sendResetLink(@RequestParam("email") String email, RedirectAttributes redirectAttrs) {

		email = email.trim();
		// 1) 이메일 존재 여부 확인
		if (!userService.existsByEmail(email)) {
			redirectAttrs.addFlashAttribute("error", "등록된 이메일이 없습니다.");
			return "redirect:/Scout/findPw";
		}

		try {
			// 2) 토큰 생성 및 저장
			String token = passwordResetService.createToken(email);
			// 3) 이메일 발송
			emailService.sendPasswordResetEmail(email, token);

			redirectAttrs.addFlashAttribute("message", "비밀번호 재설정 링크를 이메일로 발송했습니다. 스팸함도 확인해 주세요.");
		} catch (Exception ex) {
			log.error("비밀번호 재설정 이메일 발송 실패", ex);
			redirectAttrs.addFlashAttribute("error", "메일 전송 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
		}

		return "redirect:/Scout/findPw";
	}
}