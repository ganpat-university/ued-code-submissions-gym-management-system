<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Diet JSP</title>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<c:set var="diet_name" value="${param.diet_name}"></c:set>
<c:set var="diet_desc" value="${param.diet_description}"></c:set>
<sql:update var="sql_insert" dataSource="${con}">
  	insert into diet_details values(?,?);
  	<sql:param value="${diet_name}"></sql:param>
  	<sql:param value="${diet_desc}"></sql:param>
</sql:update>
<%
	response.sendRedirect("trainer_dashboard.jsp");
%>

</body>
</html>