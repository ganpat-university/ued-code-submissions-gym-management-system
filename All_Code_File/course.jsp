<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course-Backend | Page</title>
</head>
<body>
<!-- This data comes from muscular / weight lifting etc -->

<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<!-- get value from login page (get email ) -->
<c:set var="email" value="${obj.email}"></c:set>
<!-- get value from previous page -->
<c:set var="course_n" value="${param.coursename}"></c:set>
<c:set var="amount" value="${param.amount}"></c:set>
<sql:update var="sql_insert" dataSource="${con}">
  	insert into course values(?,?,?);
  	<sql:param value="${email}"></sql:param>
  	<sql:param value="${course_n}"></sql:param>
  	<sql:param value="${amount}"></sql:param>
</sql:update>
<%
	RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
	rd.include(request, response);
%>

</body>
</html>