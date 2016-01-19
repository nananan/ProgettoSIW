<%@page import="servlets.getFilePath"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="Javascript/mainAfterRegister.js"></script>
<script type="text/javascript" src="Javascript/signUp.js"></script>
<title>ProgettoSIW</title>
</head>
<body>
<!-- <h3>Your file has been uploaded!</h3> -->

<% getFilePath file = getFilePath.getInstance();%>



<%-- <div id="register">

	<div class="arrow-left"></div>
	
	<div class="closeButtonRegister"><img onclick="deletePanelRegister()" src="images/closeButton.png"></div>
		
	<div class="image">
		<img onclick="chooseProfileImage()" alt="" src="<%=file.getFile()%>"></img>
	</div>

	<div class="form">
		<input id="email" class="textbox" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}" type="text">
		<input id="username" class="textbox" value="Username" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Username';}" type="text">
		<input id="password" class="textbox" value="password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'password';}" type="password">
		<input onclick="createAccount()" value="Create Account" type="submit">
	</div>							    


</div> --%>

<%-- <script>
function createAccountA() {
		$.ajax({
			type : "POST",
			url : 'SignUp',
			data : {
				'username' : $('#username').val(),
				'password' : $('#password').val(),
				'email' : $("#email").val(),
				'social' : false,
				'profileImage' : <%=file.getFile()%>
			},
			success : function(data) {
				// FARE PANNELLINO
				localStorage["user"] = data;
				$('#register').toggle();
				$('#paneLogin').toggle();
				$('#paneBottomLogin').toggle();
				$('body').append('<div id="nameUser"><p>'+$('#username').val()+'</p></div>');
				deleteLoginAndInsertNameUser($('#username').val());
			},
			 error: function (data) {
	              alert("ERRORE");
            }
		});
} 
</script> --%>


<!-- <script type="text/javascript">
console.log("OOOOOOOOOOOOOOOOOOOO");
$.ajax({
	method : "POST",
	url : 'filePath',
	success : function(data) {
		console.log(data);
	
	},
	error : function() {
		console.log("AAAAAAAAAA");
		
	}
});
</script> -->

</body>
</html>