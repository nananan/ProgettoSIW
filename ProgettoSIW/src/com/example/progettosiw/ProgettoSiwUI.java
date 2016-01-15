package com.example.progettosiw;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vaadin.annotations.Theme;
import com.vaadin.annotations.VaadinServletConfiguration;
import com.vaadin.server.DeploymentConfiguration;
import com.vaadin.server.ServiceException;
import com.vaadin.server.VaadinRequest;
import com.vaadin.server.VaadinResponse;
import com.vaadin.server.VaadinServlet;
import com.vaadin.server.VaadinServletService;
import com.vaadin.server.VaadinSession;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickEvent;
import com.vaadin.ui.Label;
import com.vaadin.ui.UI;
import com.vaadin.ui.VerticalLayout;

@SuppressWarnings("serial")
@Theme("progettosiw")
public class ProgettoSiwUI extends UI {

//	@WebServlet(value = { "/admin/*", "/VAADIN/*" }, asyncSupported = true)
//	@VaadinServletConfiguration(productionMode = false, ui = ProgettoSiwUI.class)
	public static class Servlet extends VaadinServlet {
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
		{
			// TODO Auto-generated method stub
			super.doPost(req, resp);
//			System.out.println(req.getParameter("id"));
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
//					final String myParam = request.getParameter("username");
//					if (myParam != null)
//					{
//						session.setAttribute("username", myParam);
//					}
				}
			};
			service.init();
			return service;
		}
	}

	@Override
	protected void init(VaadinRequest request) {
		final VerticalLayout layout = new VerticalLayout();
		layout.setMargin(true);
		setContent(layout);

		Button button = new Button("Click Me");
		button.addClickListener(new Button.ClickListener() {
			public void buttonClick(ClickEvent event) {
				layout.addComponent(new Label("Thank you for clicking"));
			}
		});
		layout.addComponent(button);
	}

}