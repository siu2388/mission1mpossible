package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.User;
import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class Join
 */
@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Join() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("join.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uploadPath = req.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());

		String userId = multi.getParameter("userId");
		String nickname = multi.getParameter("nickname");
		String pwd = multi.getParameter("pwd");
		String profileImg = multi.getOriginalFileName("profileImg");

		User user = new User();
		user.setUserId(userId);
		user.setPwd(pwd);
		user.setProfileImg(profileImg);
		user.setNickname(nickname);

		try {
			UserService userService = new UserServiceImpl();
			userService.joinUser(user);

			req.getRequestDispatcher("login.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", e.getMessage());
			req.getRequestDispatcher("error.jsp").forward(req, resp);

		}

	}
}
