<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>MISSION 1'M POSSIBLE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<style>
@font-face {
    font-family: 'NPSfontBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/NPSfontBold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
html, body {
  font-family: 'NPSfontBold', sans-serif !important;
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

.custom-form .custom-btn-update {
  background-color: #49339a;
  color: #ffffff;
  font-weight: bold;
  width: 47%;
}

.custom-form .custom-btn-cancel {
  background-color: #AAA9AD;
  color: #ffffff;
  font-weight: bold;
  width: 47%;
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

</style>
</head>

<body class="d-flex align-items-center py-4">
  <main class="w-100 m-auto">
    <!-- 상단 로고 -->
    <div class="container">
      <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
          <img class="img-fluid" src="./images/miplogo.png" alt="logo" />
        </div>
        <div class="col-md-3"></div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-2"></div>

        <!-- 좌 이미지 -->
        <div class="col-md-3">
          <img class="img-fluid" src="./images/mainImg2.png" alt="MainImg1" />
        </div>

        <!-- 중앙, 우 회원수정 폼 -->
        <div class="col-md-5 custom-form d-flex align-items-center justify-content-center">
          <form class="px-1" action="update-user?userId=${user.userId}" method="post" enctype="multipart/form-data">
            <div class="row">
              <div class="col-md-5 d-flex align-items-center justify-content-center" id="imgUploadBundle">
                <div class="px-4">
                  <div class="d-flex justify-content-center mb-4">
                    <img src="${pageContext.request.contextPath}/upload/${user.profileImg}" class="rounded-circle user-img-default" id="imagePreview" alt="defaultImage" />
                  </div>
                  <div class="d-flex justify-content-center mb-2 custom-text-title">프로필사진</div>
                  <div class="d-flex justify-content-center align-items-center">
                    <div class="btn w-30 custom-btn d-flex justify-content-center align-items-center">
                      <label class="form-label m-0" for="pofileImgUpload">선택</label>
                      <input type="file" class="form-control d-none custom-btn" id="pofileImgUpload" name="profileImg"
                        accept="profile-image/*" onchange="previewImg(event)" />
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-7" id="joinFormBundle">
                <div class="mb-4 text-center custom-text-title-2">회원정보수정</div>
                <div class="form-floating mb-2">
                  <input type="text" class="form-control-sm" id="floatingInput" name="nickname" placeholder="닉네임(최대 7글자)" value="${user.nickname}" />
                  <input type="button" class="btn btn-secondary btn-sm" value="중복확인" onclick="checkDuplicate('nickname')"/>
                </div>
                <div class="form-floating mb-2">
                  <input type="password" class="form-control-sm" id="floatingPassword" name="pwd" placeholder="비밀번호" />
                </div>
                <div class="form-floating mb-2">
                  <input type="password" class="form-control-sm" id="floatingPasswordCheck" name="pwdCheck" placeholder="비밀번호확인" />
                </div>
                <div class="d-flex justify-content-between">
	                <input class="btn py-2 mt-3 custom-btn-update" type="submit" value="수정하기" id="updateBtn" />
	                <a href="missions" class="btn py-2 mt-3 custom-btn-cancel" type="button">취소</a>
	               </div>
              </div>
            </div>
          </form>
        </div>

        <div class="col-md-2"></div>
      </div>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
  <script>
    let nicknameChecked = false;
    
    document.getElementById('updateBtn').addEventListener('click', function(event) {
      let nickname = document.querySelector('input[name=nickname]').value;
      let pwd = document.querySelector('input[name=pwd]').value;
      let pwdCheck = document.querySelector('input[name=pwdCheck]').value;

 			// 닉네임 입력 확인
      if (nickname.trim() === '') {
        swal('', '닉네임을 입력해주세요.', 'error')
        event.preventDefault();
        return;
      }
      
      // 비밀번호 입력 확인
      if (pwd.trim() === '') {
        swal('', '비밀번호를 입력해주세요.', 'error')
        event.preventDefault();
        return;
      }

      // 비밀번호확인 입력 확인
      if (pwdCheck.trim() === '') {
        swal('', '비밀번호를 한 번 더 입력해주세요.', 'error')
        event.preventDefault();
        return;
      }
      
      // 비밀번호 일치 유효성 검사
      if (pwd != pwdCheck) {
        swal('', '비밀번호가 일치하지 않습니다.', 'error')
        event.preventDefault();
      }
      
      // 닉네임 중복 확인이 체크되지 않았으면
      if (!nicknameChecked) {
        swal('', '닉네임 중복확인을 해주세요.', 'error');
        event.preventDefault();
        return;
      }
    });
    
    // 프로필사진 첨부했을 때 미리보기
    function previewImg(event) {
      const imagePreview = document.getElementById('imagePreview');
      const fileInput = event.target;

      if (fileInput.files && fileInput.files[0]) {
        const reader = new FileReader();

        reader.onload = function(e) {
          imagePreview.src = e.target.result;
        };

        reader.readAsDataURL(fileInput.files[0]);
      } else {
        imagePreview.src = '${pageContext.request.contextPath}/images/defaultImg.png';
      }
    }
    
 		// 중복체크 함수
    function checkDuplicate(type) {
      let value = document.querySelector('input[name=nickname]').value;

      // AJAX 요청 보내기
      let xhr = new XMLHttpRequest();
      xhr.open('POST', 'check-duplicate-update', true); // 서블릿 URL
      xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          // 서버 응답을 확인하여 중복 여부를 처리
          if (xhr.responseText === '{"result":"duplicate"}') {
            swal('', '이미 사용중인 닉네임입니다.', 'error');
          } else {
            swal('', '사용 가능한 닉네임입니다.', 'success');
            nicknameChecked = true;
          }
        }
      }
      xhr.send('value=' + value);
    }
  </script>
</body>
</html>