package vaadin;

import com.vaadin.ui.VerticalLayout;

public class CentralPanel extends VerticalLayout {

	public CentralPanel() {
		initPanel();
	}
	
	private void initPanel() {
		this.addStyleName("buttonPanel");
		this.setHeight("90%");
		this.setWidth("950px");
		this.setMargin(true);
		
		this.addStyleName("centralPanel");
	}
}
