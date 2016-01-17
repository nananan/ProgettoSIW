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
		
		<button id="adminButton" onclick="goToAdminPage()" type="button">Sezione Admin</button>
		
	</div>
	<div id="exit">
		<button id="exitButton" onclick="executeLogOut()" type="button">Log out</button>
	</div>
</div>
<div class="arrow-top"></div>


<script type="text/javascript">
	function goToAdminPage() {
		var user = eval("("+localStorage["user"]+")");
		$.ajax({
			method : "POST",
		  	url: "admin",
		  	data : {
				'username' : user["username"]
			},
  			success: function(data) {
  				location.href="admin";
  			},
  			failed : function(data) {
  				console.log("ERROR: "+user);
  			}
		});
		
	}
	
</script>

