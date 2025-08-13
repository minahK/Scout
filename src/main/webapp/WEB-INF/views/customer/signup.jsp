<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	width: 400px;
	margin: 100px auto;
	padding: 30px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

@media ( max-width : 500px) {
	.container {
		width: 90%;
		margin: 50px auto;
		padding: 20px;
	}
}

.loginpage .logo {
	display: block;
	margin: 0 auto;
}

h1, h2 {
	text-align: center;
	color: #333;
	margin-bottom: 10px;
}

.description {
	text-align: center;
	color: #777;
	margin-top: 10px;
	font-size: 14px;
}

form {
	display: flex;
	flex-direction: column;
}

.input-group {
	position: relative;
	width: 100%;
	box-sizing: border-box;
}

.input-group input {
	width: 100%;
	padding: 10px 40px 10px 35px; /* 왼쪽 아이콘 + 오른쪽 아이콘 공간 확보 */
	box-sizing: border-box;
}

.input-group i {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	color: #aaa;
	pointer-events: none;
}

.input-group .fa-lock {
	left: 10px;
}

.input-group .password-toggle {
	right: 10px;
	cursor: pointer;
	pointer-events: auto;
}

.input-icon {
	position: absolute;
	top: 50%;
	left: 10px;
	transform: translateY(-50%);
	color: #aaa;
	pointer-events: none;
}

.options {
	margin-top: 15px;
	text-align: center;
	font-size: 14px;
}

.options a {
	color: #eb5e00;
	text-decoration: none;
	margin: 0 10px;
	font-weight: 800;
}

.options a:hover {
	text-decoration: underline;
}

button {
	margin-top: 20px;
	padding: 10px;
	background-color: #ff9752;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
}

button:hover {
	background-color: #eb5e00;
}

