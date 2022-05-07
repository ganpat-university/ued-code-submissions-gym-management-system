<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Redirecting...</title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
  crossorigin="anonymous"
/>
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
  crossorigin="anonymous"
/>
<style type="text/css">
	*{
		font-family: 'Poppins',sans-serif;
	}
</style>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<c:set var="emails" value="${obj.c_email }"></c:set>
<c:set var="mobile_number" value="${param.mobile_number}"></c:set>
<c:set var="other_details" value="${param.other_details}"></c:set>
<c:set var="trainer_specialist" value="${param.trainer_specialist}"></c:set>
<c:set var="achievement" value="${param.achievement}"></c:set>
<sql:update var="sql_insert" dataSource="${con}">
  	update trainer_details set Specialist=?,Achievement=?,Mobile_Number=?,Trainer_Desc=?,Trainer_Approved="pending" where Email=?;
  	<sql:param value="${trainer_specialist}"></sql:param>
  	<sql:param value="${achievement}"></sql:param>
  	<sql:param value="${mobile_number}"></sql:param>
  	<sql:param value="${other_details}"></sql:param>
  	<sql:param value="${emails}"></sql:param>
</sql:update>
<div class="container d-flex align-items-center flex-column p-5 justify-content-center text-center" style="min-height: 96vh;">
	<h5 class="display-3 text-success">Register Successfully All Details</h5>
	<h6 class="display-3 text-success">Redirecting You to Login Page...</h6><br>
	<a href="login.html" class="btn btn-outline-success">Go-To Login Page</a>
</div> 	
<!-- changes occur login.html -> Redirect.jsp -->
<% response.setHeader("Refresh", "2;login.html"); %>

	
</body>
</html>