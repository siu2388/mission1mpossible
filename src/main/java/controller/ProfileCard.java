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

@WebServlet("/profilecard")
public class ProfileCard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProfileCard() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		try {

			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user"); // User 클래스로 캐스팅
			if (user != null) {

				int userIdx = user.getIdx();

				MissionService missionService = new MissionServiceImpl();
				Integer totalMissions = missionService.selectTotalMissions(userIdx);
				Integer successRate = missionService.calculateSuccessRate(userIdx);

				req.setAttribute("totalMissions", totalMissions);
				req.setAttribute("successRate", successRate);

			} else {

				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}

			req.getRequestDispatcher("profilecard.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", e.getMessage());
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}
	}
}
