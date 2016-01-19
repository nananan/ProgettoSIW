package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/filePath")
public class getFilePath extends HttpServlet {
	
	private static final long serialVersionUID = 100000L;
	private String filePath;
	private static getFilePath instance;
	
	public static getFilePath getInstance() {
		if (instance == null)
			instance = new getFilePath();
		return instance;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(filePath);
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public String getFile() {
		return filePath;
	}
}