.error-message {
	color: red;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
}
</style>
</head>
<body>

	<%@ include file="../travelDestination/tdHeader.jsp"%>
	<div class="loginpage">
	<div class="container">
		<img src="/images/ScoutLogo.png" alt="TRACE 로고" width="150"
			height="100" class="logo">
		<p class="description">TRACE에 오신 것을 환영합니다.</p>

		<h1>회원가입</h1>

		<form action="/Scout/signup" method="post" id="signupForm">
			<label for="inputId">아이디</label>
			<div class="input-group">
				<i class="fas fa-user input-icon"></i> <input type="text" name="id"
					id="inputId" required>
			</div>
			<button type="button" id="btn_checkDupId" class="check-btn">중복체크</button>
			<p id="checkDupIdMsg"></p>


			<label for="pw">비밀번호</label>
			<div class="input-group">
				<i class="fas fa-lock input-icon"></i> <input type="password"
					name="pw" id="pw" required> <i
					class="fas fa-eye password-toggle" onclick="togglePassword('pw')"></i>
			</div>

			<label for="pwConfirm">비밀번호 확인</label>
			<div class="input-group">
				<i class="fas fa-lock input-icon"></i> <input type="password"
					id="pwConfirm" required> <i
					class="fas fa-eye password-toggle"
					onclick="togglePassword('pwConfirm')"></i>
			</div>
			<p id="pwMatchMsg"></p>

			<label for="email">이메일</label>
			<div class="input-group">
				<i class="fas fa-envelope input-icon"></i> <input type="email"
					name="email" id="email" placeholder="example@domain.com" required>
			</div>
			<button type="button" id="btn_checkDupEmail" class="check-btn">이메일 중복체크</button>
			<p id="emailFormatMsg"></p>

			<label for="name">닉네임</label>
			<div class="input-group">
				<i class="fas fa-user-tag input-icon"></i> <input type="text"
					name="name" id="name" required>
			</div>

			<button type="submit">가입하기</button>

			<div class="options">
				<p>아이디가 이미 있으신가요?</p>
				<a href="/Scout/signin">로그인</a>
			</div>
		</form>
	</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
  // 비밀번호 보기 토글
  function togglePassword(fieldId) {
    const pwField = document.getElementById(fieldId);
    const toggleIcon = pwField.nextElementSibling;
    if (pwField.type === "password") {
      pwField.type = "text";
      toggleIcon.classList.add("fa-eye");
      toggleIcon.classList.remove("fa-eye-slash");
    } else {
      pwField.type = "password";
      toggleIcon.classList.add("fa-eye-slash");
      toggleIcon.classList.remove("fa-eye");
    }
  }

  // 아이디 중복 체크
  const btn_checkDupId = document.getElementById('btn_checkDupId');
  const p_checkDupIdMsg = document.getElementById('checkDupIdMsg');

  btn_checkDupId.addEventListener('click', () => {
    let inputId = document.getElementById('inputId').value;
    let obj = {
      "id": inputId,
      "type": "CUS"
    };
    let jsonText = JSON.stringify(obj);

    $.ajax({
      type: "POST",
      url: "http://localhost:8080/Scout/checkDupIdJson",
      headers: {
        "Content-type": "application/json"
      },
      data: jsonText,
      dataType: 'json',
      success: function (result) {
        let jsObj = result;
        if (jsObj.body === 'Y') {
          p_checkDupIdMsg.textContent = '중복된 아이디입니다.';
          p_checkDupIdMsg.style.color = 'red';
        } else {
          p_checkDupIdMsg.textContent = '사용 가능한 아이디입니다.';
          p_checkDupIdMsg.style.color = 'green';
        }
      },
      error: function (error) {
        console.log(error);
      }
    });
  });

  // 비밀번호 일치 확인
  const pw = document.getElementById('pw');
  const pwConfirm = document.getElementById('pwConfirm');
  const pwMatchMsg = document.getElementById('pwMatchMsg');

  pwConfirm.addEventListener('input', () => {
    if (pw.value === pwConfirm.value) {
      pwMatchMsg.textContent = '비밀번호가 일치합니다.';
      pwMatchMsg.style.color = 'green';
    } else {
      pwMatchMsg.textContent = '비밀번호가 일치하지 않습니다.';
      pwMatchMsg.style.color = 'red';
    }
  });
  
  //이메일 확인
  const emailInput = $('#email');
  const emailMsg = $('#emailFormatMsg');
  const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  emailInput.on('input', () => {
    if (!emailPattern.test(emailInput.val())) {
      emailMsg.text('올바른 이메일 형식이 아닙니다').css('color', 'red');
    } else {
      emailMsg.text('');
    }
  });

  // 이메일 중복 체크
  const btn_checkDupEmail = document.getElementById('btn_checkDupEmail');
  
  btn_checkDupEmail.addEventListener('click', () => {
    let inputEmail = document.getElementById('email').value;
    
    if (!emailPattern.test(inputEmail)) {
      emailMsg.text('올바른 이메일 형식이 아닙니다').css('color', 'red');
      return;
    }
    
    let obj = {
      "email": inputEmail,
      "type": "CUS"
    };
    let jsonText = JSON.stringify(obj);

    $.ajax({
      type: "POST",
      url: "http://localhost:8080/Scout/checkDupEmailJson",
      headers: {
        "Content-type": "application/json"
      },
      data: jsonText,
      dataType: 'json',
      success: function (result) {
        let jsObj = result;
        if (jsObj.body === 'Y') {
          emailMsg.text('이미 사용 중인 이메일입니다').css('color', 'red');
        } else {
          emailMsg.text('사용 가능한 이메일입니다').css('color', 'green');
        }
      },
      error: function (error) {
        console.log(error);
        emailMsg.text('중복 체크 중 오류가 발생했습니다').css('color', 'red');
      }
    });
    });

  // 폼 제출 시 유효성 검사
  document.getElementById('signupForm').addEventListener('submit', function(e) {
    const id = document.getElementById('inputId').value;
    const pw = document.getElementById('pw').value;
    const pwConfirm = document.getElementById('pwConfirm').value;
    const email = document.getElementById('email').value;
    const name = document.getElementById('name').value;
    
    // 필수 필드 검사
    if (!id || !pw || !pwConfirm || !email || !name) {
      e.preventDefault();
      alert('모든 필드를 입력해주세요.');
      return false;
    }
    
    // 비밀번호 일치 검사
    if (pw !== pwConfirm) {
      e.preventDefault();
      alert('비밀번호가 일치하지 않습니다.');
      return false;
    }
    
    // 이메일 형식 검사
    if (!emailPattern.test(email)) {
      e.preventDefault();
      alert('올바른 이메일 형식을 입력해주세요.');
      return false;
    }
    
    // 아이디 중복 체크 여부 확인 (간단한 검사)
    const idMsg = document.getElementById('checkDupIdMsg').textContent;
    if (idMsg !== '사용 가능한 아이디입니다.') {
      e.preventDefault();
      alert('아이디 중복 체크를 완료해주세요.');
      return false;
    }
  });

</script>
</body>
</html>