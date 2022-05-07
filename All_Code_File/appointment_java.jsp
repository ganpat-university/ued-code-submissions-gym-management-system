<%@page import="all_logic.validation_getter_setter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment | Confirmation</title>
<jsp:include page="head_content.jsp"/>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:update var="all_status" dataSource="${con}">
	insert into trainer_user(U_Name,U_Email,T_Name,T_Specialist,Meeting_D,Status) values(?,?,?,?,?,"pending");
	<sql:param value="${param.u_name }"></sql:param>
	<sql:param value="${param.u_email }"></sql:param>
	<c:set var="name_spe" value="${param.option_trainer_name}"></c:set>	                  	
	<c:set var = "string1" value = "${fn:split(name_spe, '+')}"/>
	<sql:param value="${string1[0]}"></sql:param>
	<sql:param value="${string1[1]}"></sql:param>
	<sql:param value="${param.dates }"></sql:param>
</sql:update>
<div class="container d-flex align-items-center flex-column p-5 justify-content-center text-center" style="min-height: 96vh;">
	<h5 class="display-3 text-success">Appointment Registration is Done<br>Wait for Approval!!!</h5><br>
	<a href="user_dashboard.jsp" class="btn btn-outline-success">Redirecting to Home Page</a>
</div> 	
<% response.setHeader("Refresh", "2;user_dashboard.jsp"); %>

</body>
</html>