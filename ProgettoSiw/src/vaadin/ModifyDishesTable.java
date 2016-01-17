package vaadin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import project.BeanDBManager;
import project.beans.Dish;

import com.vaadin.data.Property;
import com.vaadin.event.ItemClickEvent;
import com.vaadin.event.ItemClickEvent.ItemClickListener;
import com.vaadin.server.ExternalResource;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.Table;
import com.vaadin.ui.Table.Align;

public class ModifyDishesTable implements Serializable {

	private static final long serialVersionUID = 1L;

	private Table table;
	private Mediator mediator;
	private ArrayList<Dish> dishes;
	
//	private HashMap<Integer, CheckBox> valueToDeleteDish;
	
	public ModifyDishesTable(Mediator mediator) {
		this.mediator = mediator;
	}
	
	@SuppressWarnings("serial")
	private void init() {
		
		dishes = BeanDBManager.getInstance().getDishes();
		
//		valueToDeleteDish = new HashMap<Integer, CheckBox>();
		table = new Table();
		table.setSelectable(true);
		table.addItemClickListener(new ItemClickEvent.ItemClickListener() {
			
			@Override
			public void itemClick(ItemClickEvent event) {
				
				ModifyDish modifyDish = new ModifyDish(dishes.get((int) event.getItemId()),
						((ExternalResource)((Image)table.getItem(event.getItemId()).getItemProperty("Anteprima").getValue()).getSource()).getURL(),
						((Label)table.getItem(event.getItemId()).getItemProperty("Nome").getValue()).getValue(),
						((Label)table.getItem(event.getItemId()).getItemProperty("Descrizione").getValue()).getValue(),
						((Label)table.getItem(event.getItemId()).getItemProperty("Categoria").getValue()).getValue(),
						mediator);
				mediator.addFormLayout(modifyDish);
				
				table.setWidth("133%");
				
//				System.out.println(((Label)table.getItem(event.getItemId()).getItemProperty("Name").getValue()).getValue());
			}
		});
		
		table.setWidth("100%");
		table.setHeight("100%");
		
		table.addContainerProperty("Anteprima", Image.class, null);
		table.addContainerProperty("Nome", Label.class, null);
		table.addContainerProperty("Descrizione", Label.class, null);
		table.addContainerProperty("Categoria", Label.class, null);

		table.setColumnExpandRatio("Descrizione", 20);
		
		table.setColumnAlignments(Align.CENTER, Align.CENTER, Align.CENTER, Align.CENTER);
		
		int index = 0;
		for (Dish dish : dishes) {
			
			Label id = new Label(dish.getId().toString());
			Label name = new Label(dish.getName());
			Label descriprion = new Label(dish.getDescription());
			Image previewImage = null;
			if (dish.getImageUrl() != null && !dish.getImageUrl().equals("")) {
				ExternalResource resource = new ExternalResource(dish.getImageUrl());

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
			

			Label category = new Label(dish.getCategory().getType());

			table.addItem(new Object[] {previewImage, name, descriprion, category}, index++);
		}
	}
	
	public void setWidthAfterForm() {
		table.setWidth("133%");
	}
	
	public Table getTable() {
		init();
		return table;
	}
}
