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
<html>
<head>
<meta charset="UTF-8" />
<meta
	name="viewport"
	content="width=device-width, initial-scale=1.0"
/>
<%-- bootstrap 5 적용 --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
/>

<!--   -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"
></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
></script>
<style>
body {
		width: 70%;
		margin: 0 auto;
}

.logo-a {
		text-decoration: none;
		padding-top: 10px;
		margin-top: 10px;
		display: flex;
		justify-content: center;
}

.logo-container {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 60%;
		padding-top: 20px;
}

.logo-container>img {
		max-width: 100%;
		max-height: 100%;
}

.outer {
		height: 180px;
		margin-top: 20px;
}

.btn-container {
		display: flex;
		justify-content: space-between;
		margin-top: 10px;
}

.h-left {
		margin-left: 2rem;
}

.h-right {
		margin-right: 2rem;
}

.btn {
		background-color: #946be2;
		border-radius: 20px;
		border-color: white;
		font-weight: 600;
		color: aliceblue;
}

.btn:hover {
		background-color: #7836f3;
		color: #a684e4;
}

hr {
		margin: 0;
		border-top: 2px solid black;
		opacity: 1;
}

.nav-link {
		padding: 10px 20px;
		color: black;
}

.nav-link.active {
		background-color: #946be2 !important;
}
</style>
<script>
      //console.log(${catId});
      $(document).ready(function() {
        $(".nav-link").click(function() {
          $(".nav-link").removeClass("active")
          //console.log($(this))
          $(this).addClass("active");
        });

      });
    </script>
</head>
<body>
   <div class="outer">
      <div class="logo-container">
         <a href="missions" class="logo-a"> <img
            src="${pageContext.request.contextPath}/images/miplogo.png"
            alt="홈으로이동-프로젝트로고" width="50%" height="60%" />
         </a>
      </div>
      <div class="home-btns">
         <c:choose>
            <c:when test="${empty sessionScope.user}">
               <div class="btn-container">
                  <div class="h-left">
                     <a class="btn disabled" role="button">오늘의
                        미션🖋</a>
                  </div>
                  <div class="h-right">
                     <a href="login" class="btn" role="button">로그인</a>
                  </div>
               </div>
            </c:when>
            <c:otherwise>
               <div class="btn-container">
                  <div class="h-left">
                    <form action="check-createdAt" method="GET">
                      <button type="submit" class="btn" role="button">오늘의 미션🖋</button>
                    </form>
                  </div>
                  <div class="h-right">
                     <a href="logout" class="btn" role="button">로그아웃</a>
                  </div>
               </div>
            </c:otherwise>
         </c:choose>
      </div>
   </div>
   <hr />
   <div id="navbox">
      <ul class="nav nav-pills nav-justified" id="pills-tab" role="tablist">
         <li class="nav-item dropup-center dropup">
            <c:choose>
            <c:when test="${empty sessionScope.user}">
               <a class="nav-link disabled" href="#">MY</a>
            </c:when>
               <c:otherwise>
               <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                  href="#" role="button" aria-expanded="false">MY</a>
                  <ul class="dropdown-menu">
                     <li><a class="dropdown-item" href="update-user">&nbsp;✏ 내 정보 수정</a></li>
                     <li><a class="dropdown-item" href="my-missions">&nbsp;📔 나의 미션기록 </a></li>
                     <li><a class="dropdown-item" href="my-bookmarks">&nbsp;🏷 북마크한 미션</a></li>
                  </ul>
               </c:otherwise>
            </c:choose>
         <li class="nav-item"><a
            class="${catId == 0 ? 'nav-link active' : 'nav-link' }"
            href="missions">전체</a></li>
         <li class="nav-item"><a
            class="${catId == 1 ? 'nav-link active' : 'nav-link' }"
            href="missions-by?catId=1">건강</a></li>
         <li class="nav-item"><a
            class="${catId == 2 ? 'nav-link active' : 'nav-link' }"
            href="missions-by?catId=2">생활</a></li>
         <li class="nav-item"><a
            class="${catId == 3 ? 'nav-link active' : 'nav-link' }"
            href="missions-by?catId=3">취미</a></li>
         <li class="nav-item"><a
            class="${catId == 4 ? 'nav-link active' : 'nav-link' }"
            href="missions-by?catId=4">공부</a></li>
         <li class="nav-item"><a
            class="${catId == 5 ? 'nav-link active' : 'nav-link' }"
            href="missions-by?catId=5">기타</a></li>
      </ul>
   </div>
   <hr />
   <!-- Bootstrap JS -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
