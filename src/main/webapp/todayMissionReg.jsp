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
<!-- 네브바 드랍업 작동 -->
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
<!--  sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

.profilebox {
		float: left;
}

.missionbox {
		border: 2px solid #EFD915;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
		background-image: url(./images/bg2.png);
		background-size: contain;
		width: 70%;
		float: right;
		height: 500px;
		padding: 10px;
		margin: 2rem 5rem 0 0;
}

.img-flued {
		max-width: 100%;
		height: auto;
}

.header-p {
		text-align: center;
		margin-bottom: 1rem;
}

.header {
		color: #49339A;
		font-weight: 600;
		display: block;
}

#title {
		margin-bottom: 4px;
		color: #49339A;
		font-weight: bold;
		font-size: 1.4rem;
		padding-top: 5px;
		text-align: center;
}

.row {
		display: flex;
		padding: 1rem 3rem 0 3rem;
}

.title {
		flex: 1;
		color: #49339A;
		font-weight: bold;
		float: left;
}

.input {
		flex: 5;
}

.input>input {
		width: 100%;
}

.input>textarea {
		width: 100%;
}

.button {
		padding-top: 1rem;
		text-align: center;
}
</style>

<link
	rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css"
>
<script
  src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"
></script>
<script
	src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"
></script>
</head>

<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="main">
		<!-- 좌 프로필카드 -->
		<div class="profilebox">
			<jsp:include page="profilecard.jsp" />
		</div>
		<!-- 우 todayMission 등록 폼 -->
		<div class="missionbox img-fluid">
			<form
				id="regform"
				action="today-mission-reg"
				method="post"
				enctype="multipart/form-data"
			>
				<div id="title">오늘의 미션을 등록하세요</div>
				<!-- 카테고리 -->
				<div class="row">
					<div class="title">카테고리</div>
					<div class="input">
						<select
							aria-label=".form-select-sm example"
							id="category"
							name="catId"
						>
							<!-- <option selected>카테고리</option> -->
							<option selected>카테고리</option>
							<option value="1">건강</option>
							<option value="2">생활</option>
							<option value="3">취미</option>
							<option value="4">공부</option>
							<option value="5">기타</option>
						</select>
					</div>
				</div>
				<!--  -->
				<div class="row">
					<label
						for="missionTitle"
						class="title"
					>미션</label>
					<div class="input">
						<input
							type="text"
							id="missionTitle"
							name="title"
						>
					</div>
				</div>

				<div class="row">
					<label
						for="missionContent"
						class="title"
					>내용</label>
					<div class="input">
						<textarea
							class="form-control mb-3"
							id="missionContent"
							name="context"
							rows="8"
							placeholder="미션의 구체적인 설명을 작성합니다.(최대200자)"
						></textarea>
					</div>
				</div>
				<div class="row">
					<div class="title">파일첨부</div>
					<div class="input">
						<input
							type="file"
							id="formFileSm"
							name="miImg"
							accept="image/*"
						>
					</div>
				</div>
				<div class="button">
					<input
						id="insert-btn"
						class="btn"
						type="submit"
						value="미션등록"
					>
					<a
						href="./missions"
						class="btn"
						style="background-color: limegreen"
					>목록</a>
				</div>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	></script>
	<script type="text/javascript">
	$(document).ready(function(){
	  $(function(){
		  $("#insert-btn").click(function(e) {
		    e.preventDefault();
		    Swal.fire({
		      title: '미션등록',
		      text : '한 번 등록한 미션은 삭제가 불가능합니다. ',
		      icon: 'info',
		      showCancelButton: true,
		      confirmButtonText: '등록',
		      cancelButtonText: '취소',
		    }).then((result) => {
		      if (result.isConfirmed) {
		    	  document.getElementById("regform").submit(); 
		      } else if (result.isDenied) {
		        return false;
		      }
		    })
		  })
		})
  })
</script>
</body>

</html>