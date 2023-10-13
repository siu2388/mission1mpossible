<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MISSION 1'M POSSIBLE</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<style>
body {
	height: 100%;
	background-image: url(./images/bg.jpg);
}

.profilebox {
	float: left;
}

.missionbox {
	border: 2px solid #EFD915;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	background-color: #E5D689;
	background-size: contain;
	width: 60%;
	float: right;
	height: 500px;
	padding: 10px;
	margin: 2rem 5rem 0 0;
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
	/* background-color: #49339A; */
	color: #ffffff !important;
}

.custom-text {
	font-size: 35px;
	font-weight: bold;
	background-color: #CBC65E;
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

.custom-bg-color {
  background-color: #49339A;
}

/* img.img-fluid {
	width: 400px;
	height: 300px;
	object-fit: cover;
} */

.card-title {
	margin: 0;
}

.mission-img-default {
	object-fit: cover;
	width: 250px;
	height: 250px;
}

</style>
</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	
  <!-- 좌 프로필카드 -->
	<div>
		<div class="profilebox">
			<jsp:include page="profilecard.jsp" />
		</div>
	</div>
	
	<div class="missionbox">
		<div class="py-2 mx-auto w-90">
			<div class="py-1 px-2 custom-currentDate-div text-center" id="currentDate">
				<span id="createdAt" class="custom-bg-color">${formattedDate}</span>
				<div class="mb-1 mt-2 d-flex align-items-center justify-content-center">
					<!-- 성공/실패/진행중에따라 보여지는 값 -->
					<!-- 오늘날짜 아직 진행중: 미션이 성공하지 않았고, 생성일이 오늘인 경우 -->
					<!-- 성공: 미션이 성공했고, 생성일과 수정일이 같은 경우 -->
					<!-- 실페: 기타 모든 경우 -->
					<div class="custom-text2">진행중인 미션!</div>
				</div>
				
				<div class="card mx-auto w-70">
					<div class="card-title text-center custom-text">${mission.title}</div>
					<c:if test="${mission.miImg ne null}">
						<img class="card-img-top rounded-0 mission-img-default" src="image?miImg=${mission.miImg}" />
					</c:if>

					<c:if test="${mission.context ne null}">
						<div class="card-body custom-text3">${mission.context}</div>
					</c:if>
				</div>
				<div class="mx-auto w-70 d-flex justify-content-end align-items-center">
					<span class="mr-2 custom-text-color"></span>
					<i class="fas fa-heart mx-1 custom-icon-color"></i>
				</div>
			</div>
		</div>
		
		<div class="d-flex justify-content-center">
			<!-- 성공 / 실패 -->
			<form action="success-fail?idx=${mission.idx}" method="post">
				<input type="hidden" name="idx" value="${mission.idx}">
				<input class="btn py-1 px-3 mx-2 mt-2 custom-btn-success" type="submit" name="success" value="성공" />
				<input class="btn py-1 px-3 mx-2 mt-2 custom-btn-fail" type="submit" name="success" value="실패" />
			</form>
			<!--  -->
			<c:if test="${user.idx eq mission.userIdx}">
				<a href="update-mission?idx=${mission.idx}" class="btn py-1 px-3 mt-2 custom-btn-modify" type="button">수정</a>
			</c:if>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>