<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<%-- 
<%
	String userAgent = request.getHeader("user-agent");
	boolean mobile = userAgent.matches(".*Android.*");

	if (mobile) {
%> --%>
	<link rel="stylesheet" type="text/css" href="../../css/mobile/map.css"> 
	<link rel="stylesheet" type="text/css" href="../../css/mobile/index.css">
	<link rel="stylesheet" type="text/css" href="../../css/mobile/info.css">
	
	<meta content='user-scalable=0' name='viewport'/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
	<script type="text/javascript" src="../../Javascript/mobile/pageMenu.js"></script>
<%-- 
<% 	} else { %>
	<link rel="stylesheet" type="text/css" href="../../css/index.css">
	<link rel="stylesheet" type="text/css" href="../../css/info.css">
	<link rel="stylesheet" type="text/css" href="../../css/map.css"> 
	<script type="text/javascript" src="../../Javascript/pageMenu.js"></script>

<% 	} %> --%>

	
	
	<script type="text/javascript" src="../../Javascript/login.js"></script>
	<script  type='text/javascript'src="https://maps.googleapis.com/maps/api/js"></script>
    <script type='text/javascript' src="../../Javascript/map.js"></script>
	<title>Mappa Mense</title>
</head>
<body>

<%-- <% if (!mobile) { %>	

	<ul id="menu">
		<li><a href="main.html">Home</a></li>
		<li><a href="map.html">Map</a></li>
		<li><a onclick="insertPaneInfo()">Info</a></li>
	</ul>

<% 	} else { %> --%>
	
	<ul id="menuCollapsibleMain" class="collapsible" data-collapsible="accordion">
	    <li><a href="../../main.html">Home</a></li>
		<li><a href="map.jsp">Map</a></li>
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
	  </ul>

	
<%-- <% 	} %> --%>

	<div id="map"></div>
	<div id="popupSection"></div>
</body>
</html>