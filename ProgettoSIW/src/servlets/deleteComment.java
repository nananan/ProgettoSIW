package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.JsonDBManager;

@WebServlet("/deleteComment")
public class deleteComment extends HttpServlet {
	
	private static final long serialVersionUID = 100000L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		
		boolean comment = JsonDBManager.getInstance().deleteComment(commentId);
		response.setCharacterEncoding("UTF-8");
//		response.getWriter().write(comment);
	}
}