<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
%>
<%@ taglib
	prefix="fmt"
	uri="http://java.sun.com/jsp/jstl/fmt"
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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous"
>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"
></script>
<script
	src="https://kit.fontawesome.com/e4855e3cf5.js"
	crossorigin="anonymous"
></script>
<script
	src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"
></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"
></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"
></script>
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
		background-image: url('<%=request.getContextPath()%>/images/bg.jpg');
		margin: 0 auto;
}

header {
		margin-bottom: 30px;
}

.profile {
		float: left;
}

.col77 {
		margin-bottom: 25px;
}

.card77 {
		width: 200px;
		height: 200px;
		text-align: center;
		cursor: pointer;
		margin-top: 1.8rem;
}

.card77:hover {
		/* transform: rotateY(180deg);
      transition: 0.7s ease-in-out; */
		cursor: pointer;
		background-image: url("images/myMissionsHover.jpg");
}

.card-title {
		font-size: 20px;
		font-weight: bold;
		color: white;
}

.like {
		color: #49339A;
}

.page-selected {
		margin: 0;
		font-weight: bold;
}
</style>
</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<main>
		<div class="profile">
			<jsp:include page="profilecard.jsp" />
		</div>
		<div class="row row-cols-5 g-4">
			<c:forEach
				items="${result.myMissionList}"
				var="mission"
			>
				<div class="col col77">

					<div
						class='${mission.success eq "성공"? "card card77 bg-success bg-opacity-75":"card card77 bg-danger bg-opacity-75"}'
						href="missions"
						role="button"
					>
						<div>
							<c:choose>
								<c:when test="${mission.miImg ne null}">
									<img
										src="image?miImg=${mission.miImg}"
										class="mission-img"
										style="width: 198px; height: 200px;"
									/>
								</c:when>
								<c:otherwise>
									<img
										src="./images/defaultMissionBears.jpg"
										class="mission-img"
									/>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="card-header">${mission.createdAt}</div>
						<div class="card-body">
							<h5
								class="card-title"
								style="width: 10rem; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; display: inline-block;"
							>

								<a
									href="mission?idx=${mission.idx}"
									style="text-decoration: none; color: white"
									class="stretched-link"
								>
									<br>${mission.title }
								</a>
								<br> <br>
							</h5>
						</div>
						<div class="card-footer">
							<div class="like">
								${mission.likecount} <i class="fa-solid fa-heart"></i>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>
	<!-- 페이지네이션 -->
	<div class="d-flex justify-content-center mt-4">

		<c:choose>
			<c:when test="${result.pageInfo.curPage > 1}">
				<a
					href="${pagingPath}?page=${result.pageInfo.curPage - 1}"
					style="text-decoration: none; color: black"
				>&lt;</a>
			</c:when>
			<c:otherwise>
            &lt;
        </c:otherwise>
		</c:choose>
		&nbsp;&nbsp;

		<c:forEach
			begin="${result.pageInfo.startPage}"
			end="${result.pageInfo.endPage}"
			var="i"
		>
			<c:choose>
				<c:when test="${result.pageInfo.curPage == i}">
					<a
						href="${pagingPath}?page=${i}"
						class="page-selected"
						onClick="callBtn(${i}); return ${result.keyword == null};"
						style="text-decoration: none; color: black"
					>${i}</a>&nbsp;&nbsp;
            </c:when>
				<c:otherwise>
					<a
						href="${pagingPath}?page=${i}"
						class="page-num"
						onClick="callBtn(${i}); return ${result.keyword == null};"
						style="text-decoration: none; color: black"
					>${i}</a>&nbsp;&nbsp;
            </c:otherwise>
			</c:choose>
		</c:forEach>

		<c:choose>
			<c:when
				test="${result.pageInfo.curPage < result.pageInfo.totalPages}"
			>
				<a
					href="${pagingPath}?page=${result.pageInfo.curPage + 1}"
					style="text-decoration: none; color: black"
				>&gt;</a>
			</c:when>
			<c:otherwise>
            &gt;
        </c:otherwise>
		</c:choose>

	</div>
	<!-- end -->

</body>

</html>