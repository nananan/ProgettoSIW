package project.beans;

import java.io.Serializable;

public class User implements Serializable {

	protected String username;
	protected String password;
	protected String email;
	protected String profileName;
	protected String imageUrl;

	public User(String username, String password, String email, String profileName, String imageUrl)
	{
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.profileName = profileName;
		this.imageUrl = imageUrl;
	}

	public User()
	{
		profileName = "";
		imageUrl = "";
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getProfileName()
	{
		return profileName;
	}

	public void setProfileName(String profileName)
	{
		this.profileName = profileName;
	}

	public String getImageUrl()
	{
		return imageUrl;
	}

	public void setImageUrl(String imageUrl)
	{
		this.imageUrl = imageUrl;
	}

//	public String toJSON()
//	{
//		return JsonConverter.converterToJson(this);
//
//	}

	@Override
	public String toString()
	{
		return "User [username=" + username + ", password=" + password + ", profileName=" + profileName + ", imageUrl=" + imageUrl
				+ ", email=" + email+"]";
	}

}
