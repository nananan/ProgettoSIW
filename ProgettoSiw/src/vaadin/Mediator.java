package vaadin;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

import project.BeanDBManager;

import com.vaadin.data.Property.ValueChangeEvent;
import com.vaadin.server.Page;
import com.vaadin.ui.Button;
import com.vaadin.ui.Button.ClickListener;
import com.vaadin.ui.CheckBox;
import com.vaadin.ui.DateField;
import com.vaadin.ui.HorizontalLayout;
import com.vaadin.ui.Layout;
import com.vaadin.ui.Notification;
import com.vaadin.ui.Notification.Type;
import com.vaadin.ui.VerticalLayout;
import com.vaadin.ui.Button.ClickEvent;

public class Mediator implements Serializable {

	private static final long serialVersionUID = 1L;
	private final SimpleDateFormat dateSDF = new SimpleDateFormat("yyyy-MM-dd");
	
	private ButtonPanel buttonPanel;
	private CentralPanel centralPanel;
	
	private DeleteDishesTable deleteDishesTable;
	private ModifyDishesTable modifyDishesTable;
	private ModifyDish modifyDish;
	
	private DeleteUserTable deleteUserTable;
	private ModifyUserTable modifyUserTable;
	private ModifyUser modifyUser;

	private DeleteCommentTable deleteCommentTable;

	private ChooseDailyMenu chooseMenu;
	private boolean correctData;

	private Layout layout;
	private Layout layoutForCentralPanel;
	
	public Mediator() {
	}
	
	private void initPanel() {
		layout = new HorizontalLayout();
		layout.setWidth("100%");
		layout.setHeight("100%");
		layout.addStyleName("firstPane");
		
		buttonPanel = new ButtonPanel(this);
		layout.addComponent(buttonPanel);

		layoutForCentralPanel = new VerticalLayout();
		layoutForCentralPanel.setWidth("100%");
		layoutForCentralPanel.setHeight("100%");
		layout.addComponent(layoutForCentralPanel);
		centralPanel = new CentralPanel(this);
		layoutForCentralPanel.addComponent(centralPanel);
	}
	
	public void insertDeleteTable() {
		deleteAllComponent();
		deleteDishesTable = new DeleteDishesTable();
		
		centralPanel.addComponent(deleteDishesTable.getTable());
		centralPanel.setHeight("180%");
		
		Button save = new Button("Salva");
		save.addStyleName("button");
		save.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				HashMap<Integer, CheckBox> map = deleteDishesTable.getValueOfDishToDelete();
				Set<Integer> keySet = map.keySet();
				for (Integer key : keySet) {
					if (map.get(key).getValue()) {
						BeanDBManager.getInstance().deleteDish(key);
						insertDeleteTable();
					}
				}
			}
		});
		layoutForCentralPanel.addComponent(save);
	}
	
	public void insertModifyTable() {
		deleteAllComponent();
		modifyDishesTable = new ModifyDishesTable(this);
		
		centralPanel.addComponent(modifyDishesTable.getTable());
		
		Button add = new Button("Aggiungi");
		add.addStyleName("button");
		add.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				if (Mediator.this.modifyDish != null)
					centralPanel.removeComponent(Mediator.this.modifyDish);
				
				Mediator.this.modifyDish = new ModifyDish(Mediator.this);
				centralPanel.addComponent(modifyDish);
				
				modifyDishesTable.setWidthAfterForm();
			}
		});
		centralPanel.setHeight("180%");
		layoutForCentralPanel.addComponent(add);
	}
	
	public Layout getPanel() {
		initPanel();
		return layout;
	}

	public void addFormLayout(ModifyDish modifyDish) {
		if (this.modifyDish != null)
			centralPanel.removeComponent(this.modifyDish);
		
		this.modifyDish = modifyDish;
		centralPanel.addComponent(modifyDish);
	}
	
