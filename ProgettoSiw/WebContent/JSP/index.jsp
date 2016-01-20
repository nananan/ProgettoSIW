<%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> -->
<head>
	<link rel="stylesheet" type="text/css" href="css/index.css">
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
	
	<script type="text/javascript">
		var json = eval("("+localStorage["user"]+")");
	
		if (json != null)
			simpleLogin(json);
	</script>

	<ul id="menu">
		<li><a href="main.html">Home</a></li>
		<li><a href="map.html">Map</a></li>
		<li><a href="#">Altro</a></li>
		<li><a id="loginKey" onclick="insertPaneLogin()">Login</a></li>
		
		<script>
			if (json != null)
				simpleLogin(json);
			/* else
			 	$('ul#menu').last().append('<li><a id="loginKey" onclick="insertPaneLogin()">Login</a></li>');
			*/
		</script>
		
	</ul>
	
	
	<img id="iconCascina" src ="images/cascina1.png"/>
	
	<div class=mense>
		<div class=mensaCR>
			<a href="mensaCR.html">
				<img id="imageMensa" src ="images/mensaCR.jpg" alt="mensaCR" title="mensa Centro Residenziale"/>
			</a>
			<p id=mensaText><i>Mensa Centro Residenziale</i></p>
			
		</div>
		
		<div class=mensaMartensson>
			<a href="mensaMartensson.html">
				<img id="imageMensa" src ="images/mensaMartensson.jpg" alt="mensaMartensson" title="mensa Martensson"/>
			</a>
			<p id=mensaText><i>Mensa Martensson</i></p>
		   
		</div>
		
		<div class=mensaTeatro>
			<a href="mensaTeatro.html">
				<img id="imageMensa" src ="images/mensaTeatro.jpg" alt="mensaTeatron" title="mensa del Teatro"/>
			</a> 
			<p id=mensaText><i>Mensa del Teatro</i></p>
		</div>
	</div>
	
</body>
</html>