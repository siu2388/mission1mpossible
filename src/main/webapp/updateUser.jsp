<%@ page
		language="java"
		contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib
		prefix="c"
		uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta
		name="viewport"
		content="width=device-width, initial-scale=1">
<title>MISSION 1'M POSSIBLE</title>
<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
		rel="stylesheet">
<style>
html {
		height: 100%;
}

body {
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

.custom-btn {
		background-color: #49339A;
		color: #ffffff;
		font-weight: bold;
}

.custom-join {
		border: 2px solid #49339A;
		border-radius: 10px;
		box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}

h1 {
		font-weight: bold;
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
										<img
												class="img-fluid"
												src="./images/miplogo.png"
												alt="">
								</div>
								<div class="col-md-3"></div>
						</div>
				</div>
				<div class="container">
						<div class="row">
								<div class="col-md-2"></div>
								<!-- 좌 하단 이미지 -->
								<div class="col-md-3">
										<img
												class="img-fluid"
												src="./images/mainImg2.png"
												alt="">
								</div>
								<!-- 중앙, 우 하단 회원정보수정 폼 -->
								<div
										class="col-md-5 d-flex align-items-center justify-content-center"
										style="border: 2px solid #49339A; border-radius: 10px; box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);">
										<div class="px-4">
												<div class="d-flex justify-content-center mb-4">
														<img
																src="./images/profileExam.jpg"
																class="rounded-circle"
																alt="example placeholder"
																style="width: 150px;" />
												</div>
												<div
														class="d-flex justify-content-center align-items-center">
														<div
																class="btn w-30 d-flex justify-content-center align-items-center"
																style="background-color: #49339A; color: #ffffff; font-weight: bold;">
																<label
																		class="form-label m-0"
																		for="customFile2">선택</label> <input
																		type="file"
																		class="form-control d-none"
																		id="customFile2" />
														</div>
												</div>
										</div>
										<form class="px-4">
												<h2
														class="mb-4 text-center"
														style="font-weight: bold;">회원정보수정</h2>
												<div class="form-floating mb-2">
														<input
																type="text"
																class="form-control-sm"
																id="floatingInput"
																placeholder="닉네임">
														<button
																type="button"
																class="btn btn-secondary btn-sm">중복확인</button>
												</div>
												<div class="form-floating mb-2">
														<input
																type="password"
																class="form-control-sm"
																id="floatingPassword"
																placeholder="비밀번호">
												</div>
												<div class="form-floating mb-2">
														<input
																type="password"
																class="form-control-sm"
																id="floatingPassword"
																placeholder="비밀번호확인">
												</div>
												<button
														class="btn w-100 py-2 mt-3"
														type="submit"
														style="background-color: #49339A; color: #ffffff; font-weight: bold;">정보수정하기</button>
										</form>
								</div>
								<div class="col-md-2"></div>
						</div>
				</div>
		</main>
		<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>