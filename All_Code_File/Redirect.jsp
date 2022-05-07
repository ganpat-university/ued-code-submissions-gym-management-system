<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Redirecting...</title>
<jsp:include page="head_content.jsp"></jsp:include>
</head>
<body>
	<div class="container d-flex align-items-center flex-column p-5 justify-content-center text-center" style="min-height: 96vh;">
		<h3 class="display-3 text-success">Redirecting You to Login Page...</h3><br>
		<a href="login.html" class="btn btn-outline-success">Go-To Login Page</a>
	</div> 	
	<% response.setHeader("Refresh", "2;login.html"); %>
	
</body>
</html>