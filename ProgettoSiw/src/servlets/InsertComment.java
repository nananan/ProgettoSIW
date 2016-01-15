package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		String data = request.getParameter("date");
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
		
		if(JsonDBManager.getInstance().addComment(dishId, username, comment, dateFormat.format(date))) {
			if (data != null) {
				try {
					DateFormat df = new SimpleDateFormat ("dd-MM-yyyy");
					df.setLenient (false);
					Date d = df.parse (data);
					String id = JsonDBManager.getInstance().getIdComment(dishId, username, comment, dateFormat.format(d));

					response.setCharacterEncoding("UTF-8");
					response.getWriter().write(id);
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
	}
}

