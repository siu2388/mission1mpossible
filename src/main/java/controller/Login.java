package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.User;
import service.MissionService;
import service.MissionServiceImpl;
import service.UserService;
import service.UserServiceImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("login.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String userId = req.getParameter("userId");
		String pwd = req.getParameter("pwd");

		try {
			UserService userService = new UserServiceImpl();
			User user = userService.login(userId, pwd);

			int userIdx = user.getIdx();

			MissionService missionService = new MissionServiceImpl();
			Integer totalMissions = missionService.selectTotalMissions(userIdx);
			Integer successRate = missionService.calculateSuccessRate(userIdx);

			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			session.setAttribute("totalMissions", totalMissions);
			session.setAttribute("successRate", successRate);

			req.getRequestDispatcher("missions.jsp").forward(req, resp);

		} catch (Exception e) {
			req.setAttribute("err", e.getMessage());
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}
	}

}