//	public void removeFormAndUpdateDishes() {
//		layoutForCentralPanel.removeAllComponents();
//		centralPanel = new CentralPanel(Mediator.this);
//		layoutForCentralPanel.addComponent(centralPanel);
//		
//		insertModifyTable();
//	}
	public void removeForm() {
		if (this.modifyDish != null)
			centralPanel.removeComponent(this.modifyDish);
	}

	
	public void insertDeleteUserTable() {
		deleteAllComponent();
		deleteUserTable = new DeleteUserTable();
		
		centralPanel.addComponent(deleteUserTable.getTable());
		centralPanel.setHeight("180%");
		
		Button save = new Button("Salva");
		save.addStyleName("button");
		save.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				HashMap<String, CheckBox> map = deleteUserTable.getValueOfDishToDelete();
				Set<String> keySet = map.keySet();
				for (String key : keySet) {
					if (map.get(key).getValue()) {
						BeanDBManager.getInstance().deleteCommentUser(key);
						BeanDBManager.getInstance().deleteUser(key);
						insertDeleteUserTable();
					}
				}
			}
		});
		layoutForCentralPanel.addComponent(save);
	}
	
	public void insertModifyUserTable() {
		deleteAllComponent();
		modifyUserTable = new ModifyUserTable(this);
		
		centralPanel.addComponent(modifyUserTable.getTable());
		
		Button save = new Button("Salva");
		save.addStyleName("button");
		save.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				HashMap<String, CheckBox> map = modifyUserTable.getValueToSetAdmin();
				Set<String> keySet = map.keySet();
				for (String key : keySet) {
					if (map.get(key).getValue()) {
						BeanDBManager.getInstance().setAdmin(key, "true");
						insertModifyUserTable();
					}
					else {
						BeanDBManager.getInstance().setAdmin(key, "false");
						insertModifyUserTable();
					}
				}
			}
		});
		centralPanel.setHeight("180%");
		layoutForCentralPanel.addComponent(save);
	}

	public void addFormUserLayout(ModifyUser modifyUser) {
		if (this.modifyUser != null)
			centralPanel.removeComponent(this.modifyUser);
		
		this.modifyUser = modifyUser;
		centralPanel.addComponent(modifyUser);
	}
	
//	public void removeFormAndUpdateUsers() {
//		layoutForCentralPanel.removeAllComponents();
//		centralPanel = new CentralPanel(Mediator.this);
//		layoutForCentralPanel.addComponent(centralPanel);
//		
//		insertModifyUserTable();
//	}

	public void insertDeleteCommentTable() {
		deleteAllComponent();
		deleteCommentTable = new DeleteCommentTable();
		
		centralPanel.addComponent(deleteCommentTable.getTable());
		centralPanel.setHeight("180%");
		
		Button save = new Button("Salva");
		save.addStyleName("button");
		save.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				HashMap<Integer, CheckBox> map = deleteCommentTable.getValueOfDishToDelete();
				Set<Integer> keySet = map.keySet();
				for (Integer key : keySet) {
					if (map.get(key).getValue()) {
						BeanDBManager.getInstance().deleteCommentUser(key);
						insertDeleteCommentTable();
					}
				}
			}
		});
		layoutForCentralPanel.addComponent(save);
	}
	
	@SuppressWarnings("deprecation")
	public void insertChooseMenu() {
		deleteAllComponent();
		chooseMenu = new ChooseDailyMenu();
		final DateField menuDate = new DateField("Data Menu");
		correctData = true;
		
		menuDate.addListener(new DateField.ValueChangeListener() {
			
			private static final long serialVersionUID = -2907331888114579350L;

			public void valueChange(ValueChangeEvent event) {
				if (((java.util.Date) event.getProperty().getValue()).before(new Date())) {
					menuDate.setValue(new Date());

					Notification notification = new Notification("Non puoi selezionare una data precedente a oggi", Type.WARNING_MESSAGE);
					notification.show(Page.getCurrent());
					correctData = false;
				} 
				else
					correctData = true;
			}
		});

		VerticalLayout actions = new VerticalLayout();
        actions.setSpacing(true);
        actions.addComponent(menuDate);
        actions.addComponent(chooseMenu.getTable());
        
		centralPanel.addComponent(actions);
		centralPanel.setHeight("180%");
		
		Button save = new Button("Salva");
		save.addStyleName("button");
		save.addClickListener(new ClickListener() {
			
			@Override
			public void buttonClick(ClickEvent event) {
				
				String data = dateSDF.format(menuDate.getValue());
				if (!hasChoosedSomeDish()) {
					Notification notification = new Notification("Menu vuoto, scegli i piatti", Type.WARNING_MESSAGE);
					notification.show(Page.getCurrent());
				}
				else {
					if (correctData) {
						HashMap<Integer, CheckBox> map = chooseMenu.getDishChoosed();
						Set<Integer> keySet = map.keySet();
						for (Integer key : keySet) {
							if (map.get(key).getValue()) {
								boolean isInsert = BeanDBManager.getInstance().addDailyMenu(key, data);
								
								if(isInsert) {
									Notification notification = new Notification("Menu inserito", Type.WARNING_MESSAGE);
									notification.show(Page.getCurrent());
								}
								else {
									Notification notification = new Notification("Errore, riprova", Type.WARNING_MESSAGE);
									notification.show(Page.getCurrent());
								}
							}
						}
					}
				}
			}
		});
		layoutForCentralPanel.addComponent(save);
	}
	
	private boolean hasChoosedSomeDish() {
		HashMap<Integer, CheckBox> map = chooseMenu.getDishChoosed();
		Set<Integer> keySet = map.keySet();
		for (Integer key : keySet)
			if (map.get(key).getValue())
				return true;
		return false;
	}
	
	private void deleteAllComponent() {
		layoutForCentralPanel.removeAllComponents();
		centralPanel = new CentralPanel(Mediator.this);
		layoutForCentralPanel.addComponent(centralPanel);
		buttonPanel.enableAllButtons();
	}
}
