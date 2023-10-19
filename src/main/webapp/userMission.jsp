<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta
	name="viewport"
	content="width=device-width, initial-scale=1"
>
<title>MISSION 1'M POSSIBLE</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet"
>
<script
	src="https://kit.fontawesome.com/e4855e3cf5.js"
	crossorigin="anonymous"
></script>

<style>
@font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
html, body {
    font-family: 'NPSfontBold', sans-serif !important;
		height: 100%;
		background-image: url(./images/bg.jpg);
}

.w-90 {
		width: 90% !important;
}

.w-80 {
		width: 80% !important;
}

.w-70 {
		width: 70% !important;
}

.custom-btn {
		background-color: #4AC98C !important;
		border-color: #4AC98C !important;
		color: black !important;
		font-weight: bold;
		border-radius: 20px;
}

.custom-btn-success {
		background-color: #556B2F !important;
		color: #ffffff !important;
		font-weight: bold;
		border-radius: 10px;
}

.custom-btn-fail {
		background-color: #800020 !important;
		color: #ffffff !important;
		font-weight: bold;
		border-radius: 10px;
}

.custom-btn-modify {
		background-color: #AAA9AD !important;
		color: #ffffff !important;
		border-radius: 10px;
}

.custom-form {
		border-radius: 10px;
		box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
		background-color: #E5D689;
}

.custom-currentDate-div {
		border-radius: 10px;
		background-color: #49339A !important;
		color: #ffffff !important;
		font-size: 15px;
		width: 175px;
		margin-top: 10px;
}

.isSucess {
		font-size: 27px;
}

.custom-text {
		font-size: 35px;
		font-weight: bold;
}

.custom-text2 {
		font-weight: bold;
		color: #49339A;
}

.custom-text3 {
		font-size: 14px;
}

.custom-text-color {
		color: #49339A;
}

.custom-icon-color {
		color: #49339A;
}

img.img-fluid {
		width: 400px;
		height: 300px;
		object-fit: cover;
}

.card-title {
		padding-top: 15px;
}

.b {
		border: black solid 1px;
}

.box-bottom {
		margin-bottom: 5px;
}

.mr-2 {
		margin-right: 5px;
}

.fa-heart {
		margin-top: 4px;
}
</style>

</head>

<body class="d-flex align-items-center py-4">
	<main class="w-100 m-auto">
		<jsp:include page="/header.jsp" />
		<!-- Header, Nav -->
		<div class="container mt-5">
			<div class="row">
				<!-- 좌 공백 -->
				<div class="col-md-1"></div>
				<!-- 좌 프로필카드 -->
				<div class="col-md-2">profileCard</div>
				<!-- 중간 공백 -->
				<div class="col-md-1"></div>
				<!-- 우 myToday 폼 -->
				<div
					class="col-md-6 custom-form d-flex align-items-center justify-content-center"
				>
					<form class="py-2 mx-auto w-90">
						<div
							class="py-1 px-2 custom-currentDate-div text-center"
							id="currentDate"
						>2023년 10월 05일 (목)</div>
						<div
							class="mb-1 mt-2 d-flex align-items-center justify-content-center"
						>
							<div class="isSucess">
								<div class="badge text-bg-success">
									성공한 미션! <i class="fa-regular fa-face-smile"></i>
								</div>
							</div>
						</div>
						<div class="card bg-warning-subtle mx-auto w-70">
							<div class="card-title text-center custom-text">전력질주</div>
							<img
								class="card-img-top rounded-0"
								src="./images/park3.jpg"
							>
							<div class="card-body custom-text3">
								한겨울에 내복만 입고 전력질주를 할 것이다.. <br>한겨울에 내복만 입고 전력질주를 할 것이다.. <br>한겨울에
								내복만 입고 전력질주를 할 것이다..
							</div>
						</div>
						<div class="box-bottom">
							<div class="mx-auto w-70 d-flex justify-content-end">
								<span class="mr-2 custom-text-color">54</span>
								<i class="fas fa-heart mx-1 custom-icon-color"></i>
							</div>
						</div>
						<div></div>
					</form>
				</div>
				<!-- 중간 + 우 공백 -->
				<div class="col-md-1"></div>
				<!-- 중간 + 우 공백 -->
				<div class="col-md-1"></div>
			</div>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	></script>
</body>

</html>