package vaadin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import project.BeanDBManager;
import project.beans.Dish;
import project.beans.User;

import com.vaadin.event.ItemClickEvent;
import com.vaadin.server.ExternalResource;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.Table;
import com.vaadin.ui.Table.Align;

public class ModifyUserTable implements Serializable {

	private static final long serialVersionUID = 1L;

	private Table table;
	private Mediator mediator;
	private ArrayList<User> users;
	private HashMap<String, CheckBox> valueToSetAdmin;
	
//	private HashMap<Integer, CheckBox> valueToDeleteDish;
	
	public ModifyUserTable(Mediator mediator) {
		this.mediator = mediator;
	}
	
	@SuppressWarnings("serial")
	private void init() {
		
		users = BeanDBManager.getInstance().getAllUser();
		
		valueToSetAdmin = new HashMap<String, CheckBox>();
		table = new Table();
		table.setSelectable(true);
		table.addItemClickListener(new ItemClickEvent.ItemClickListener() {
			
			@Override
			public void itemClick(ItemClickEvent event) {
				
				ModifyUser modifyUser = new ModifyUser(((Label)table.getItem(event.getItemId()).getItemProperty("Username").getValue()).getValue(),
						((ExternalResource)((Image)table.getItem(event.getItemId()).getItemProperty("Immagine").getValue()).getSource()).getURL(),
						((Label)table.getItem(event.getItemId()).getItemProperty("Email").getValue()).getValue(),
						mediator);
				mediator.addFormUserLayout(modifyUser);
				
				table.setWidth("133%");
				
//				System.out.println(((Label)table.getItem(event.getItemId()).getItemProperty("Name").getValue()).getValue());
			}
		});
		
		table.setWidth("100%");
		table.setHeight("100%");
		
		table.addContainerProperty("Immagine", Image.class, null);
		table.addContainerProperty("Username", Label.class, null);
		table.addContainerProperty("Email", Label.class, null);
		table.addContainerProperty("Admin", CheckBox.class, null);

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
				previewImage.setSource(resource);
			} 
			else {
				ExternalResource resource = new ExternalResource("");
				previewImage = new Image("image", resource);
				previewImage.setSource(resource);
			}

			CheckBox setAdmin = new CheckBox();
			if (user.getAdmin().equals("true"))
				setAdmin.setValue(true);
			else
				setAdmin.setValue(false);
			valueToSetAdmin.put(user.getUsername(), setAdmin);

			table.addItem(new Object[] {previewImage, username, email, setAdmin }, index++);
		}
	}
	
	public void setWidthAfterForm() {
		table.setWidth("133%");
	}
	
	public HashMap<String, CheckBox> getValueToSetAdmin() {
		return valueToSetAdmin;
	}
	
	public Table getTable() {
		init();
		return table;
	}
}
