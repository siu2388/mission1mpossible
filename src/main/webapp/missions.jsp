<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"
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
>
<script src="https://kit.fontawesome.com/e4855e3cf5.js"></script>
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
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
body {
    font-family: 'NPSfontBold', sans-serif !important;
		height: 100%;
		background-image: url(./images/bg.jpg);
}

a.custom-link {
		text-decoration: none;
}

header {
		margin-bottom: 1.875rem; 
}

.profilebox {
		float: left;
}

.join-box {
		float: left;
		margin: 1.25rem; 
		margin-top: 3.125rem; 
		border: 0.625rem solid rgb(157, 217, 174); 
		border-radius: 1.875rem; 
		width: 12.5rem; 
		height: 15.625rem; 
		font-weight: 500;
		padding: 0.75rem; 
		background-color: rgb(221, 241, 228);
}

.join-text {
		font-size: 1.125rem; 
		font-weight: 900;
}

.join-button {
		display: flex;
		justify-content: center;
		align-items: center;
		text-decoration: none;
		width: 9.6875rem; 
		height: 2.5rem;
		font-size: 1.0625rem;
		font-weight: 600;
		color: white;
		background-color: #49339A;
		border: none;
		border-radius: 2.8125rem;
		cursor: pointer;
		margin-top: 1.5625rem;
		transition: 0.5s ease-in-out;
}

.join-button:hover {
		background-color: white;
		color: #49339A;
		box-shadow: 10px 10px 10px #49339A;
		transition: 0.5s ease-in-out;
}

.card:hover {
		transform: scale(1.1);
		transition: 0.5s ease-in-out;
		cursor: pointer;
}

div.card .card-top {
		display: flex;
		justify-content: space-between;
		margin: 0;
		padding: 0;
}

.bookmark {
		margin-left: 10px;
}

.like {
		color: #49339A;
		margin-right: 10px;
}

div.card.bg-secondary-subtle {
		width: 250px;
		height: 250px;
		margin-top: 30px;
		margin-left: 20px;
}

.card-text {
		margin-left: 2px;
		padding-top: 50px;
		width: 250px;
		height: 230px;
}

.card-title {
		font-size: 18px;
		padding-left: 20px;
		margin-bottom: 1px;
		font-weight: bold;
}

.card-date {
		border: 1px solid #adada8;
		border-radius: 5px;
		width: 95px;
		margin-left: 20px;
		font-size: 13px;
		padding: 1px 5px 1px 7px;
		background-color: #fff1d9;
		font-weight:semi-bold;
}

.card-img {
		height: 90px;
		margin: 15px 20px 10px 30px;
		padding-top: 0px;
}

.card-user {
		padding-top: 5px;
		margin: 0;
		width: 50px;
}

.user-info {
		width: 35px;
		height: 35px;
		margin-top: -7px;
		margin-left: 30px;
}

.user-img {
		width: 30px;
		height: 30px;
		border-radius: 50%;
		float: left;
		margin-right: 5px;
		margin-bottom: 10px;
		padding: 0;
		margin-right: 5px;
}

.card-text {
		font-size: 12px;
		padding-top: 7px;
}

