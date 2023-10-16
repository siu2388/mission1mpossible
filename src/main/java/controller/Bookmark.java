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

/**
 * Servlet implementation class Bookmark
 */
@WebServlet("/bookmark")
public class Bookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Bookmark() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 좋아요 빈하트에서 풅하트로 변경시켜주는 컨트롤러
		req.setCharacterEncoding("utf-8");

		Integer idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("쿼리에서 받는 idx: " + idx);
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		try {
			MissionService missionService = new MissionServiceImpl();

			String result = missionService.aboutBookmark(idx, user.getIdx());
			System.out.println("컨트롤러result:" + result);
			resp.getWriter().print(result);

		} catch (Exception e) {
			// TODO: handle exceptiono
			e.printStackTrace();
			resp.getWriter().print("error!");
		}
	}

}
