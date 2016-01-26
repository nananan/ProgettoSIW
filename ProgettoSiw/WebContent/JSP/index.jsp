<%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> -->
<head>

<%
	String userAgent = request.getHeader("user-agent");
	boolean mobile = userAgent.matches(".*Android.*");

	if (mobile) {
%>
	<link rel="stylesheet" type="text/css" href="css/mobile/index.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/info.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/profile.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/register.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/login.css">

	<meta content='user-scalable=0' name='viewport'/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
          
<%
	} else {
%>
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/info.css">
	<link rel="stylesheet" type="text/css" href="css/profile.css">
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
<% } %>


	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="Javascript/login.js"></script>
	<script type="text/javascript" src="Javascript/loginManager.js"></script>
	<title>Progetto SIW</title>
</head>

<% 
	User user = (User) session.getAttribute("user");
%>

<body>

	<img id="imageIndex" src="images/frasiMensa.jpg" alt="unical" align="middle" />
	<div id="imageIndexUp"></div>
	<div id="imageIndexBottom"></div>
	
<!-- 	<script type="text/javascript">
		var json = eval("("+localStorage["user"]+")");
	
		if (json != null)
			simpleLogin(json);
	</script> -->

<% if (!mobile) { %>

	<ul id="menu">
		<li><a href="main.html">Home</a></li>
		<li><a href="map.html">Map</a></li>
		<li><a onclick="insertPaneInfo()">Info</a></li>
		<li id="loginKeyLi"><a id="loginKey" onclick="insertPaneLogin()">Login</a></li>
		
	</ul>
	<script>
		var json = eval("("+localStorage["user"]+")");
		if (json != null)
			simpleLogin(json);
	</script>
	
<%	} else {
%>	
	
	<ul id="menuCollapsibleIndex" class="collapsible" data-collapsible="accordion">
	    <li><a href="main.html">Home</a></li>
		<li><a href="JSP/mobile/map.jsp">Map</a></li>
	    <li>
	      <div class="collapsible-header"><a>Info</a></div>
	      <div class="collapsible-body">
			<div id="title"><p>Dove Siamo</p></div>
			<div id="info"><p>Sede legale ed amministrativa
							Via Francesco Antolisei, 25
							00173 - Roma</p></div>
		
			<hr id="line" class="hr"></hr>
			
			<div id="title"><p>Contatti</p></div>
			<div id="info"><p>06.729961<br>
							800.012.068<br>
							lun - ven   9.00 - 18.00<br>
							info@lacascina.it
							</p></div>	
		  </div>
	    </li>
		
		
		<li id="loginKeyLi"><a id="loginKey" onclick="insertPaneLoginMobile()">Login</a></li>
	  </ul>
	
	<script>
		var json = eval("("+localStorage["user"]+")");
		if (json != null)
			simpleLoginMobile(json);
	</script>
	
<% 	} %>
	
	<img id="iconCascina" src ="images/cascina1.png"/>
	
	<div class=mense>
		<div class=mensaCR>
			<a href="mensaCR.jsp">
				<img id="imageMensa" src ="images/mensaCR.jpg" alt="mensaCR" title="mensa Centro Residenziale"/>
			</a>
			<p id=mensaText><i>Mensa Centro Residenziale</i></p>
			
		</div>
		
		<div class=mensaMartensson>
			<a href="mensaMartensson.jsp">
				<img id="imageMensa" src ="images/mensaMartensson.jpg" alt="mensaMartensson" title="mensa Martensson"/>
			</a>
			<p id=mensaText><i>Mensa Martensson</i></p>
		   
		</div>
		
		<div class=mensaTeatro>
			<a href="mensaTeatro.jsp">
				<img id="imageMensa" src ="images/mensaTeatro.jpg" alt="mensaTeatron" title="mensa del Teatro"/>
			</a> 
			<p id=mensaText><i>Mensa del Teatro</i></p>
		</div>
	</div>
	
	<div id="popupSection"></div>
	
</body>
</html>