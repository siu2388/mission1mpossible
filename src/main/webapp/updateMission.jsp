<%@ page
  language="java"
  contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib
  prefix="c"
  uri="http://java.sun.com/jsp/jstl/core"%>

<!--<%@ page import="service.MissionService" %> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- bootstrap 5 적용 --%>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
  crossorigin="anonymous">

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

.missionbox {
  border: 2px solid #EFD915;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
  background-image: url(./images/bg2.png);
  background-size: contain;
  width: 70%;
  height: 500px;
  float: right;
  padding: 10px;
  margin: 2rem 5rem 0 0;
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
  font-weight: bold;
  font-size: 1.3rem;
  padding-top: 5px;
}

#createdAt {
  display: inline-block;
  border: 2px solid #49339A;
  border-radius: 20px;
  border: 2px solid #49339A;
  padding: 2px 4px;
}

.header>input {
  display: block;
}

.row {
  display: flex;
  padding: 1rem 3rem 0 3rem;
}

.title {
  flex: 1;
  color: #49339A;
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

input[type='file'] {
  font-weight: bold;
  background-color: #946BE2;
}

.button {
  padding-top: 1rem;
  text-align: center;
}
</style>
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
    <!-- 우 todayMission 수정 폼 -->
    <div class="missionbox img-fluid">
      <form
        method="post"
        action="update-mission?missionIdx=${mission.idx}"
        enctype="multipart/form-data">
        <input
          type="hidden"
          name="idx"
          value="${mission.idx }" />

        <div class="header-p">
          <div class="header">
            <div id="title">${mission.title }</div>
            <div id="createdAt">${formattedDate}에작성한미션입니다.</div>
          </div>
        </div>
        <div
          class="contents"
          id="result">
          <div class="row">
            <div class="title">카테고리</div>
            <div class="input">
              <input
                type="text"
                name="cat"
                id="cat"
                disabled
                value="${mission.catName}">
              <!--  join 해서 변환후 가져와야하는 부분 : 체크필요 -->
            </div>
          </div>
          <div class="row">
            <div class="title">미션내용</div>
            <div class="input">
              <textarea
                name="context"
                id="context"
                rows="8"
                placeholder="등록된 미션 상세내용이 없습니다.">${mission.context}</textarea>
            </div>
          </div>
          <div class="row">
            <div class="input">
              <input
                type="file"
                name="miImg"
                id="miImg"
                accept="image/*">
            </div>
          </div>
        </div>
        <div class=button>
          <!-- 버튼 배치를 위한 그리드 -->
          <div class="container no-padding">
            <div class="row">
              <!-- 왼쪽 공백 -->
              <div class="col-md-2 no-padding"></div>

              <!--수정완료 / 취소  버튼 -->

              <div class="col-md-8 no-padding">

                <input
                  class="btn py-1 px-3 mx-2 mt-2 custom-btn-success"
                  type="submit"
                  value="수정완료" />
                <a
                  href="./missions"
                  class="btn py-1 px-3 mx-2 mt-2 custom-btn-cancel">목록</a>
              </div>
            </div>
          </div>
        </div>
      </form>

      <!-- Bootstrap JS -->
      <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    </div>
  </div>
</body>
</html>
