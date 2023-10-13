package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageView
 */
@WebServlet("/image")
public class ImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageView() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 미션이미지 보여주기
		String fileName = req.getParameter("miImg");
		String filePath = req.getServletContext().getRealPath("upload") + "\\" + fileName;

		FileInputStream fis = new FileInputStream(filePath);
		OutputStream out = resp.getOutputStream();

		byte[] buff = new byte[1024];
		int len = 0;
		while ((len = fis.read(buff)) > 0) {
			out.write(buff, 0, len);
		}
		fis.close();
		out.close();
	}

}
