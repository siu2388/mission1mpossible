<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MISSION 1'M POSSIBLE</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
html, body {
  height: 100%;
  background-image: url(./images/bg.jpg);
}

.w-80 {
  width: 80%;
}

.custom-form .btn {
  width: 20%;
  border-radius: 10px;
}

label {
  display: inline-block !important;
  width: auto !important;
  min-width: 60px !important;
  color: #49339A;
  font-weight: bold;
}

.custom-form {
  border: 2px solid #49339A;
  border-radius: 10px;
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
  background-image: url(./images/bg2.png);
}

.custom-text-1 {
  color: #49339A;
  font-weight: bold;
  font-size: 25px;
}

.custom-btn-reg {
  background-color: #49339A !important;
  color: #ffffff !important;
  font-weight: bold;
}

.custom-btn-cancel {
  background-color: #AAA9AD !important;
  color: #ffffff !important;
  font-weight: bold;
}

.custom-form select {
  width: 25%;
}
</style>

</head>

<body class="d-flex align-items-center py-4">
  <main class="w-100 mt-0">
    <!-- Header, Nav -->
    <jsp:include page="/header.jsp" />

    <div class="container mt-5">
      <div class="row">
        <div class="col-md-1"></div>
        <!-- 좌 프로필카드 -->
        <div class="col-md-2">profileCard</div>
        <!-- 우 todayMission 등록 폼 -->
        <div class="col-md-8 d-flex align-items-center justify-content-center custom-form">
          <form class="py-2 mx-auto w-80">
            <div class="my-3 text-center custom-text-1">오늘의 미션을 등록하세요</div>

            <div class="my-2 row d-flex align-items-center">
              <label for="category" class="col-sm-2 col-form-label text-end"></label>
              <div class="col-sm-10">
                <select class="mb-2 form-select form-select-sm" aria-label=".form-select-sm example" id="category">
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

            <div class="my-2 row">
              <label for="missionTitle"
                class="col-sm-2 col-form-label text-end">미션</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="missionTitle">
              </div>
            </div>

            <div class="mb-3 row">
              <label for="missionContent"
                class="col-sm-2 col-form-label text-end">내용</label>
              <div class="col-sm-10">
                <textarea class="form-control mb-3" id="missionContent" rows="8"></textarea>
                <div class="mb-3">
                  <input class="form-control form-control-sm" id="formFileSm" type="file">
                </div>
                <div class="mb-1 row d-flex align-items-center justify-content-center">
                  <button class="btn py-1 mt-3 mx-1 custom-btn-reg" type="button">등 록</button>
                  <button class="btn py-1 mt-3 mx-1 custom-btn-cancel" type="button">취 소</button>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-1"></div>
      </div>
    </div>
  </main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>