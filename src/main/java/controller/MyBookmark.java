package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Bookmark;
import dto.Mission;
import dto.User;
import service.MissionService;
import service.MissionServiceImpl;

@WebServlet(name = "mybookmark", urlPatterns = { "/mybookmark" })
public class MyBookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyBookmark() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		try {
			// 세션에서 사용자 정보 가져오기
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			Integer userIdx = user.getIdx();

			// 북마크 추가 메서드 호출 (Service 레이어에서 비즈니스 로직을 처리하도록 함)
			MissionService missionService = new MissionServiceImpl();

			List<Bookmark> bookmarks = missionService.getBookmark(userIdx);
			request.setAttribute("bookmarks", bookmarks);
			System.out.println("북마크 : " + bookmarks);

			request.getRequestDispatcher("mybookmark.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			// 오류 메시지 설정
			request.setAttribute("err", "북마크 불러오기에 실패하였습니다. 나중에 다시 시도해주세요.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
