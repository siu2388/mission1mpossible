package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class IdCheckDuplicate
 */
@WebServlet("/check-duplicate")
public class CheckDuplicate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CheckDuplicate() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      String type = request.getParameter("type"); // "userId" 또는 "nickname" 값을 받음
      String value = request.getParameter("value"); // 중복 체크할 값 (아이디 또는 닉네임)

      // 아이디 중복 확인 로직
      boolean isDuplicate = false; // 초기값 설정
      
      // id 인지 nickname인지 확인
      if ("userId".equals(type)) {
        isDuplicate = isUserIdDuplicate(value);
		  } else if ("nickname".equals(type)) {
		    isDuplicate = isNicknameDuplicate(value);
		  }

      // JSON 형식으로 응답을 전달
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");

      if (isDuplicate) {
        response.getWriter().write("{\"result\":\"duplicate\"}");
      } else {
        response.getWriter().write("{\"result\":\"not_duplicate\"}");
      }
    }

		private boolean isUserIdDuplicate(String userId) {
			// 중복되면 true를, 중복되지 않으면 false를 반환
			try {
				UserService userService = new UserServiceImpl();
				// userService를 사용하여 DB 조회하고 아이디 중복확인
				return userService.isUserIdDuplicate(userId);
			} catch (Exception e) {
				e.printStackTrace();
				return false; // 예외 발생 시 중복되지 않았다고 가정
			}
		}
    
		private boolean isNicknameDuplicate(String nickname) {
			// 중복되면 true를, 중복되지 않으면 false를 반환
			try {
				UserService userService = new UserServiceImpl();
				// userService를 사용하여 DB 조회하고 닉네임 중복확인
				return userService.isNicknameDuplicate(nickname);
			} catch (Exception e) {
				e.printStackTrace();
				return false; // 예외 발생 시 중복되지 않았다고 가정
			}
		}
}
