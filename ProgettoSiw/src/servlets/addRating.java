package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ws.axis2.UseServiceClient;

import project.JsonDBManager;

@WebServlet("/addRating")
public class addRating extends HttpServlet {
	
	private static final long serialVersionUID = 100000L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if (request.getParameter("dishId") != null) {
			int dishId = Integer.parseInt(request.getParameter("dishId"));
			String username = request.getParameter("username");
			float rating = Float.parseFloat(request.getParameter("rating"));
			
			if (rating > 0) {
				boolean isInsertWithSuccess = JsonDBManager.getInstance().addRating(dishId, username, rating);
				if (isInsertWithSuccess) {
					ArrayList<Float> arrayValue = JsonDBManager.getInstance().getRatingForDish(dishId);
					
					if (!arrayValue.isEmpty()) {
						UseServiceClient serviceAVG = new UseServiceClient();
						float value = serviceAVG.calculateAVG(arrayValue);
						
						if (value != -1)
							JsonDBManager.getInstance().addRatingDish(dishId, value);
					}
				}
			}
		}
	}
}
