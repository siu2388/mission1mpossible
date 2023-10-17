<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/e4855e3cf5.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
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
		width: 200px;
		height: 200px;
		text-align: center;
		cursor: pointer;		
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
    <c:forEach items="${missions}" var="mission">
      <div class="col col77">
      
          <div class='${mission.success eq "성공"? "card card77 bg-success bg-opacity-75":"card card77 bg-danger bg-opacity-75"}' href="missions" role="button">
            <div>
            <c:choose>
              <c:when test="${mission.miImg ne null}">
                <img src="image?miImg=${mission.miImg}" class="mission-img" style="width:198px; height:200px;"/>
              </c:when>
            <c:otherwise>
              <img src="./images/defaultMissionBears.jpg" class="mission-img"/>
            </c:otherwise>
            </c:choose>
          </div>
            <div class="card-header">
              ${mission.createdAt}
            </div>
            <div class="card-body">
              <h5 class="card-title">
                              
                    <a href="mission?idx=${mission.idx}" style="text-decoration: none; color: white" class="stretched-link">
                    <br>${mission.title }
                    </a>
                    <br>
                    <br>
              </h5>
            </div>
            <div class="card-footer">
              <div class="like">
                ${mission.likecount} <i class="fa-solid fa-heart"></i>
            </div>
            </div>
          </div>
          
        <script>
      </script>
      </div>
    </c:forEach>
  </div>
</main>

</body>

</html>