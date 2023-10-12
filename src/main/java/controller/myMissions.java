package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Mission;
import service.MissionService;
import service.MissionServiceImpl;

/**
 * Servlet implementation class myMissions
 */
@WebServlet("/my-missions")
public class myMissions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public myMissions() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		Integer userIdx = Integer.parseInt(req.getParameter("userIdx"));

		try {
			MissionService missionService = new MissionServiceImpl();
			List<Mission> missions = missionService.findMyMissions(userIdx);

			if (!missions.isEmpty()) {
				Mission mission = missions.get(0);
				Date dateFromDatabase = mission.getCreatedAt();

				SimpleDateFormat sdf = new SimpleDateFormat("MM.dd");
				String formattedDate = sdf.format(dateFromDatabase);

				req.setAttribute("mission", missions);
				req.setAttribute("formattedDate", formattedDate);
				req.getRequestDispatcher("myMissions.jsp").forward(req, resp);
			} else {
				req.setAttribute("err", "미션 목록이 비어 있습니다.");
				req.getRequestDispatcher("error.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", "나의 미션기록 조회 실패");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}
	}

}

//  예전 것 백업
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	req.setCharacterEncoding("utf-8");
//
//	Integer userIdx = Integer.parseInt(req.getParameter("userIdx"));
//
//	try {
//		MissionService missionService = new MissionServiceImpl();
//		List<Mission> mission = missionService.findMyMissions(userIdx);
//		req.setAttribute("mission", mission);
//
//		// 날짜 형식 변경
//		Date dateFromDatabase = mission.getCreatedAt();
//		SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
//		String formattedDate = sdf.format(dateFromDatabase);
//		req.setAttribute("formattedDate", formattedDate);
//
//		req.getRequestDispatcher("myMissions.jsp").forward(req, resp);
//
//	} catch (Exception e) {
//		e.printStackTrace();
//		req.setAttribute("err", "나의 미션기록 조회 실패");
//		req.getRequestDispatcher("error.jsp").forward(req, resp);
//
//	}
//}
