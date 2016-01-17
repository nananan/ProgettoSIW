package vaadin;

import com.vaadin.shared.ui.label.ContentMode;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.Label;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Button.ClickEvent;

@SuppressWarnings("serial")
public class ButtonPanel extends VerticalLayout {
	
	Mediator mediator;
	private Button modifyDish;
	private Button removeDish;
	private Button modifyUser;
	private Button removeUser;
	private Button removeComment;
	private Button menu;
	
	public ButtonPanel(Mediator mediator) {
		this.mediator = mediator;
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
		
		menu = new Button("Menu");
		menu.addStyleName("buttonOfPanel");
		this.addComponent(menu);
		
		menu.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				mediator.insertChooseMenu();
				menu.setEnabled(false);
			}
		});
		
		modifyDish = new Button("Modifica");
		modifyDish.addStyleName("buttonOfPanel");
		this.addComponent(modifyDish);
		
		modifyDish.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				mediator.insertModifyTable();
				modifyDish.setEnabled(false);
			}
		});
		
		removeDish = new Button("Rimuovi");
		removeDish.addStyleName("buttonOfPanel");
		this.addComponent(removeDish);
		
		removeDish.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				mediator.insertDeleteTable();
				removeDish.setEnabled(false);
			}
		});
		
		Label user = new Label("Utenti");
		user.addStyleName("userLabel");
		this.addComponent(user);
		
		modifyUser = new Button("Modifica");
		modifyUser.addStyleName("buttonOfPanel");
		this.addComponent(modifyUser);
		
		modifyUser.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				mediator.insertModifyUserTable();
				modifyUser.setEnabled(false);
			}
		});
		
		removeUser = new Button("Rimuovi ");
		removeUser.addStyleName("buttonOfPanel");
		this.addComponent(removeUser);
		
		removeUser.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				mediator.insertDeleteUserTable();
				removeUser.setEnabled(false);
			}
		});
		
		Label comment = new Label("Commenti");
		comment.addStyleName("userLabel");
		this.addComponent(comment);
		
		removeComment = new Button("Rimuovi");
		removeComment.addStyleName("buttonOfPanel");
		this.addComponent(removeComment);
		
		removeComment.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				mediator.insertDeleteCommentTable();
				removeComment.setEnabled(false);
			}
		});
		
		this.addComponent(new Label("<h3 onclick='location.href=\"main.html\";' style='cursor:pointer;'>Sezione Utente</h3>", ContentMode.HTML));
		
	}
	
	public void enableAllButtons() {
		menu.setEnabled(true);
		modifyDish.setEnabled(true);
		removeDish.setEnabled(true);
		
		modifyUser.setEnabled(true);
		removeUser.setEnabled(true);
		
		removeComment.setEnabled(true);
	}
}
