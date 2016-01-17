package vaadin;

import com.vaadin.event.ShortcutAction;
import com.vaadin.ui.Button;
import com.vaadin.ui.FormLayout;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.TextArea;
import com.vaadin.ui.themes.ValoTheme;

import project.BeanDBManager;
import project.beans.User;

public class ModifyUser extends FormLayout {
	
 	Button save = new Button("Salva", this::save);
 	Button annulla = new Button("Annulla", this::annulla);
 	TextArea username = new TextArea("Username");
    TextArea image = new TextArea("Immagine");
    TextArea email = new TextArea("Email");
    
    Mediator mediator;
    
    public ModifyUser(String username, String image_url, String email, Mediator mediator) {
    	configureComponents();
    	buildLayout();
    	
    	this.mediator = mediator;
    	
    	this.username.setValue(username);
    	this.image.setValue(image_url);
    	this.email.setValue(email);
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
        
        username.setHeight("50px");
        image.setHeight("200px");
        email.setHeight("50px");
        
        HorizontalLayout actions = new HorizontalLayout(save, annulla);
        actions.setSpacing(true);

		addComponents(actions, email, image);
    }

    public void save(Button.ClickEvent event) {
    	BeanDBManager.getInstance().modifyUser(username.getValue(), email.getValue(), image.getValue());
//    	mediator.removeFormAndUpdateUsers();
    	mediator.insertModifyUserTable();
    }
    
    public void annulla(Button.ClickEvent event) {
    	mediator.insertModifyUserTable();
//    	mediator.removeFormAndUpdateUsers();
   }
}
