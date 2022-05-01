<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PRODUCT | JSP</title>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<c:set var="product_link" value="${param.product_link}"></c:set>
<c:set var="product_desc" value="${param.product_desc}"></c:set>
<c:set var="photo_link" value="${param.photo_link}"></c:set>
<sql:update var="sql_insert" dataSource="${con}">
  	insert into product_details values(?,?,?);
  	<sql:param value="${product_link}"></sql:param>
  	<sql:param value="${photo_link}"></sql:param>
  	<sql:param value="${product_desc}"></sql:param>
</sql:update>
<%
	response.sendRedirect("trainer_dashboard.jsp");
%>

</body>
</html>