package com.app.controller.customer;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.dto.api.ApiResponse;
import com.app.dto.api.ApiResponseHeader;
import com.app.dto.user.User;
import com.app.dto.user.UserDupCheck;
import com.app.mapper.UserMapper;
import com.app.service.email.MailService;
import com.app.service.user.UserService;
import com.app.util.LoginManager;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@EnableAsync
@Slf4j
@Controller
@RequestMapping("/Scout")
@RequiredArgsConstructor
public class CustomerController {

	private final UserService userService;
	private final MailService emailService;

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
	public String signinAction(Model model, User user, HttpSession session) {
//		user.setUserType(CommonCode.USER_USERTYPE_CUSTOMER);
		User loginUser = userService.checkUserLogin(user);

		if (loginUser == null) {
		    model.addAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
		}


		LoginManager.setSessionLoginUserId(session, loginUser.getId());
		return "redirect:/Scout/mypage";
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
		return "redirect:/Scout/signin";
	}

	@GetMapping("/resetPw")
	public String resetPwForm(@RequestParam String email, Model model) {
	    model.addAttribute("email", email);
	    return "customer/modifyPw";
	}


	@PostMapping("/resetPw")
	public String resetPwAction(@RequestParam("email") String email,
	                            @RequestParam("password") String password,
	                            Model model) {
	    // 비밀번호 해시 처리 필수 (예: BCrypt)
	    int updated = userMapper.updatePasswordByEmail(email, password);

	    if (updated == 1) {
	        model.addAttribute("message", "비밀번호가 변경되었습니다.");
	        return "redirect:/Scout/signin";
	    } else {
	        model.addAttribute("error", "변경에 실패했습니다. 이메일을 확인해주세요.");
	        model.addAttribute("email", email);
	        return "customer/modifyPw";
	    }
	}





	// 비밀번호 찾기 폼
	@GetMapping("/findPw")
	public String findPwForm() {
		return "customer/findPw";
	}

	@Autowired
	private UserMapper userMapper;

	@PostMapping("/sendMail.do")
	public ResponseEntity<String> sendSimpleMail(@RequestParam("email") String email)
			throws MessagingException, UnsupportedEncodingException {
		String genericMsg = "입력하신 아이디로 안내 메일을 보냈습니다. 메일을 확인해 주세요.";
		String errorMsg = "오류가 발생하였습니다. 다시 시도하여 주세요";
		log.info("📩 입력된 이메일 = {}", email);

		User user = userMapper.selectByEmail(email);
		if (user != null) {
			String resetLink = "http://localhost:8080/Scout/resetPw?email=" + URLEncoder.encode(email, StandardCharsets.UTF_8); // 필요 시 토큰 방식 추가
			String htmlContent = buildHtmlContent(resetLink);

			// 실제 메일 전송
			emailService.sendMail(email, "비밀번호 재설정 안내", htmlContent);

			return ResponseEntity.ok(genericMsg);
		} else {
			return ResponseEntity.ok(errorMsg);
		}

	}

	private String buildHtmlContent(String resetLink) {
		return new StringBuilder().append("<!DOCTYPE html>").append("<html><head><style>")
				.append("body { font-family: Arial; background-color: #f9f9f9; padding: 20px; }")
				.append(".btn { display:inline-block; padding:10px 20px; background:#ff9752; ")
				.append("color:white; text-decoration:none; border-radius:5px; }").append("</style></head><body>")
				.append("<h2>비밀번호 재설정 안내</h2>").append("<p>아래 버튼을 클릭하여 비밀번호를 재설정하세요. 이 링크는 1시간 동안만 유효합니다.</p>")
				.append("<a href='").append(resetLink).append("' class='btn'>비밀번호 재설정</a>")
				.append("<p style='margin-top:20px;'>요청하지 않으셨다면 이 메일을 무시해 주세요.</p>").append("</body></html>")
				.toString();
	}

}