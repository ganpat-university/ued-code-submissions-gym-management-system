<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ACCEPT USER REQUEST</title>
<jsp:include page="head_content.jsp"></jsp:include>
<link rel="stylesheet" href="course.css" />
<style>
	body{
		background-color: rgb(2, 11, 41);
		color: antiquewhite;
		min-height:96vh;
	}
	.col{
		background-color: transparent;
		text-align: center;
	}
</style>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="user_trainer" dataSource="${con}">
	select * from trainer_user where U_Name=? and U_Email=? and T_Name=?;
	<sql:param value="${param.name }"></sql:param>
	<sql:param value="${param.email }"></sql:param>
	<sql:param value="${param.t_name }"></sql:param>
	
</sql:query>
	<jsp:include page="header.jsp"></jsp:include>
	 <div class="container-fluid section-pad pt-5">
		 <div class="container appointment pt-5">
			 <div class="row pt-5">
				 <div class="col pt-5">
					 <form action="trainer_customer_meeting_fixed.jsp">
					 <c:forEach var="getdata" items="${user_trainer.rows }">
						<div class="row">
							<div class="col-5">
								<label for="name">Name</label>
							</div>
							<div class="col-7">
								<c:set var="name" value="${getdata.U_Name }"></c:set>
								<c:out value="${name}"></c:out>
								<input type="hidden" value="${name }" name="d_s_name">
							</div>
						</div>
						<div class="row">
							<div class="col-5">
								<label for="name">Email</label>
							</div>
							<div class="col-7">
								<c:set var="email" value="${getdata.U_Email }"></c:set>
								<c:out value="${email}"></c:out>
								<input type="hidden" value="${email }" name="d_s_email">
							</div>
						</div>
						<div class="row">
							<div class="col-5">
								<label for="time">Time for Meeting</label>
							</div>
							<div class="col-7">
								<input type="time" name="time" id="time" required>
							</div>
						</div>
						<div class="row">
							<div class="col-5">
								<label for="time">Link</label>
							</div>
							<div class="col-7">
								<input type="text" name="link" id="link" required>
							</div>
						</div>
						<input type="hidden" name="t_names" value="${param.t_name }">
						</c:forEach>
						<div class="row ">
				        	<div class="col ">
				        	<input type="submit" value="Response">
				        	</div>
				 		</div>
					 </form>
				 </div>
			 </div>
		 </div>
	 </div>
</body>
</html>