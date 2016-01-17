package vaadin;

import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Table;
import com.vaadin.ui.VerticalLayout;

public class CentralPanel extends HorizontalLayout {

	Mediator mediator;
	Table tableDish;
	
	public CentralPanel(Mediator mediator) {
		this.mediator = mediator;
		initPanel();
	}
	
	private void initPanel() {
		this.addStyleName("buttonPanel");
		this.setHeight("90%");
		this.setWidth("1000px");
		this.setMargin(true);
		
		this.addStyleName("centralPanel");
		
	}
}
