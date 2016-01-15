package project.beans;

import java.io.Serializable;

public class CommentDish implements Serializable {

	protected int dishId;
	protected String username;
	protected String comment;
	
	public CommentDish(int dishId, String username, String comment)
	{
		super();
		this.dishId = dishId;
		this.username = username;
		this.comment = comment;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}
	
	public int getDishId() {
		return dishId;
	}

	public void setDishId(int dishId) {
		this.dishId = dishId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	
	@Override
	public String toString() {
		return "CommentDish [dishId=" + dishId + ", username=" + username
				+ ", comment=" + comment + "]";
	}

	public String toJSON()
	{
		return "{dishId:'" + dishId + "', username:'" + username + "', comment:'" + comment +"'}";
	}


	
}
