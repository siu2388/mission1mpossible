package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class CheckDuplicateUpdate
 */
@WebServlet("/check-duplicate-update")
public class CheckDuplicateUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckDuplicateUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		String userId = request.getParameter("userId"); // 현재 로그인한 userId
    String nickname = request.getParameter("value"); // 중복 체크할 닉네임 값

    // 닉네임 중복 확인 로직
    boolean isDuplicate = false; // 초기값 설정

    // JSON 형식으로 응답을 전달
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    if (isDuplicate) {
      response.getWriter().write("{\"result\":\"duplicate\"}");
    } else {
      response.getWriter().write("{\"result\":\"not_duplicate\"}");
    }
  }
  
	private boolean isOtherNicknameDuplicate(String nickname, String userId) {
		// 중복되면 true를, 중복되지 않으면 false를 반환
		try {
			UserService userService = new UserServiceImpl();
			return userService.isOtherNicknameDuplicate(nickname, userId);
		} catch (Exception e) {
			e.printStackTrace();
			return false; // 예외 발생 시 중복되지 않았다고 가정
		}
	}

}
