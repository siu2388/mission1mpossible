package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.User;
import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/update-user")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
  @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 세션을 사용하여 사용자 로그인 여부 확인
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp"); // 로그인 페이지로 리디렉션
			return;
		}
		
		// 사용자 아이디를 세션에서 얻기 (또는 request.getParameter()를 통해 받아올 수도 있음)
		User user = (User) session.getAttribute("user");

		try {
			// UserService를 이용해 사용자 정보 조회
			UserService userService = new UserServiceImpl();
			User updatedUser = userService.getUserById(user.getUserId());

			// 조회한 정보를 request 속성에 저장
			request.setAttribute("user", updatedUser);

			// 회원 정보 수정 페이지로 포워딩
			request.getRequestDispatcher("updateUser.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "실패했습니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	request.setCharacterEncoding("UTF-8");
  	
  	
  }

}
