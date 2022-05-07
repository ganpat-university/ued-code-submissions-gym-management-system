<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%-- <%@ page errorPage="error_page.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MEETING FIXED</title>
<jsp:include page="head_content.jsp"></jsp:include>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:update var="user_trainer" dataSource="${con}">
	update trainer_user set Time = ? , M_Link = ? , Status="approved" where U_Name=? and U_Email=? and T_Name=?;
	<sql:param value="${param.time }"></sql:param>
	<sql:param value="${param.link }"></sql:param>
	<sql:param value="${param.d_s_name }"></sql:param>
	<sql:param value="${param.d_s_email }"></sql:param>
	<sql:param value="${param.t_names }"></sql:param>
</sql:update>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container d-flex align-items-center flex-column p-5 justify-content-center text-center" style="min-height: 96vh;">
		<h5 class="display-3 text-success">Redirecting You to User Approval Page...</h5><br>
		<a href="trainer_customer.jsp" class="btn btn-outline-success">Go to User Approval Page</a>
	</div> 	
	<% response.setHeader("Refresh", "2;trainer_customer.jsp"); %>
</body>
</html>