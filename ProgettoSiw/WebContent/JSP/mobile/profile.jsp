<%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>

<!-- <script type="text/javascript" src="Javascript/signUp.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
 -->
<% 
	User user = (User) session.getAttribute("user");

%>

<!-- <div id="pane"> -->
	<div id="panelForImage">
		<img src="<%=user.getImageUrl()%>">
		<!-- <p onclick="chooseAvatar()" >Cambia avatar</p> -->
	</div>
	
	<div id="panelForInformation">
		<div id="username"><p><%=user.getUsername()%></p></div>
		<div id="email"><p><%=user.getEmail()%></p></div>
		<hr id="line" class="hr"></hr>
		
		<button id="adminButton" onclick="goToAdminPage()" type="button">Sezione Admin</button>
		
		<!-- <div id="exit"> -->
			<button id="exitButton" onclick="executeLogOut()" type="button">Log out</button>
		<!-- </div> -->
	</div>
	
	
	
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

