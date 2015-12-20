package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.BeanDBManager;
import project.JsonDBManager;
import project.beans.User;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		User user = new User(request.getParameter("email"), request.getParameter("password"), request.getParameter("username"), "", "");

		BeanDBManager.getInstance().saveUser(user);

		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		response.setCharacterEncoding("UTF-8");

	}
}
