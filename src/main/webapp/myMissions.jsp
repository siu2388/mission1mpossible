<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta
	name="viewport"
	content="width=device-width, initial-scale=1.0"
>
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous"
>
<script
	src="https://kit.fontawesome.com/e4855e3cf5.js"
	crossorigin="anonymous"
></script>
<style>
html, body {
		background-image: url('<%=request.getContextPath()%>/images/bg.jpg');
		margin: 0 auto;
}

header {
		margin-bottom: 30px;
}

.profile {
		float: left;
		border: 1px solid;
		width: 200px;
		height: 250px;
		margin: 20px;
}

.col {
		margin-bottom: 25px;
}

.card {
		width: 130px;
		height: 200px;
		text-align: center;
		cursor: pointer;
}

.card:hover {
		transform: translateY(-20px);
		transition: 0.5s ease-in-out;
		cursor: pointer;
}

.card-title {
		font-size: 21px;
		font-weight: bold;
		color: black;
}

.like {
		color: #49339A;
}
</style>
</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<main>
		<div class="profile"></div>
		<div class="row row-cols-7 g-4">
			<div class="col">
				<div class="card">
					<div class="card bg-success border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>초록 100
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-success bg-opacity-75 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>초록 75
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-success bg-opacity-50 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>초록 50
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-success bg-opacity-25 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>초록 25
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-success bg-opacity-10 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>초록 10
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-success bg-opacity-10 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>초록 10
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-success bg-opacity-10 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>초록 10
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-danger border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>빨강 100
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-danger bg-opacity-75 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>빨강 75
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-danger bg-opacity-50 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>빨강 50
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-danger bg-opacity-25 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>빨강 25
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-danger bg-opacity-10 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>빨강 10
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-danger bg-opacity-10 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>빨강 10
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<div class="card bg-danger bg-opacity-10 border-dark">
						<div class="card-header bg-transparent border-dark">03월 01일</div>
						<div class="card-body text-success">
							<h5 class="card-title">
								3.1절에 <br>태극기 <br>게양하기 <i class="fa-regular fa-flag"></i>
								<br>빨강 10
							</h5>
						</div>
						<div class="card-footer bg-transparent border-dark">
							<div class="like">
								777 <i class="fa-regular fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"
	></script>
</body>

</html>