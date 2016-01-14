<%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>

<link rel="stylesheet" type="text/css" href="css/profile.css">

<% 
	User user = (User) session.getAttribute("user");

%>


<div id="pane">
	<div id="panelForImage">
		<img src="<%=user.getImageUrl()%>">
		<p>Cambia avatar</p>
	</div>
	
	<div id="panelForInformation">
		<div id="username"><p><%=user.getUsername()%></p></div>
		<div id="email"><p><%=user.getEmail()%></p></div>
		<hr class="hr"></hr>
		
		<button id="adminButton" onclick="" type="button">Sezione Admin</button>
		
	</div>
	<div id="exit">
		<button id="exitButton" onclick="executeLogOut()" type="button">Log out</button>
	</div>
</div>
<div class="arrow-top"></div>
