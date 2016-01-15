package vaadin;

import com.vaadin.shared.ui.label.ContentMode;
import com.vaadin.ui.Label;
import com.vaadin.ui.VerticalLayout;

@SuppressWarnings("serial")
public class ButtonPanel extends VerticalLayout {
	
	public ButtonPanel() {
		initPanel();
	}

	private void initPanel() {
		
		this.addStyleName("buttonPanel");
		this.setHeight("90%");
		this.setWidth("250px");
		this.setMargin(true);
		
		Label dish = new Label("Piatti");
		dish.addStyleName("dishLabel");
		this.addComponent(dish);
		
		Label modifyDish = new Label("Modifica");
		modifyDish.addStyleName("buttonModifyDish");
		this.addComponent(modifyDish);
		
		Label removeDish = new Label("Rimuovi ");
		removeDish.addStyleName("buttonRemoveDish");
		this.addComponent(removeDish);
		
		Label user = new Label("Utenti");
		user.addStyleName("userLabel");
		this.addComponent(user);
		
		Label modifyUser = new Label("Modifica");
		modifyUser.addStyleName("buttonModifyDish");
		this.addComponent(modifyUser);
		
		Label removeUser = new Label("Rimuovi ");
		removeUser.addStyleName("buttonRemoveDish");
		this.addComponent(removeUser);
		
		Label comment = new Label("Commenti");
		comment.addStyleName("userLabel");
		this.addComponent(comment);
		
		Label removeComment = new Label("Rimuovi");
		removeComment.addStyleName("buttonRemoveDish");
		this.addComponent(removeComment);
		
		this.addComponent(new Label("<h3 style='cursor:pointer;'>Sezione Utente</h3>", ContentMode.HTML));
		
	}
	
}
