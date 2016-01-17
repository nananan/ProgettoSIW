package vaadin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import com.vaadin.server.ExternalResource;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.Table;
import com.vaadin.ui.Table.Align;

import project.BeanDBManager;
import project.beans.Dish;

public class DeleteDishesTable implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Table table;
	private ArrayList<Dish> dishes;
	private HashMap<Integer, CheckBox> valueToDeleteDish;
	
	public DeleteDishesTable() {
	}
	
	private void init() {
		
		dishes = BeanDBManager.getInstance().getDishes();
		
		valueToDeleteDish = new HashMap<Integer, CheckBox>();
		table = new Table();
		
		table.setWidth("100%");
		table.setHeight("100%");
		
		table.addContainerProperty("Anteprima", Image.class, null);
		table.addContainerProperty("Nome", Label.class, null);
		table.addContainerProperty("Descrizione", Label.class, null);
		table.addContainerProperty("Categoria", Label.class, null);
		table.addContainerProperty("Cancella", CheckBox.class, null);

		table.setColumnExpandRatio("Descrizione", 20);
		
		table.setColumnAlignments(Align.CENTER, Align.CENTER, Align.CENTER, Align.CENTER, Align.CENTER);
		
		int index = 0;
		for (Dish dish : dishes) {
			
			Label name = new Label(dish.getName());
			Label descriprion = new Label(dish.getDescription());
			Image previewImage = null;
			if (dish.getImageUrl() != null && !dish.getImageUrl().equals("")) {
				ExternalResource resource = new ExternalResource(dish.getImageUrl());

				previewImage = new Image("image", resource);
				previewImage.setHeight("100px");
				previewImage.setWidth("100px");
				previewImage.addStyleName("imageDish");
			} 

			Label category = new Label(dish.getCategory().getType());

			CheckBox delete = new CheckBox();
			valueToDeleteDish.put(dish.getId(), delete);

			table.addItem(new Object[] {previewImage, name, descriprion, category, delete }, index++);
		}
	}
	
	public HashMap<Integer, CheckBox> getValueOfDishToDelete() {
		return valueToDeleteDish;
	}
	
	public Table getTable() {
		init();
		return table;
	}
}
