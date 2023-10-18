package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println("----------------나의미션리스트서블릿호출");

		try {
			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("user");
			Integer userIdx = user.getIdx();
			
			String page = req.getParameter("page");

			int curPage = 1; // 페이지를 안가져왔을 때 기본 1 페이지
			if (page != null) {
				curPage = Integer.parseInt(page);
			}

			MissionService missionService = new MissionServiceImpl();
			Map<String, Object> result = missionService.findMyMissions(curPage, userIdx);
			req.setAttribute("result", result);
			
			System.out.println("------mymission.java 콘트롤러: " + req.getAttribute("result"));

			req.getRequestDispatcher("myMissions.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", "나의 미션기록 조회 실패");
			req.getRequestDispatcher("error.jsp").forward(req, resp);

		}
	}
}
