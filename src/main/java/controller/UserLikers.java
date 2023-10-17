package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.User;
import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class UserLikers
 */
@WebServlet("/user-likers")
public class UserLikers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLikers() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		Integer missionIdx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("쿼리 idx: " + missionIdx);

		try {
			UserService userService = new UserServiceImpl();
			List<User> userLikers = userService.findMissionLikeUser(missionIdx);

			req.setAttribute("users", userLikers);
			System.out.println("userLikers" + userLikers);

		} catch (Exception e) {
			// TODO: handle exceptiono
			e.printStackTrace();
			resp.getWriter().print("error!");
		}
	}
}
