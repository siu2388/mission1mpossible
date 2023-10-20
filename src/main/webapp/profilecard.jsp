<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>프로필 카드</title>
    <style>
      .card1 {
        background-color: antiquewhite;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        width: 12.5rem;
        height: 250px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        border-radius: 0.2rem;
        border: 0.5px solid blueviolet;
        margin: 3.4rem 0 0 2rem;
        padding-top: 2rem;
      }

      .profile-img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        border: 0.5px solid blueviolet;
      }

      .card1 > .name {
        text-align: center;
        color: blueviolet;
        height: 1.5rem;
      }

      .name {
        text-align: center;
        padding-top: 0.2rem;
        padding-bottom: 0.2rem; /* 필요에 따라 상단 여백 조절 */
        margin: 0;
        font-size: 18px;
        color: blueviolet;
        font-family: Arial, Helvetica, sans-serif;
      }

      .desc {
        margin-bottom: 0;
        text-align: center;
        /* width: 135px; */
        height: 170px;
      }

      .desc > .name {
        padding: 0;
        margin-top: 5px;
      }

      .desc > .star {
        margin-top: -10px;
        margin-bottom: 0;
        text-align: center;
      }

      .desc > .date {
        /*font-style : italic;  */
        padding-top: 0rem;
        margin-block-start: 0;
        margin-block-end: 0;
        padding: 0.5 rem;
      }

      .desc > .mission {
        margin-block-start: 0;
        margin-block-end: 0;
        padding: 0.3 rem;
      }

      .desc > .success {
        padding-top: 0rem;
        margin-block-start: 0;
        margin-block-end: 0;
        padding: 0.5 rem;
        color: blueviolet;
      }

      .high-success::before {
        font-size: 23px;
        font-style: bold;
        content: '★★★';
        color: blueviolet;
      }

      .medium-success::before {
        font-size: 23px;
        font-style: bold;
        content: '★★☆';
        color: blueviolet;
      }

      .low-success::before {
        font-size: 23px;
        font-style: bold;
        content: '★☆☆';
        color: blueviolet;
      }

      .no-success::before {
        font-size: 23px;
        font-style: bold;
        content: '☆☆☆';
        color: blueviolet;
      }

      .user-update-btn {
        padding: 0.05rem 0.05rem;
        background-color: blueviolet;
        color: white;
        border: none;
        border-radius: 2px;
        position: absolute;
        right: 10px;
        top: 10px;
        font-size: 4px;
        transition: background-color 0.3s ease;
      }

      button:hover {
        background-color: darkviolet;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  </head>
  <body>
    <div class="card card1">
      <div>
        <img
          src="profile-image?profileImg=${user.profileImg}"
          class="profile-img"
        />
      </div>
      <div class="desc">
        <div class="name">
          <b>${user.nickname}</b>
        </div>
        <div
          class="star ${successRate >= 90 ? 'high-success' : successRate >= 80 ? 'medium-success' : successRate >= 70 ? 'low-success' : 'no-success'}"
        ></div>
        <div class="date"><i style="font-size:10px;">Since</i> <b>${user.createdAt}</b></div>
        <div class="mission">Total <b>${totalMissions}</b>개의 미션</div>
        <div class="success">성공률: <b>${successRate} %</b></div>
      </div>
    </div>
  </body>
</html>