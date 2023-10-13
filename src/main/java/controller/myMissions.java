package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Mission;
import dto.User;
import service.MissionService;
import service.MissionServiceImpl;

@WebServlet("/my-missions")
public class myMissions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public myMissions() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		try {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			Integer userIdx = user.getIdx();

			MissionService missionService = new MissionServiceImpl();
			List<Mission> missions = missionService.findMyMissions(userIdx);
			req.setAttribute("missions", missions);
			System.out.println(missions);

			req.getRequestDispatcher("myMissions.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", "나의 미션기록 조회 실패");
			req.getRequestDispatcher("error.jsp").forward(req, resp);

		}
	}

}