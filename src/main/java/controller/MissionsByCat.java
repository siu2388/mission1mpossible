package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MissionService;
import service.MissionServiceImpl;

/**
 * Servlet implementation class MissionsByCat
 */
@WebServlet("/missions-by")
public class MissionsByCat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MissionsByCat() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String page = req.getParameter("page");
		Integer catId = Integer.parseInt(req.getParameter("catId"));

		int curPage = 1; // 페이지를 안가져왔을 때 기본 1 페이지
		if (page != null) {
			curPage = Integer.parseInt(page);
		}

		try {
			MissionService missionService = new MissionServiceImpl();
			Map<String, Object> result = missionService.findhMissionsByCat(curPage, catId);
			req.setAttribute("result", result);
			req.setAttribute("catId", catId);
		
			req.getRequestDispatcher("missions.jsp").forward(req, resp);

		} catch (Exception e) {

			e.printStackTrace();
			req.setAttribute("err", e.getMessage());
			req.getRequestDispatcher("error.jsp").forward(req, resp);

		}
	}
}
