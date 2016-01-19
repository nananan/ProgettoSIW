<%@page import="servlets.getFilePath"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" type="text/css" href="css/register.css">
<script type="text/javascript" src="Javascript/signUp.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<% getFilePath file = getFilePath.getInstance();
%>

<div id="register" style="display:none">

	<div class="arrow-left"></div>
	
	<div class="closeButtonRegister"><img onclick="deletePanelRegister()" src="images/closeButton.png"></div>
		
	<div class="image">
		<img onclick="chooseProfileImage()" alt="" src="<%=file.getFile()%>"></img>
	</div>

	<div class="form">
		<input id="email" class="textbox" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}" type="text">
		<input id="username" class="textbox" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" type="text">
		<input id="password" class="textbox" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}" type="password">
		<input onclick="createAccountA('<%=file.getFile()%>')" value="Create Account" type="submit">
	</div>							    


</div>


