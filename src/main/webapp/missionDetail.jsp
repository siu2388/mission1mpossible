<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib
	prefix="fmt"
	uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
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

.join {
	float: left;
	margin: 20px;
	margin-top: 50px;
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

.join {
	float: left;
	margin: 20px;
	margin-top: 50px;
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
	align-items: center;
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

.missionbox {
	border: 1px solid blueviolet;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	border-radius: 10px;
	background-image: url(./images/bg3.png);
	/*background-color: antiquewhite;*/
	background-size: contain;
	width: 60%;
	/* float: right; */
	height: 500px;
	padding: 10px;
	margin: 3.5rem 5rem 0 20rem;
}

.success-background {
	border: 3px solid #87a96b;
	background-color: #faebd7;
	/* background: linear-gradient(#d0e3c4, #adc698); */
}

.fail-background {
	border: 3px solid #c50000;
	background-color: #faebd7;
}

.normal-background {
	border: 2px solid #E5D689;
	background-color: #E5D689;
}

.custom-btn {
	background-color: #4AC98C !important;
	border-color: #4AC98C !important;
	color: black !important;
	font-weight: bold;
	border-radius: 20px;
}

.custom-btn-success {
	background-color: #87a96b !important;
	color: #ffffff !important;
	font-weight: bold;
	border-radius: 10px;
}

.custom-btn-fail {
	background-color: #c50000 !important;
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
	color: #ffffff !important;
	position: relative;
}

.card .card-title {
	color: #101d42;
	font-size: 35px;
	font-weight: bold;
	background-color: #e8ccd7;
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
	background-color: #946be2;
	color: #ffffff;
	padding: 5px 10px;
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

.no-padding {
	padding: 0 !important;
}

#bookmarked {
	margin-right: 28rem;
	margin-top: 4px;
}

#likeheart {
	margin-top: 5px;
}

#likecount {
	margin-top: 12px;
}
.bookmark {
	margin: 9px 0 0 20px;
}

.likeheart {
	margin-top: 9px;
}

/* 좋아요한 유저 */
.modal-content {
	background-image: url("./images/bg2.png");
}

.btn77 {
	border: none;
	background-color: transparent;
	font-weight: bold;
}

.btn77:hover {
	background-color: transparent;
}

