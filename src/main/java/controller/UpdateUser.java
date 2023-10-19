package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			response.sendRedirect("login.jsp");
			return;
		}
		
		String userId = request.getParameter("userId");

		try {
			// UserService를 이용해 사용자 정보 조회(Id로 정보 가져오기)
			UserService userService = new UserServiceImpl();
			User user = userService.getUserById(userId);

			// 조회한 정보를 request 속성에 저장
			request.setAttribute("user", user);

			// 회원 정보 수정 페이지로 요청 포워딩
			request.getRequestDispatcher("updateUser.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "회원정보를 불러오는 데 실패했습니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  	request.setCharacterEncoding("UTF-8");
  	
  	String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

		String userId = multi.getParameter("userId");
		String nickname = multi.getParameter("nickname");
		String pwd = multi.getParameter("pwd");
		String profileImg = multi.getOriginalFileName("profileImg");

		User user = new User();
		user.setUserId(userId);
		user.setPwd(pwd);
		user.setProfileImg(profileImg);
		user.setNickname(nickname);
			
    HttpSession session = request.getSession();

		try {
			UserService userService = new UserServiceImpl();
			userService.updateUser(user);
			User updatedUser = userService.getUserById(userId);
			
			// 사용자 정보 수정 후, 업데이트된 정보를 세션에 저장
      session.setAttribute("user", updatedUser);
			
			response.sendRedirect("missions");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
  	
  }

}
