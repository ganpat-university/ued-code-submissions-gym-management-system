<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses | JSP</title>
</head>
<body>
	<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<c:set var="course_name" value="${param.course_name}"></c:set>
<c:set var="course_desc" value="${param.course_desc}"></c:set>
<c:set var="course_link" value="${param.course_link}"></c:set>
<c:set var="course_price" value="${param.course_price}"></c:set>
<sql:update var="sql_insert" dataSource="${con}">
  	insert into courses_details values(?,?,?,?);
  	<sql:param value="${course_name}"></sql:param>
  	<sql:param value="${course_desc}"></sql:param>
  	<sql:param value="${course_link}"></sql:param>
  	<sql:param value="${course_price}"></sql:param>
</sql:update>
<%
	response.sendRedirect("trainer_dashboard.jsp");
%>
</body>
</html>