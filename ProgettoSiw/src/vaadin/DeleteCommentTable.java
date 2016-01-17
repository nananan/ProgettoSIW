package vaadin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

import project.BeanDBManager;
import project.beans.CommentDish;
import project.beans.Dish;

import com.vaadin.server.ExternalResource;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.Image;
import com.vaadin.ui.Label;
import com.vaadin.ui.Table;
import com.vaadin.ui.Table.Align;

public class DeleteCommentTable implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Table table;
	private ArrayList<CommentDish> comment;
	private HashMap<Integer, String> dishes;
	private HashMap<Integer, CheckBox> valueToDeleteDish;
	
	public DeleteCommentTable() {
	}
	
	private void init() {
		
		dishes = BeanDBManager.getInstance().getDishesImage();
		comment = BeanDBManager.getInstance().getComment();
		
		valueToDeleteDish = new HashMap<Integer, CheckBox>();
		table = new Table();
		
		table.setWidth("100%");
		table.setHeight("100%");
		
		table.addContainerProperty("Immagine Piatto", Image.class, null);
		table.addContainerProperty("Utente", Label.class, null);
		table.addContainerProperty("Commento", Label.class, null);
		table.addContainerProperty("Data", Label.class, null);
		table.addContainerProperty("Cancella", CheckBox.class, null);

		table.setColumnExpandRatio("Commento", 20);
		
		table.setColumnAlignments(Align.CENTER, Align.CENTER, Align.CENTER, Align.CENTER, Align.CENTER);
		
		int index = 0;
		for (CommentDish comm : comment) {
			
			Label utente = new Label(comm.getUsername());
			Label commento = new Label(comm.getComment());
			Image previewImage = null;
			if (dishes.get(comm.getDishId()) != null && !dishes.get(comm.getDishId()).equals("")) {
				ExternalResource resource = new ExternalResource(dishes.get(comm.getDishId()));

				previewImage = new Image("image", resource);
				previewImage.setHeight("100px");
				previewImage.setWidth("100px");
				previewImage.addStyleName("imageDish");
			} 
			else
			{
				ExternalResource resource = new ExternalResource("");
				previewImage = new Image(null, resource);
				previewImage = new Image("image", resource);
			}

			Label data = new Label(comm.getData());

			CheckBox delete = new CheckBox();
			valueToDeleteDish.put(comm.getId(), delete);

			table.addItem(new Object[] {previewImage, utente, commento, data, delete }, index++);
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
