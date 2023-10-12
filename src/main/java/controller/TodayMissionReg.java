package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Mission;
import dto.User;
import service.MissionService;
import service.MissionServiceImpl;

/**
 * Servlet implementation class TodayMissionReg
 */
@WebServlet("/today-mission-reg")
public class TodayMissionReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TodayMissionReg() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		if (session.getAttribute("user") == null) {
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}

		req.getRequestDispatcher("todayMissionReg.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uploadPath = req.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Integer userIdx = user.getIdx();

		String title = multi.getParameter("title");
		String context = multi.getParameter("context");
		String miImg = multi.getOriginalFileName("miImg");
		Integer catId = Integer.parseInt(multi.getParameter("catId"));

		Mission mission = new Mission();
		mission.setTitle(title);
		mission.setContext(context);
		mission.setMiImg(miImg);
		mission.setCatId(catId);
		mission.setUserIdx(userIdx);

		try {
			MissionService missionService = new MissionServiceImpl();
			missionService.createTodayMission(mission);
			// missionIdx 를 얻어와야 함
			Integer idx = mission.getIdx();
			missionService.detailTodayMission(idx);

			resp.sendRedirect("mission?idx=" + idx);

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", "미션등록에 실패하였습니다. 다시 시도해주세요.");
			req.getRequestDispatcher("error.jsp").forward(req, resp);

		}

	}

}
