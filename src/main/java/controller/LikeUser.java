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
 * Servlet implementation class LikeUser
 */
@WebServlet(name = "like", urlPatterns = { "/like" })
public class LikeUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LikeUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		Integer missionIdx = Integer.parseInt(request.getParameter("missionIdx"));
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("idx");

		if (user == null) {

			response.getWriter().print("로그인 하세요!!");
		}

		try {
			MissionService missionService = new MissionServiceImpl();
			String res = missionService.missionLike(user.getIdx(), missionIdx);
			response.getWriter().print(res);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			response.getWriter().print("에러가 났어요!!");
		}

	}

}
