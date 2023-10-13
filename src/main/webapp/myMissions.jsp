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
}

.col77 {
		margin-bottom: 25px;
}

.card77 {
		width: 130px;
		height: 250px;
		text-align: center;
		cursor: pointer;		
}

.card77:hover {
		transform: translateY(-20px);
		transition: 0.5s ease-in-out;
		cursor: pointer;
		background-color: ivory;
}

.card-title {
		font-size: 20px;
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
  <div class="profile">
    <jsp:include page="profilecard.jsp" />
  </div>
  <div class="row row-cols-7 g-4">
    <c:forEach items="${missions}" var="mission">
      <div class="col col77">
        <div class="card card77">
          <div class="card bg-success bg-opacity-75 border-dark">
            <div class="card-header bg-transparent border-dark">
              <c:choose>
                <c:when test="${mission.createdAt ne null}">
                  ${mission.createdAt}
                </c:when>
                <c:otherwise>
                  -
                </c:otherwise>
              </c:choose>
            </div>
            <div class="card-body text-success">
              <h5 class="card-title">
                <c:choose>
                  <c:when test="${mission.title ne null}">
                    <br>${mission.title}
                    <br>
                  </c:when>
                  <c:otherwise>
                  
                    <br>미션없음
                    <br>
                    <br>
                  </c:otherwise>
                </c:choose>
              </h5>
            </div>
            <div class="card-footer bg-transparent border-dark">
              <div class="like">
                <c:choose>
                  <c:when test="${mission.likecount ne null}">
                    ${mission.likecount} <i class="fa-solid fa-heart"></i>
                  </c:when>
                  <c:otherwise>
                    -
                    <br>
                    <br>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"
	></script>
</body>

</html>