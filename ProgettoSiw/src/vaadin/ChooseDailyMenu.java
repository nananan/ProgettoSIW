package vaadin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import project.BeanDBManager;
import project.beans.Dish;

import com.vaadin.server.ExternalResource;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.Table;
import com.vaadin.ui.Table.Align;

public class ChooseDailyMenu  implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Table table;
	private ArrayList<Dish> dishes;
	private HashMap<Integer, CheckBox> dishChoosed;
	
	public ChooseDailyMenu() {
	}
	
	private void init() {
		
		dishes = BeanDBManager.getInstance().getDishes();
		
		dishChoosed = new HashMap<Integer, CheckBox>();
		table = new Table();
		
		table.setWidth("100%");
		table.setHeight("330px");
		
		table.addContainerProperty("Anteprima", Image.class, null);
		table.addContainerProperty("Nome", Label.class, null);
		table.addContainerProperty("Descrizione", Label.class, null);
		table.addContainerProperty("Categoria", Label.class, null);
		table.addContainerProperty("Seleziona", CheckBox.class, null);

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

			CheckBox select = new CheckBox();
			dishChoosed.put(dish.getId(), select);

			table.addItem(new Object[] {previewImage, name, descriprion, category, select }, index++);
		}
		
	}
	
	public HashMap<Integer, CheckBox> getDishChoosed() {
		return dishChoosed;
	}
	
	public Table getTable() {
		init();
		return table;
	}
}
