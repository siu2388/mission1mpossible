package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dto.User;
import service.MissionService;
import service.MissionServiceImpl;

/**
 * Servlet implementation class UserLikers
 */
@WebServlet("/user-likers")
public class UserLikers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLikers() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		Integer missionIdx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("쿼리 idx: " + missionIdx);

		try {
			MissionService missionService = new MissionServiceImpl();
			List<User> userLikers = missionService.findMissionLikeUser(missionIdx);
			JSONArray jsonArray = new JSONArray();
			for (User user : userLikers) {
				JSONObject ouser = new JSONObject();
				ouser.put("profileImg", user.getProfileImg());
				ouser.put("nickname", user.getNickname());
				jsonArray.add(ouser);
			}
			// JSONObject totObj = new JSONObject();

			// req.setAttribute("users", userLikers);
			// System.out.println("userLikers:" + userLikers);
			resp.setCharacterEncoding("utf-8");
			resp.getWriter().print(jsonArray.toJSONString());
		} catch (Exception e) {
			// TODO: handle exceptiono
			e.printStackTrace();
			resp.getWriter().print("error!");
		}
	}
}
