<%@page import="project.BeanDBManager"%>
<%@page import="project.beans.User"%>
<%@page import="servlets.getFilePath"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProgettoSIW</title>
</head>
<body>
	
<% 
	getFilePath file = getFilePath.getInstance();
	User user = (User) session.getAttribute("user");
	
	BeanDBManager.getInstance().setImageProfile(user.getUsername(), file.getFile());
%>
	
<script>
	location.href="main.html";
</script>

</body>
</html>