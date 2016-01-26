<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<%
	String userAgent = request.getHeader("user-agent");
	boolean mobile = userAgent.matches(".*Android.*");

	if (mobile) {
%>
	<link rel="stylesheet" type="text/css" href="css/mobile/index.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/info.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/profilePageMenu.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/register.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/login.css">
	<link rel="stylesheet" type="text/css" href="css/mobile/mensaCR.css">
	<!-- <link rel="stylesheet" type="text/css" href="css/mobile/modal.css"> -->
	<link rel="stylesheet" type="text/css" href="css/mobile/comment.css">
	
	<meta content='user-scalable=0' name='viewport'/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
	<script type="text/javascript" src="Javascript/mobile/pageMenu.js"></script>

<% 	} else { %>
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/mensaCR.css">
	<link rel="stylesheet" type="text/css" href="css/register.css">
	<link rel="stylesheet" type="text/css" href="css/profile.css">
	<link rel="stylesheet" type="text/css" href="css/info.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="stylesheet" type="text/css" href="css/comment.css">
	<script type="text/javascript" src="Javascript/pageMenu.js"></script>

<% 	} %>

	
	<script type="text/javascript" src="Javascript/login.js"></script>
	<script type="text/javascript" src="Javascript/loginManager.js"></script>
	<title>Mensa Centro Residenziale</title>
</head>
<body>

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
	
	<ul id="menuDishes">
		<li onclick="showDailyMenu()" id="dayMenu">Menu del Giorno</li>
		<li onclick="showChoiseMenu()" id="choiseDishes">Scelta dei piatti</li>
		<li onclick="showBestDishes()" id="bestDishes">Piatti Migliori</li>
	</ul>
	
<% 	} else { %>
	
	<ul id="menuCollapsibleMain" class="collapsible" data-collapsible="accordion">
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
	

 	<ul id="menuCollapsibleMenu" class="collapsible" data-collapsible="accordion">
	    <li>
	      <div id="collapsible-header-menu" class="collapsible-header"><a onclick="showDailyMenu()" >Menu del Giorno</a></div>
	    </li>
	    <li>
	      <div id="collapsible-header-menu" class="collapsible-header"><a onclick="showChoiseMenu()" >Scelta dei piatti</a></div>
	    </li>
	    <li>
	      <div id="collapsible-header-menu" class="collapsible-header"><a onclick="showBestDishes()" >Piatti Migliori</a></div>
	    </li>
	  </ul>
	
<% 	} %>

	<div id="panelForMenu">
		<img src="images/forMenuUp.png">
		<div id="quadMenu"></div>
		<div class="closeButton"><img onclick="deletePanelMenu()" src="images/closeButton.png"></div>
	</div>
	
	<div id="panelForChooseMenu">
		<img src="images/forMenuUp.png">
		<div id="quad"></div>
		<div class="closeButton"><img onclick="deletePanelChooseMenu()" src="images/closeButton.png"></div>
	</div>
	
	<div id="panelForBestDish">
		<img src="images/forMenuUp.png">
		<div id="quadBestDish"></div>
		<div class="closeButton"><img onclick="deletePanelBestDish()" src="images/closeButton.png"></div>
	</div>


	<div id="slideshow">
	   <div>
	     <img src="images/mensaMartensson/image1.jpg" width="900" height="350">
	   </div>
	   <div>
	     <img src="images/mensaMartensson/image2.jpg" width="900" height="350">
	   </div>
	   <div>
	     <img src="images/mensaMartensson/image3.jpg" width="900" height="350">
	   </div>
	</div>

	<!-- <script type="text/javascript" src=" http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.1.min.js"></script>
	 --><script type="text/javascript">
		$("#slideshow > div:gt(0)").hide();
	
		setInterval(function() { 
		  $('#slideshow > div:first')
		    .fadeOut(1000)
		    .next()
		    .fadeIn(1000)
		    .end()
		    .appendTo('#slideshow');
		},  3000);
	</script>
	
	<div id="popupSection"></div>
</body>
</html>