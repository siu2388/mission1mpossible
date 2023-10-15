<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/e4855e3cf5.js"></script>
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

.join {
	float: left;
	margin: 20px;
	margin-right: 10px;
	border: 10px solid rgb(157, 217, 174);
	border-radius: 30px;
	width: 200px;
	height: 250px;
	font-weight: 500;
	padding: 12px;
	background-color: rgb(221, 241, 228);
	border: 10px solid rgb(157, 217, 174);
}

.join-text {
	font-size: 18px;
	font-weight: 900;
}

.join-button {
	display: flex;
	justify-content: center;
	text-decoration: none;
	width: 155px;
	height: 40px;
	font-size: 17px;
	font-weight: 600;
	color: white;
	background-color: #49339A;
	border: none;
	border-radius: 45px;
	cursor: pointer;
	margin-top: 25px;
	transition: 0.5s ease-in-out;
}

.join-button:hover {
	background-color: white;
	color: #49339A;
	box-shadow: 10px 10px 10px #49339A;
	transition: 0.5s ease-in-out;
}

.img.card-img {
	width: 60px;
	height: 60px;
	border-radius: 50%;
}

.col {
	width: 250px;
	height: 250px;
	margin-top: 50px;
	margin-bottom: 30px;
}

.card {
	border: 1px solid black;
	background-color: rgb(251, 247, 238);
	margin: 20px;
}

.card:hover {
	transform: scale(1.1);
	transition: 0.5s ease-in-out;
	cursor: pointer;
}

.card-top {
	display: flex;
	justify-content: space-around;
}

.bookmark {
	color: #FAF009;
	margin-right: 70px;
}

.like {
	color: #49339A;
	margin-left: 70px;
}

.card-user {
	margin-top: 10px;
	margin-left: 10px;
}

.card-text {
	font-size: 13px;
	padding: 0;
	margin-left: 10px;
	margin-right: 10px;
}

.user-card-text {
	margin: 0px;
	margin-botton: 20px;
	width: 120px;
	height: 20px;
	float: right;
}

.pagination .page-link {
	margin-top: 4rem;
	text-decoration: none;
	color: black;
	background-color: transparent;
	border-color: transparent;
}

.pagination .page-link:hover {
	text-decoration: none;
	color: white;
	background-color: transparent;
	border-color: transparent;
}
</style>

</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<div>
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<div class="join">
					<div class="join-text">회원가입을 하시면 오늘의 미션을 등록하고, 더욱 다양한 서비스를
						이용하실 수 있습니다!</div>
					<a href="join" class="join-button">회원가입 </a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="profilebox">
					<jsp:include page="profilecard.jsp" />
				</div>
			</c:otherwise>
		</c:choose>

		<div class="container">
			<div class="row row-cols-1 row-cols-md-4 g-4">
				<c:forEach items="${result.missionList}" var="mission">
					<div class="col">
						<div class="card bg-secondary-subtle" style="margin-top:50px">
							<div class="card-top">
								<div class="bookmark">
									<i class="fa-solid fa-bookmark"></i>
								</div>
								<div class="like">
									33 <i class="fa-solid fa-heart"></i>
								</div>
							</div>
							<div class="card-text">
								<div class="card-title">${mission.title }</div>
								<div class="card-date">${mission.createdAt }</div>
								<c:choose>
									<c:when test="${mission.miImg ne null}">
										<img class="card-img-top rounded-0"
											src="image?miImg=${mission.miImg}" />
									</c:when>
									<c:otherwise>
										<img
											src="<%=request.getContextPath()%>/images/defaultMission.jpg"
											class="card-img" alt="미션기본이미지" style="width: 200px; height: 100px;">
									</c:otherwise>
								</c:choose>

								<div class="card-user">
									<c:choose>
										<c:when test="${mission.uprofileImg ne null}">
											<img class="card-img-top rounded-circle"
												src="image?miImg=${mission.uprofileImg}"
												style="width: 50px; height: 50px;" />
										</c:when>
										<c:otherwise>
											<img
												src="<%=request.getContextPath()%>/images/defaultProfile.png"
												class="card-img" alt="미션기본이미지">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="user-card-text">${mission.unickname }
									님 도전중!</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 페이지네이션 -->
			<div class="d-flex justify-content-center mt-4">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>

</html>

</html>
