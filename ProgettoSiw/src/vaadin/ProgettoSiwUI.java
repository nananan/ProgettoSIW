package vaadin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.BeanDBManager;
import project.beans.User;

import com.vaadin.annotations.Theme;
import com.vaadin.annotations.Title;
import com.vaadin.annotations.VaadinServletConfiguration;
import com.vaadin.server.DeploymentConfiguration;
import com.vaadin.server.Page;
import com.vaadin.server.ServiceException;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinResponse;
import com.vaadin.server.VaadinServlet;
import com.vaadin.server.VaadinServletService;
import com.vaadin.server.VaadinSession;
import com.vaadin.ui.Button;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Notification;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Notification.Type;
import com.vaadin.ui.themes.Runo;

@SuppressWarnings("serial")
@Theme("progettosiw")
@Title("Sezione Admin")
public class ProgettoSiwUI extends UI {

	private static String username;
	
	@WebServlet(value = { "/admin/*", "/VAADIN/*" }, asyncSupported = true)
	@VaadinServletConfiguration(productionMode = false, ui = ProgettoSiwUI.class)
	public static class Servlet extends VaadinServlet {
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{
			super.doPost(req, resp);
		}

		@Override
		protected VaadinServletService createServletService(DeploymentConfiguration deploymentConfiguration) throws ServiceException
		{
			VaadinServletService service = new VaadinServletService(this, deploymentConfiguration)
			{

				@Override
				public void requestEnd(VaadinRequest request, VaadinResponse response, VaadinSession session)
				{
					super.requestEnd(request, response, session);
					final String myParam = request.getParameter("username");
					if (myParam != null) {
						session.setAttribute("username", myParam);
						username = myParam;
					}
				}
			};
			service.init();
			return service;
		}
	}

	@Override
	protected void init(VaadinRequest request) {
		final HorizontalLayout layout = new HorizontalLayout();
		layout.setMargin(true);
		layout.setWidth("100%");
		layout.setHeight("100%");
		setContent(layout);
		
		layout.addStyleName("firstPane");
		
		Object myParam = getSession().getAttribute("username");
		User user = null;
		if (myParam != null)
			user = BeanDBManager.getInstance().getUser((String) myParam);

		if (user != null && user.getAdmin().equals("true"))
			layout.addComponent(new Mediator().getPanel());
		else {
			Notification notification = new Notification("Non hai i permessi per accedere alla sezione Admin", Type.WARNING_MESSAGE);
			notification.show(Page.getCurrent());
		}
	}

}