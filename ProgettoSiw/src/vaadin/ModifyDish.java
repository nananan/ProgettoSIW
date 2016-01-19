package vaadin;

import project.BeanDBManager;
import project.beans.Category;
import project.beans.Dish;

import com.vaadin.event.ShortcutAction;
import com.vaadin.ui.Button;
import com.vaadin.ui.ComboBox;
import com.vaadin.ui.DateField;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.TextArea;
import com.vaadin.ui.TextField;
import com.vaadin.ui.themes.ValoTheme;

@SuppressWarnings("serial")
public class ModifyDish extends FormLayout {
	
 	Button save = new Button("Salva", this::save);
 	Button annulla = new Button("Annulla", this::annulla);
    TextArea preview = new TextArea("Anteprima");
    TextArea name = new TextArea("Nome");
    TextArea description = new TextArea("Descrizione");
    ComboBox category = new ComboBox("Categoria");
//    DateField menuDate = new DateField("Data Menu");

    Dish dish;
    Integer dishId;
    Mediator mediator;
    
    private boolean isNew;
    
    public ModifyDish(Mediator mediator) {
    	configureComponents();
        buildLayout();
        
        this.mediator = mediator;
        
    	this.preview.setValue("");
        this.name.setValue("");
    	this.description.setValue("");
    	
    	this.isNew = true;
    }
    
    public ModifyDish(Dish dish, String preview, String name, 
    		String description, String category, Mediator mediator) {
      
    	configureComponents();
        buildLayout();
        
        this.mediator = mediator;
        
        dishId = dish.getId();
        
        if (preview == null)
        	this.preview.setValue("");
        else
        	this.preview.setValue(preview);
        this.name.setValue(name);
        if(description == null)
        	this.description.setValue("");
        else
        	this.description.setValue(description);
        this.category.setValue(category);
        
        this.isNew = false;
    }

    private void configureComponents() {
        save.setStyleName(ValoTheme.BUTTON_PRIMARY);
        save.setClickShortcut(ShortcutAction.KeyCode.ENTER);

        annulla.setStyleName(ValoTheme.BUTTON_PRIMARY);
        annulla.setClickShortcut(ShortcutAction.KeyCode.ENTER);
        
    }

    private void buildLayout() {
//	        setWidth("20%");
        setMargin(true);

        addStyleName("formLayout");
        
        preview.setHeight("80px");
        name.setHeight("59px");
        description.setHeight("150px");
        
        HorizontalLayout actions = new HorizontalLayout(save, annulla);
        actions.setSpacing(true);

        for (String cat : Category.getArrayCategory()) {
			category.addItem(cat);
		}
        
		addComponents(preview, name, description, category, actions);
    }

    public void save(Button.ClickEvent event) {
    	if (!isNew) {
    		this.dish = new Dish(dishId, name.getValue(), preview.getValue(), 
    			 description.getValue(), category.getValue().toString());
    	
    		BeanDBManager.getInstance().modifyDish(dish);
    	}
    	else {
    		BeanDBManager.getInstance().addDish(name.getValue(), preview.getValue(), 
       			 description.getValue(), Category.getCategoryString(category.getValue().toString()));
    	}
    	mediator.insertModifyTable();
    }
    
    public void annulla(Button.ClickEvent event) {
    	mediator.insertModifyTable();
   }
}
