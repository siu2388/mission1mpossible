<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MISSION 1'M POSSIBLE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
@font-face {
  font-family: 'NPSfontBold';
  src:
    url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2')
    format('woff2');
  font-weight: 700;
  font-style: normal;
}
html, body {
  font-family: 'NPSfontBold', sans-serif !important;
	height: 100%;
	background-image: url(./images/bg.jpg);
}

.form-login {
	max-width: 300px;
	padding: 1rem;
}

.form-login .form-floating:focus-within {
	z-index: 2;
}

.form-login input[type="text"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-login input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.custom-form .custom-btn-login {
	background-color: #49339A;
	color: #ffffff;
	font-weight: bold;
}

.custom-form {
	border: 2px solid #49339A;
	border-radius: 10px;
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}

.custom-text-title {
	font-weight: bold;
	font-size: 2rem;
}

img.img-fluid {
	max-width: 100%;
	height: auto;
}
</style>
</head>

<body class="d-flex align-items-center py-4">
	<main class="w-100 m-auto">
		<!-- 상단 로고 -->
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<a href="missions" class="logo-a">
					  <img class="img-fluid" src="${pageContext.request.contextPath}/images/miplogo.png" alt="logo">
					</a>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<!-- 좌 하단 이미지 -->
				<div class="col-md-3">
					<img class="img-fluid" src="${pageContext.request.contextPath}/images/mainImg1.png" alt="MainImg1">
				</div>
				<!-- 우 하단 로그인 폼 -->
				<div class="col-md-3 custom-form d-flex align-items-center justify-content-center">
					<form action="login" method="post">
						<div class="mb-4 text-center custom-text-title">로그인</div>
						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput" name="userId" placeholder="text">
							<label for="floatingInput">아이디</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword" name="pwd" placeholder="Password">
								<label for="floatingPassword">비밀번호</label>
						</div>
						<input class="btn w-100 py-2 mt-3 custom-btn-login" type="submit" value="로그인" />
						<a href="join.jsp" class="btn w-100 py-2" type="button">회원가입</a>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</main>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	  document.getElementById('loginBtn').addEventListener('click', function(event) {
	    // 사용자 입력을 가져옴
	    let userId = document.querySelector('input[name=userId]').value;
	    let pwd = document.querySelector('input[name=pwd]').value;
	    
	    // 아이디 입력 확인
	    if (userId.trim() === '') {
	      swal('', '아이디를 입력해주세요.', 'info')
	      event.preventDefault();
	      return;
	    }
	    
	    // 비밀번호 입력 확인
	    if (pwd.trim() === '') {
	      swal('', '비밀번호를 입력해주세요.', 'info')
	      event.preventDefault();
	      return;
	    }
	  });	 
	</script>
</body>
</html>