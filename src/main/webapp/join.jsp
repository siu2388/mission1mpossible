<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1"
    />
    <title>MISSION 1'M POSSIBLE</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <style>
      html,
      body {
        height: 100%;
        background-image: url(./images/bg.jpg);
      }

      .custom-form {
        border: 2px solid #49339a;
        border-radius: 10px;
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
      }

      .form-login {
        max-width: 300px;
        padding: 1rem;
      }

      .form-login .form-floating:focus-within {
        z-index: 2;
      }

      .form-login input[type='text'] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
      }

      .form-login input[type='password'] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
      }

      .custom-form .custom-btn {
        background-color: #49339a;
        color: #ffffff;
        font-weight: bold;
      }

      .custom-form .custom-btn-join {
        background-color: #49339a;
        color: #ffffff;
        font-weight: bold;
      }

      .custom-join {
        border: 2px solid #49339a;
        border-radius: 10px;
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
      }

      .user-img-default {
        width: 150px;
        height: 150px;
        border: solid 1px;
      }

      .custom-text-title {
        color: #49339a;
        font-weight: bold;
        font-size: 1.2rem;
      }

      .custom-text-title-2 {
        font-weight: bold;
        font-size: 2rem;
      }

      .custom-form .custom-btn-join {
        background-color: #49339a;
        color: #ffffff;
        font-weight: bold;
      }
    </style>
  </head>

  <body class="d-flex align-items-center py-4">
    <main class="w-100 m-auto">
      <!-- 상단 로고 -->
      <div class="container">
        <div class="row">
          <div class="col-md-3"></div>
          <div class="col-md-6">
            <img
              class="img-fluid"
              src="./images/miplogo.png"
              alt="logo"
            />
          </div>
          <div class="col-md-3"></div>
        </div>
      </div>

      <div class="container">
        <div class="row">
          <div class="col-md-2"></div>

          <!-- 좌 이미지 -->
          <div class="col-md-3">
            <img
              class="img-fluid"
              src="./images/mainImg2.png"
              alt="MainImg1"
            />
          </div>

          <!-- 중앙, 우 회원가입 폼 -->
          <div
            class="col-md-5 custom-form d-flex align-items-center justify-content-center"
          >
            <form
              class="px-1"
              action="join"
              method="post"
              enctype="multipart/form-data"
            >
              <div class="row">
                <div
                  class="col-md-5 d-flex align-items-center justify-content-center"
                  id="imgUploadBundle"
                >
                  <div class="px-4">
                    <div class="d-flex justify-content-center mb-4">
                      <img
                        src="images/defaultImg.png"
                        class="rounded-circle user-img-default"
                        id="imagePreview"
                        alt="defaultImage"
                      />
                      <!-- <img src="" class="rounded-circle user-img-default" id="imagePreview"/> -->
                    </div>
                    <div
                      class="d-flex justify-content-center mb-2 custom-text-title"
                    >
                      프로필사진
                    </div>
                    <div
                      class="d-flex justify-content-center align-items-center"
                    >
                      <div
                        class="btn w-30 custom-btn d-flex justify-content-center align-items-center"
                      >
                        <label
                          class="form-label m-0"
                          for="pofileImgUpload"
                          >선택</label
                        >
                        <input
                          type="file"
                          class="form-control d-none custom-btn"
                          id="pofileImgUpload"
                          name="profileImg"
                          accept="profile-image/*"
                          onchange="previewImg(event)"
                        />
                      </div>
                    </div>
                  </div>
                </div>

                <div
                  class="col-md-7"
                  id="joinFormBundle"
                >
                  <div class="mb-4 text-center custom-text-title-2">
                    회원가입
                  </div>
                  <div class="form-floating mb-2">
                    <input
                      type="text"
                      class="form-control-sm"
                      id="floatingInput"
                      name="userId"
                      placeholder="아이디"
                    />
                    <input
                      type="button"
                      class="btn btn-secondary btn-sm"
                      value="중복확인"
                    />
                  </div>
                  <div class="form-floating mb-2">
                    <input
                      type="text"
                      class="form-control-sm"
                      id="floatingInput"
                      name="nickname"
                      placeholder="닉네임"
                    />
                    <input
                      type="button"
                      class="btn btn-secondary btn-sm"
                      value="중복확인"
                    />
                  </div>
                  <div class="form-floating mb-2">
                    <input
                      type="password"
                      class="form-control-sm"
                      id="floatingPassword"
                      name="pwd"
                      placeholder="비밀번호"
                    />
                  </div>
                  <div class="form-floating mb-2">
                    <input
                      type="password"
                      class="form-control-sm"
                      id="floatingPasswordCheck"
                      name="pwdCheck"
                      placeholder="비밀번호확인"
                    />
                  </div>
                  <input
                    class="btn w-100 py-2 mt-3 custom-btn-join"
                    type="submit"
                    value="가입하기"
                    id="joinBtn"
                  />
                </div>
              </div>
            </form>
          </div>

          <div class="col-md-2"></div>
        </div>
      </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      // 비밀번호 일치 유효성 검사
      document
        .getElementById('joinBtn')
        .addEventListener('click', function (event) {
          let pwd = document.querySelector('input[name=pwd]').value;
          let pwdCheck = document.querySelector('input[name=pwdCheck]').value;

          if (pwd != pwdCheck) {
            alert('비밀번호가 일치하지 않습니다.');
            event.preventDefault(); // 폼 제출 막음
          }
        });

      // 회원 가입 전 프로필사진 첨부했을 때 미리보기
      function previewImg(event) {
        const imagePreview = document.getElementById('imagePreview');
        const fileInput = event.target;

        if (fileInput.files && fileInput.files[0]) {
          const reader = new FileReader();

          reader.onload = function (e) {
            imagePreview.src = e.target.result;
          };

          reader.readAsDataURL(fileInput.files[0]);
        } else {
          imagePreview.src = 'images/defaultImg.png';
        }
      }
    </script>
  </body>
</html>