</style>
<!--  sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<div class="join">
					<div class="join-text">회원가입을 하시면 오늘의 미션을 등록하고, 더욱 다양한 서비스를
						이용하실 수 있습니다!</div>
					<a
						href="./join"
						class="join-button">회원가입 </a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="profilebox">
					<jsp:include page="profilecard.jsp" />
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="missionbox">
		<div class="py-2 mx-auto w-90">

			<div class="py-1 px-2 custom-currentDate-div text-center">
				<span
					id="createdAt"
					class="custom-bg">${formattedDate}</span>
				<div
					id="missionStatus"
					class="mb-2 mt-2 d-flex align-items-center justify-content-center">
					<!-- 성공/실패/진행중에따라 보여지는 값 -->
					<!-- 진행중: success가 null, createdAt이 오늘인 경우 -->
					<!-- 성공: success가 성공, createdAt == updatedAt인 경우 -->
					<!-- 실패: 기타 모든 경우 -->
					<c:set
						var="now"
						value='<%=new java.util.Date()%>' />
					<fmt:formatDate
						var="today"
						value="${now}"
						pattern="yyyy-MM-dd" />
					<c:set var="missionStatusText">
						<c:choose>
							<c:when
								test="${mission.success == null && mission.createdAt == today}">
	              진행중인 미션!
	            </c:when>
							<c:when
								test="${'성공' eq mission.success && mission.createdAt == mission.updatedAt}">
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
						<img
							class="card-img-top rounded-0 mission-img-default"
							src="${pageContext.request.contextPath}/images/defaultMission.jpg" />
					</c:if>
					<c:if test="${mission.miImg ne null}">
						<img
							class="card-img-top rounded-0 mission-img-default"
							src="image?miImg=${mission.miImg}" />
					</c:if>

					<c:if test="${mission.context ne null}">
						<div class="card-body custom-text3 transparent-background">${mission.context}</div>
					</c:if>
				</div>
				<!--  북마크 & 좋아요 -->
				<!--  북마크 -->
				<div
					class="mx-auto w-70 d-flex justify-content-center align-items-center"
				>
					<div class="container no-padding">
						<div class="row">
							<div class="col-md-0 no-padding"></div>

							<!-- 북마크 -->
							<div class="col-md-10 no-padding">
								<c:if test="${user ne Empty && user.idx ne mission.userIdx }">
									<div class="bookmark">
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
									</div>
								</c:if>
							</div>

							<!-- 하트, 좋아요한 유저 버튼 -->
							<div class="col-md-2 no-padding d-flex justify-content-end">
								<div class="likeheart">
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
								</div>

								<!-- 좋아요한 유저 버튼 -->
								<button
									type="button"
									id="likecount"
									class="btn77 modal-btn"
									data-bs-toggle="modal"
									data-bs-target="#Modal"
								>${mission.likecount}</button>
								&nbsp;&nbsp;
							</div>
						</div>
					</div>
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
					<c:if test="${user.idx eq mission.userIdx && mission.createdAt == today}">
						<div class="col-md-8 no-padding">
							<form
							  id="suc-fail-check"
								action="success-fail?idx=${mission.idx}"
								method="post"
								class="text-center">
								<input
									type="hidden"
									name="idx"
									value="${mission.idx}">
								<input
								  id="suc-btn"
									class="btn py-1 px-3 mx-2 mt-2 custom-btn-success suc-fail-btn"
									type="submit"
									name="success"
									value="성공" />
								<input
								  id="fail-btn"
									class="btn py-1 px-3 mx-2 mt-2 custom-btn-fail suc-fail-btn"
									type="submit"
									name="success"
									value="실패" />
							</form>
						</div>

						<!-- 수정 버튼 -->
						<div class="col-md-2 no-padding d-flex justify-content-end">

							<a
								href="update-mission?idx=${mission.idx}"
								class="btn py-1 px-3 mx-2 mt-2 custom-btn-update"
								type="button">수정</a>
						</div>
					</c:if>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- container (그리드 끝) -->
	</div>
	<!-- 좋아요한 유저 모달 -->
	<div
		class="modal fade"
		id="Modal"
		tabindex="-1">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable ">
			<div class="modal-content">
				<div class="modal-header">
					<h1
						class="modal-title fs-5"
						style="color: blueviolet; font-weight: bold">좋아요한 유저
						${mission.likecount}명 💜</h1>
					<button
						type="button"
						class="btn-close"
						data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div
					class="modal-body"
					style="text-align: center">
					<!-- 사용자 정보를 출력하는 반복문 -->
					<%-- <c:forEach
						items="${users}"
						var="user">
						<div class="line">
							<div class="user-container">
								<div
								  id="liker-profileImg"
									class="users"
									style="background-image: url('<c:url value='${user.profileImg}'/>')"></div>
								<div id="liker-nickname" class="username">${user.nickname}</div>
							</div>
						</div>
					</c:forEach> --%>
				</div>
				<div class="modal-footer">
					<button
						type="button"
						class="btn btn-secondary"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function() {
			const success = '${mission.success}';
			const	createdAt = '${mission.createdAt}';
			const updatedAt = '${mission.updatedAt}';
			const missionBox = $('.missionbox');
			const today = new Date().toISOString().slice(0, 10);
			
			if (success == '성공' && createdAt == updatedAt) {
				missionBox.addClass('success-background');
			} else if (success != '성공' && success != '실패' && createdAt == today) {
				// 배경색 그대로 둠
			} else {
				missionBox.addClass('fail-background');
			}
		});
		
		/* 좋아요한 유저 */
		/*
	  const myModal = document.getElementById('myModal')
	  const myInput = document.getElementById('myInput')
    myModal.addEventListener('shown.bs.modal', () => {
	    myInput.focus()
    })*/
	    
    $(function() {
    $('.modal-btn').click(function() {
      $.ajax({
        url : 'user-likers',
        type : 'get',
        dataType : 'json',
        data : {
          'idx' : '<c:out value="${mission.idx}"/>'
        },
        success : function(res) {
        	var body = $(".modal-body");
          for(user of res) {
        	  var div = `<div class="line">
                  <div class="user-container">
                  <div
                    id="liker-profileImg"
                    class="users"
                    style="background-image: url('\${user.profileImg}')"></div>
                  <div id="liker-nickname" class="username">\${user.nickname}</div>
                </div>
                </div>`;
                body.append(div);
          }
        },
        error : function(err) {
          console.log(err);
        }
      });
    });
  });
</script>
<!--  성공 / 실패 확인 모달 -->
<script type="text/javascript">
  /* $(document).ready(function(){
    $(function(){
      $("#suc-fail-check").click(function(e) {
        console.log("123");
        e.preventDefault();
        Swal.fire({
          title: '미션',
          text : '성공 or 실패는 미션을 등록한 날짜에만 수정 가능합니다! ',
          icon: 'info',
          showCancelButton: true,
          confirmButtonText: '입력',
          cancelButtonText: '취소',
        }).then((result) => {
          if (result.isConfirmed) {
            document.getElementByClassName("suc-fail-btn").submit(); 
          } else if (result.isDenied) {
            return false;
          }
        })
      })
    })
  }) */
  /* $(document).ready(function(){
      $(function(){
          $(".suc-fail-btn").click(function(e) {
              console.log("123");
              e.preventDefault();
        	  var selectedValue = $("suc-btn").val();
              var selectedValue = $("input[name='success']:checked").val(); // 선택된 input의 값을 가져옴
              var sele
              console.log(selectedValue); // 선택된 값 확인 (성공 또는 실패)
              Swal.fire({
                  title: '미션',
                  text : '성공 or 실패는 미션을 등록한 날짜에만 수정 가능합니다! ',
                  icon: 'info',
                  showCancelButton: true,
                  confirmButtonText: '입력',
                  cancelButtonText: '취소',
              }).then((result) => {
                  if (result.isConfirmed) {
                      // Assuming that the form is a sibling of the buttons
                      console.log('Form submitted');
                      //$(this).closest('form').submit(); 
                      document.getElementById("suc-fail-check").submit();
                  } else if (result.isDenied) {
                      return false;
                  }
              })
          })
      })
  }); */
</script>
</body>

</html>