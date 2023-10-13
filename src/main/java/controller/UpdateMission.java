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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.Mission;
import service.MissionService;
import service.MissionServiceImpl;

/**
 * Servlet implementation class MissionUpdate
 */
@WebServlet("/update-mission")
public class UpdateMission extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateMission() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 미션 글 번호로 상세정보 가져와서 클라에 넘겨줌
		req.setCharacterEncoding("utf-8");

		HttpSession session = req.getSession();
		if (session.getAttribute("user") == null) {
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}

		Integer idx = Integer.parseInt(req.getParameter("idx"));

		try {
			MissionService missionService = new MissionServiceImpl();
			Mission mission = missionService.detailTodayMission(idx);
			req.setAttribute("mission", mission);
			// 날짜형식 변경
			Date dateFromDatabase = mission.getCreatedAt();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
			String formattedDate = sdf.format(dateFromDatabase);
			req.setAttribute("formattedDate", formattedDate);
			// end:날짜형식변경

			req.getRequestDispatcher("updateMission.jsp").forward(req, resp);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			req.setAttribute("err", "미션수정 실패했다ㅠ");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String uploadPath = req.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(req, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());

		Integer idx = Integer.parseInt(multi.getParameter("idx"));
		String context = multi.getParameter("context");
		String miImg = multi.getOriginalFileName("miImg");

		Mission mission = new Mission();
		mission.setIdx(idx);
		mission.setContext(context);
		mission.setMiImg(miImg);

		try {
			MissionService missionService = new MissionServiceImpl();
			missionService.modifyTodayMission(mission);

			resp.sendRedirect("mission?idx=" + mission.getIdx());

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("err", e.getMessage());
			req.getRequestDispatcher("errror.jsp").forward(req, resp);
		}

	}
}
