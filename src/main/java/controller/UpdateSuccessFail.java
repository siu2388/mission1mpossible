package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Mission;
import service.MissionService;
import service.MissionServiceImpl;

/**
 * Servlet implementation class SuccessFailUpdate
 */
@WebServlet("/success-fail")
public class UpdateSuccessFail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSuccessFail() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		Integer idx = Integer.parseInt(req.getParameter("idx"));
		String success = req.getParameter("success");

		System.out.println("success: " + success);
		Mission mission = new Mission();
		mission.setIdx(idx);
		mission.setSuccess(success);

		try {
			MissionService missionService = new MissionServiceImpl();
			missionService.updateSuccessOrFail(mission);

			resp.sendRedirect("mission?idx=" + mission.getIdx());

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", "게시글수정 실패했다ㅠ");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}

	}
}
