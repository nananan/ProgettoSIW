package vaadin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import project.BeanDBManager;
import project.beans.User;

import com.vaadin.server.ExternalResource;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.Table;
import com.vaadin.ui.Table.Align;

public class DeleteUserTable implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Table table;
	private ArrayList<User> users;
	private HashMap<String, CheckBox> valueToDeleteDish;
	
	public DeleteUserTable() {
	}
	
	private void init() {
		
		users = BeanDBManager.getInstance().getAllUser();
		
		valueToDeleteDish = new HashMap<String, CheckBox>();
		table = new Table();
		
		table.setWidth("100%");
		table.setHeight("100%");
		
		table.addContainerProperty("Immagine", Image.class, null);
		table.addContainerProperty("Username", Label.class, null);
		table.addContainerProperty("Email", Label.class, null);
		table.addContainerProperty("Cancella", CheckBox.class, null);

		table.setColumnAlignments(Align.CENTER, Align.CENTER, Align.CENTER, Align.CENTER);
		
		int index = 0;
		for (User user : users) {
			
			Label username = new Label(user.getUsername());
			Label email = new Label(user.getEmail());
			Image previewImage = null;
			if (user.getImageUrl() != null && !user.getImageUrl().equals("")) {
				ExternalResource resource = new ExternalResource(user.getImageUrl());

				previewImage = new Image("image", resource);
				previewImage.setHeight("100px");
				previewImage.setWidth("100px");
				previewImage.addStyleName("imageDish");
			} 

			CheckBox delete = new CheckBox();
			valueToDeleteDish.put(user.getUsername(), delete);

			table.addItem(new Object[] {previewImage, username, email, delete }, index++);
		}
	}
	
	public HashMap<String, CheckBox> getValueOfDishToDelete() {
		return valueToDeleteDish;
	}
	
	public Table getTable() {
		init();
		return table;
	}
}