.user-card-text {
		width: 150px;
		font-size: 12.5px;
		margin-right: 0;
		margin-left: 50px;
		margin-top: -25px;
		padding-left: 22px;
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

.container {
	height: 37.5rem;
}

.page-selected {
		margin: 0;
		font-weight:bold;
}
</style>
<script>
        function callBtn(num) {
            if (keyword != null && keyword.trim() != '') {
                $('#page').val(num);
            }
        }
    </script>

</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<!--   페이지네이션 처리를 위한 케이스 나눔  -->
	<c:choose>
		<c:when test="${catId==0 }">
			<c:set
				value="missions?page="
				var="pagingPath"
			/>
		</c:when>
		<c:when test="${catId==-1 }">
			<c:set
				value="my-bookmarks?page="
				var="pagingPath"
			/>
		</c:when>
		<c:otherwise>
			<c:set
				value="missions-by?catId=${catId}&page="
				var="pagingPath"
			/>
		</c:otherwise>
	</c:choose>
	<!-- end -->
	<div class="container">
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<div class="join-box">
					<div class="join-text">회원가입을 하시면 오늘의 미션을 등록하고, 더욱 다양한 서비스를
						이용하실 수 있습니다!</div>
					<a
						href="join"
						class="join-button"
					>회원가입</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="profilebox">
					<jsp:include page="profilecard.jsp" />
				</div>
			</c:otherwise>
		</c:choose>

		<div class="row row-cols-1 row-cols-md-4 g-4 justify-content-start">
			<c:forEach
				items="${result.missionList}"
				var="mission"
			>
				<div class="col">
					<div class="card bg-secondary-subtle">
						<div class="card-top">
							<div class="bookmark">
								<c:if test="${mission.success=='성공'}">
									<span>🏆</span>
								</c:if>
							</div>
							<div class="like">
								<span class="likecount">${mission.likecount}</span>
								<img
									src="<%=request.getContextPath()%>/images/likeFull.png"
									width="20px"
									height="20px"
								>
							</div>
						</div>
						<div class="card-text">
							<div class="card-title">
								<a
									href="mission?idx=${mission.idx}"
									class="stretched-link"
									style="text-decoration: none; color: black; width:220px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; display:inline-block;"
								>${mission.title }</a>
							</div>
							<div class="card-date">${mission.createdAt}</div>
							<c:choose>
								<c:when test="${mission.miImg ne null}">
									<img
										class="card-img"
										src="image?miImg=${mission.miImg}"
										style="width: 180px"
									/>
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/images/defaultMission.jpg"
										class="card-img"
										alt="미션기본이미지"
										style="width: 180px"
									>
								</c:otherwise>
							</c:choose>

							<div class="card-user">
								<c:choose>
									<c:when test="${mission.uprofileImg ne null}">
										<div class="user-info">
											<img
												class="card-img-top rounded-circle"
												src="image?miImg=${mission.uprofileImg}"
											/>
										</div>
									</c:when>
									<c:otherwise>
										<div class="user-info">
											<img
												src="${pageContext.request.contextPath}/images/defaultProfile.png"
												class="card-img-top rounded-circle"
												alt="미션기본이미지"
											/>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="user-card-text">${mission.unickname}님 미션!</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!--  페이지네이션 -->
		<div class="d-flex justify-content-center mt-4">

			<c:choose>
				<c:when test="${result.pageInfo.curPage>1 }">
					<a href="${pagingPath}${result.pageInfo.curPage-1}" style="text-decoration: none; color: black">&lt;</a>
				</c:when>
				<c:otherwise>
        &lt;
        </c:otherwise>
			</c:choose>
			&nbsp;&nbsp;

			<c:forEach
				begin="${result.pageInfo.startPage}"
				end="${result.pageInfo.endPage }"
				var="i"
			>
				<c:choose>
					<c:when test="${result.pageInfo.curPage == i }">
						<a
							href="${pagingPath}${i }"
							class="page-selected"
							style="text-decoration: none; color: black"
							onClick="callBtn(${i}); return ${result.keyword== null};"
						>${i}</a>&nbsp;&nbsp;
          </c:when>
					<c:otherwise>
						<a
							href="${pagingPath}${i }"
							class="page-num"
							style="text-decoration: none; color: black"
							onClick="callBtn(${i}); return ${result.keyword== null};"
						>${i}</a>&nbsp;&nbsp;
          </c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when
					test="${result.pageInfo.curPage< result.pageInfo.totalPages }"
				>
					<a href="${pagingPath}${result.pageInfo.curPage+1}" style="text-decoration: none; color: black">&gt;</a>
				</c:when>
				<c:otherwise>
        &gt;
        </c:otherwise>
			</c:choose>

		</div>
		<!--  end -->
	</div>
	<!-- container 끝 -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	></script>
</body>

</html>