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

			// 북마크 추가 메서드 호출 (Service 레이어에서 비즈니스 로직을 처리하도록 함)
			MissionService missionService = new MissionServiceImpl();

			List<Bookmark> bookmarks = missionService.getBookmark(user.getIdx());
			request.setAttribute("bookmarks", bookmarks);
			
			System.out.println("----성공-----");

			request.getRequestDispatcher("mybookmark.jsp").forward(request, response);
			
			

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: 사용자에게 적절한 오류 메시지를 보여주도록 수정하세요
			request.setAttribute("err", "나의 북마크 조회 실패");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}
