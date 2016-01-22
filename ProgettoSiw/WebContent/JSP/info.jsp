<%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>


<!-- <script type="text/javascript" src="Javascript/info.js"></script> -->

<%-- <% 
	User user = (User) session.getAttribute("user");

%> --%>

<div id="paneInfo">
	<div id="panelForImage">
		<img src="images/cascinaSede.jpg">
	</div>
	
	<div id="panelForInformation">
		<div id="title"><p>Dove Siamo</p></div>
		<div id="info"><p>Sede legale ed amministrativa
						Via Francesco Antolisei, 25
						00173 - Roma</p></div>
	
		<%-- <div id="username"><p><%=user.getUsername()%></p></div>
		<div id="email"><p><%=user.getEmail()%></p></div> --%>
		<hr id="line" class="hr"></hr>
		
	<div id="title"><p>Contatti</p></div>
		<div id="info"><p>06.729961<br>
						800.012.068<br>
						lun - ven   9.00 - 18.00<br>
						info@lacascina.it
						</p></div>	
	
	</div>
	<!-- <div id="exit">
		<button id="exitButton" onclick="executeLogOut()" type="button">Log out</button>
	</div> -->
</div>
<div class="arrow-topInfo"></div>