package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.BeanDBManager;
import project.JsonDBManager;
import project.beans.CommentDish;

@WebServlet("/Comment")
public class InsertComment extends HttpServlet {

	private static final long serialVersionUID = 100000L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int dishId = Integer.parseInt(request.getParameter("dishId"));
		String username = request.getParameter("username");
		String comment = request.getParameter("comment");
		
		JsonDBManager.getInstance().addComment(dishId, username, comment);
	}
}

