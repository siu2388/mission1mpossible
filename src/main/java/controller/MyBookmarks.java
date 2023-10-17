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

/**
 * Servlet implementation class MyBookmarks
 */
@WebServlet("/my-bookmarks")
public class MyBookmarks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyBookmarks() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Integer userIdx = user.getIdx();

		String page = req.getParameter("page");

		int curPage = 1; // 페이지를 안가져왔을 때 기본 1 페이지
		if (page != null) {
			curPage = Integer.parseInt(page);
		}

		try {
			MissionService missionService = new MissionServiceImpl();
			Map<String, Object> result = missionService.findMyBookmarks(curPage, userIdx);
			req.setAttribute("result", result);
			req.setAttribute("catId", -1);

			System.out.println(req.getAttribute("result"));

			req.getRequestDispatcher("missions.jsp").forward(req, resp);

		} catch (Exception e) {

			e.printStackTrace();
			req.setAttribute("err", e.getMessage());
			req.getRequestDispatcher("error.jsp").forward(req, resp);

		}
	}

}
