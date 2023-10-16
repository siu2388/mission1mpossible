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

.success-background {
		border: 2px solid #9BD6AF;
		background-color: #9BD6AF;
}

.fail-background {
		border: 2px solid #F3AA9F;
		background-color: #F3AA9F;
}

/* .success-text {
  color: #FFFFFF !important;
  border-radius: 5px;
  background-color: #556B2F;
}

.fail-text {
  color: #FFFFFF !important;
  border-radius: 5px;
  background-color: #800020;
} */
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

.custom-btn-update {
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
		position: relative;
}

.card .card-title {
		font-size: 35px;
		font-weight: bold;
		background-color: #CBC65E;
		margin: 0;
}

.custom-text2 {
		font-weight: bold;
		color: #49339A;
		margin-top: 20px;
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

.custom-bg {
		background-color: #49339A;
		color: #ffffff;
		padding: 5px;
		border-radius: 8px;
		position: absolute;
		top: 0;
		left: 0;
}

.btn-box {
		position: relative;
		top: 25px;
}

.mission-img-default {
		object-fit: cover;
		width: 250px;
		height: 250px;
}

.w-70 {
		width: 70%;
}

.no-padding {
		padding: 0 !important;
}
</style>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(function() {
		$('#likeheart').click(function() {
			$.ajax({ //백엔드의 전송 -비동기 :controller>Like
				url : 'like',
				type : 'post',
				dataType : 'json', //contentType
				data : {
					'idx' : '<c:out value="${mission.idx}"/>'
				}, //파라미터로 넘어가는 데이터
				success : function(res) {
					console.log(res.selected);
					console.log(res.likecount);
					if (res.selected) {
						$("#likeheart").attr("src", "<%=request.getContextPath()%>/images/likeFull.png")
					} else {
						$("#likeheart").attr("src", "<%=request.getContextPath()%>/images/likeEmpty.png")
					}
					$("#likecount").text(res.likecount)
				},
				error : function(err) {
											console.log(err);
										}
			})
		})
						 
		$('#bookmarked').click(function() {
      $.ajax({
        url: 'bookmark',
        type: 'post',
        dataType: 'json',
        data: {
          'idx': '<c:out value="${mission.idx}"/>'
        },
        success: function(res) {
          console.log(res.bselected);
          if (res.bselected) {
            $("#bookmarked").attr("src", "<%=request.getContextPath()%>/images/bmFull.png")
          } else {
            $("#bookmarked").attr("src", "<%=request.getContextPath()%>/images/bmEmpty.png")
					}
				},
				error : function(err) {
					console.log(err);
				}
			})
		})
	})
</script>
</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<!-- 좌 프로필카드 -->
	<div class="profilebox">
		<jsp:include page="profilecard.jsp" />
	</div>

	<div class="missionbox">
		<div class="py-2 mx-auto w-90">

			<div class="py-1 px-2 custom-currentDate-div text-center">
				<span
					id="createdAt"
					class="custom-bg"
				>${formattedDate}</span>
				<div
					id="missionStatus"
					class="mb-2 mt-2 d-flex align-items-center justify-content-center"
				>
					<!-- 성공/실패/진행중에따라 보여지는 값 -->
					<!-- 진행중: success가 null, createdAt이 오늘인 경우 -->
					<!-- 성공: success가 성공, createdAt == updatedAt인 경우 -->
					<!-- 실패: 기타 모든 경우 -->
					<c:set
						var="now"
						value='<%=new java.util.Date()%>'
					/>
					<fmt:formatDate
						var="today"
						value="${now}"
						pattern="yyyy-MM-dd"
					/>
					<c:set var="missionStatusText">
						<c:choose>
							<c:when
								test="${mission.success == null && mission.createdAt == today}"
							>
	              진행중인 미션!
	            </c:when>
							<c:when
								test="${'성공' eq mission.success && mission.createdAt == mission.updatedAt}"
							>
	              성공한 미션🤩
	            </c:when>
							<c:otherwise>
	              실패한 미션😭
	            </c:otherwise>
						</c:choose>
					</c:set>
					<div class="custom-text2">${missionStatusText}</div>
				</div>


				<div class="card mx-auto w-70">
					<div class="card-title text-center">${mission.title}</div>
					<c:if test="${mission.miImg eq null}">
						<img class="card-img-top rounded-0 mission-img-default"
						  src="${pageContext.request.contextPath}/images/defaultMission.jpg" />
					</c:if>
					<c:if test="${mission.miImg ne null}">
						<img class="card-img-top rounded-0 mission-img-default" src="image?miImg=${mission.miImg}" />
					</c:if>

					<c:if test="${mission.context ne null}">
						<div class="card-body custom-text3">${mission.context}</div>
					</c:if>
				</div>
				<!--  북마크 & 좋아요 -->
				<!--  북마크 -->
				<div
					class="mx-auto w-70 d-flex justify-content-end align-items-center"
				>
					<c:if test="${user ne Empty }">
						<c:choose>
							<c:when test="${bselected == true }">
								<img
									id="bookmarked"
									alt="선택한북마크"
									src="<%=request.getContextPath()%>/images/bmFull.png"
									width="20px"
									height="20px"
								>
							</c:when>
							<c:otherwise>
								<img
									id="bookmarked"
									alt="선택안된북마크"
									src="<%=request.getContextPath()%>/images/bmEmpty.png"
									width="20px"
									height="20px"
								>
							</c:otherwise>
						</c:choose>

						<!--  좋아요 -->
						<c:choose>
							<c:when test="${selected==true}">
								<img
									id="likeheart"
									src="<%=request.getContextPath()%>/images/likeFull.png"
									width="20px"
									height="20px"
								>
							</c:when>
							<c:otherwise>
								<img
									id="likeheart"
									src="<%=request.getContextPath()%>/images/likeEmpty.png"
									width="20px"
									height="20px"
								>
							</c:otherwise>
						</c:choose>
					</c:if>
					<span>
						좋아요(
						<span id="likecount">${mission.likecount}</span>
						)
					</span>
					&nbsp;&nbsp;
				</div>
			</div>
		</div>

		<div class="btn-box d-flex justify-content-between">
			<!-- 버튼 배치를 위한 그리드 -->
			<div class="container no-padding">
				<div class="row">
					<!-- 왼쪽 공백 -->
					<div class="col-md-2 no-padding"></div>

					<!-- 성공, 실패 버튼 -->
					<div class="col-md-8 no-padding">
						<form
							action="success-fail?idx=${mission.idx}"
							method="post"
							class="text-center"
						>
							<input
								type="hidden"
								name="idx"
								value="${mission.idx}"
							>
							<input
								class="btn py-1 px-3 mx-2 mt-2 custom-btn-success"
								type="submit"
								name="success"
								value="성공"
							/>
							<input
								class="btn py-1 px-3 mx-2 mt-2 custom-btn-fail"
								type="submit"
								name="success"
								value="실패"
							/>
						</form>
					</div>

					<!-- 수정 버튼 -->
					<div class="col-md-2 no-padding d-flex justify-content-end">
						<c:if test="${user.idx eq mission.userIdx}">
							<a
								href="update-mission?idx=${mission.idx}"
								class="btn py-1 px-3 mx-2 mt-2 custom-btn-update"
								type="button"
							>수정</a>
						</c:if>
					</div>

				</div>
				<!-- row -->
			</div>
			<!-- container (그리드 끝) -->
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	></script>
	<script>
		$(document).ready(function() {
			let success = '${mission.success}';
			let missionBox = $('.missionbox');
			/* let missionStatusText = '${missionStatusText}'; */

			if (success == '성공') {
				missionBox.addClass('success-background');
				/* $('#missionStatus').addClass('success-text'); */
			} else if (success == '실패') {
				missionBox.addClass('fail-background');
				/* $('#missionStatus').addClass('fail-text'); */
			}
		});
	</script>
</body>

</html>