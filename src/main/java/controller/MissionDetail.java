package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

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

/**
 * Servlet implementation class MyToday
 */
@WebServlet("/mission")
public class MissionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MissionDetail() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		Integer idx = Integer.parseInt(req.getParameter("idx"));

		try {
			MissionService missionService = new MissionServiceImpl();
			Mission mission = missionService.detailTodayMission(idx);
			req.setAttribute("mission", mission);

			// 날짜형식 변경
			Date dateFromDatabase = mission.getCreatedAt();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E)");
			String formattedDate = sdf.format(dateFromDatabase);
			req.setAttribute("formattedDate", formattedDate);
			// end:날짜형식변경

			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");

			if (user != null) {
				Boolean isLiked = missionService.isMissionLiked(idx, user.getIdx());
				Boolean isBookmarked = missionService.isBookmarked(idx, user.getIdx());
				System.out.println("isLiked:" + isLiked);
				req.setAttribute("bselected", isBookmarked);
				req.setAttribute("selected", isLiked);
			}

			req.getRequestDispatcher("missionDetail.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", "오늘의 미션 상세조회 실패");
			req.getRequestDispatcher("error.jsp").forward(req, resp);

		}
	}

}
