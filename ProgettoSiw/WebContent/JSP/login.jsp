<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="paneBottomLogin"></div>

<div id="paneLogin" style="display:none">

	<div class="closeButtonLogin"><img onclick="deletePanelLogin()" src="images/closeButton.png"></div>

	<div class="txt">
	    <input id="user" type="text" placeholder="Username" />
	    <label for="user" class="entypo-user"></label>
	</div>

 	<div class="txt">
	   <input id="pwd" type="password" placeholder="Password" />
	   <label for="pwd" class="entypo-lock"></label>
	</div>

	<%
	String userAgent = request.getHeader("user-agent");
	boolean mobile = userAgent.matches(".*Android.*");

	if (mobile) {
%>

	<div class="buttons">
	   <input onclick="executeLoginMobile()" type="button" value="Login" />
	</div>
<%	} %>

<%-- else  { %> 

	<div class="buttons">
	   <input onclick="executeLogin()" type="button" value="Login" />
	</div>
	
<% } %> --%>
	
	<span>
	  <a onclick="insertPaneForRegister()" class="register">Register</a>
	</span>
	
	<div class="hr"></div>

	<div class="social">
	    <a onclick="Login()" class="facebook"></a>
	    <a href="javascript:void(0)" class="twitter"></a>
	    <a href="javascript:void(0)" class="googleplus"></a>
	</div>
	
	<div id="fb-root"></div>
	
</div>

</body>
</html>