package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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
 * Servlet implementation class CheckCreatedAt
 */
@WebServlet("/check-createdAt")
public class CheckCreatedAt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCreatedAt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 로그인한 유저의 idx를 userIdx로 저장
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		User user = (User) session.getAttribute("user");
		Integer userIdx = user.getIdx();
        
    try {
	    MissionService missionService = new MissionServiceImpl();
	    
	    Mission todayMission = missionService.getMissionRegToday(userIdx);
	    if (todayMission == null) {
	    	response.sendRedirect("today-mission-reg");
	    }
	
	    response.sendRedirect("mission?idx=" + todayMission.getIdx());
    } catch (Exception e) {
      e.printStackTrace();
    }
	}

}
