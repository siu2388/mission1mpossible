<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodusercard</title>
</head>
<style>
body {
	background-color: transparent;
	padding-top: 8rem;
	display: flex;
	justify-content: center;
	margin: 0; /* body 요소의 기본 여백을 없앱니다 */
}

.userCard {
	background-image:
		url("${pageContext.request.contextPath}/images/bg2.png");
	width: 18.75rem;
	height: 25rem;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	align-items: center;
	border-radius: 1.5rem;
	position: relative;
	margin-top: 0;
	margin-bottom: 2rem;
	border: 1px solid blueviolet;
}

.userCard>h2 {
	text-align: center;
	color: blueviolet;
	margin-top: 2rem;
	margin-bottom: 0;
	padding: 0;
	border-bottom: 10px solid rgb(235, 219, 80);
}

.userCard>h4 {
	color: blueviolet;
	margin-top: 1rem;
	border-bottom: 2px solid blueviolet;
	width: 75%
}

.userCard>.heart-icon {
	font-size: 1rem;
	margin-left: 0.2rem;
}

.user-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-right: 0rem;
}

.username {
	margin-top: 0.5rem;
	font-size: 10px;
	padding-right: 1rem;
}

.line1 {
	display: flex;
	margin-bottom: 1rem;
}

.line2 {
	display: flex;
	margin-bottom: 1rem;
}

.line1 .users {
	width: 3rem;
	height: 3rem;
	background-image: url(< c : url value = '${user.profileImg}'/ >);
	background-size: cover;
	border-radius: 50%;
	border: 1px solid blueviolet;
	margin-right: 1rem;
}

.line2 .users {
	width: 3rem;
	height: 3rem;
	background-image: url(< c : url value = '${user.profileImg}'/ >);
	background-size: cover;
	border-radius: 50%;
	border: 1px solid blueviolet;
	margin-right: 1rem;
}

.userCard>.confirm-btn {
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-top: 2rem;
}

.confirm-btn button {
	font-size: 15px;
	font-weight: medium;
	background-color: blueviolet;
	border: none;
	padding: 0.5rem;
	outline: none;
	border-radius: 10px;
	color: white;
	transition: background-color 0.3s ease;
}

.confirm-btn button:hover {
	background-color: violet;
}

.heart-icon.liked {
	color: red; 
	
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('.heart-icon').click(function() {
			$.ajax({
				url : 'like',
				type : 'get',
				dataType : 'json',
				data : {
					'idx' : '<c:out value="${mission.idx}"/>'
				},
				success : function(res) {
					console.log(res.select);
					console.log(res.likecount);
					if (res.select) {
						$('.heart-icon').addClass('liked');
					} else {
						$('.heart-icon').removeClass('liked');
					}
					$('#likecount').text(res.likecount);
				},
				error : function(err) {
					console.log(err);
				}
			});
		});
	});
</script>
<body>
	<div class="userCard">
		<h2>좋아요한 유저</h2>
		<h4>
			${mission.likecount}명 좋아요<span id="likecount">${mission.likecount}</span><span
				class="heart-icon">💜</span>
		</h4>
		<!-- 사용자 정보를 출력하는 반복문 -->
		<c:forEach var="user" items="${users}">
			<div class="line">
				<div class="user-container">
					<div class="users"
						style="background-image: url('<c:url value='${user.profileImg}'/>')"></div>
					<div class="username">${user.nickname}</div>
				</div>
			</div>
		</c:forEach>
		<div class="confirm-btn">
			<button>확인</button>
		</div>
	</div>
</body>
</html>
