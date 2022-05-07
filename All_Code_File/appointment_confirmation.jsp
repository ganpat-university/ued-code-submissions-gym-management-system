
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
<jsp:include page="head_content.jsp"></jsp:include>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="all_status" dataSource="${con}">
	select * from trainer_user where U_email=?;
	<sql:param value="${obj.email }"></sql:param>
</sql:query>

<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid dashboard">
        <div class="row user_head">
          <div class="col-12">
            <div class="title-heading ">
              <h4>Your Appointment Status List</h4>
            </div>
          </div>
        </div>
        <div class="row user_content">
          <div class="col-3">MY EMAIL</div>
          <div class="col">TRAINER</div>
          <div class="col">SPECIALIST</div>
          <div class="col">DATE</div>
          <div class="col">STATUS</div>
	          <div class="col">TIME</div>
	          <div class="col-3">LINK</div>
        </div>
        <c:forEach var="query" items="${all_status.rows}">
          <div class="row user_detail">          
            <div class="col-3 user_details">
              <c:set var="u_email" value="${query.U_Email}"></c:set>
              <c:out value="${u_email}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="trainer_name" value="${query.T_Name}"></c:set>
              <c:out value="${trainer_name}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="specialist" value="${query.T_Specialist}"></c:set>
              <c:out value="${specialist}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="dates" value="${query.Meeting_D}"></c:set>
              <c:out value="${dates}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="status" value="${query.Status}"></c:set>
              <c:out value="${status}"></c:out>
            </div>
<%--             <c:if test="${status eq 'approved' }"> --%>
	            <div class="col user_details">
	              <c:set var="time" value="${query.Time}"></c:set>
	              <c:out value="${time}"></c:out>
	            </div>
	            <div class="col-3 user_details">
	              <c:set var="link" value="${query.M_Link}"></c:set>
	              <c:out value="${link}"></c:out>
	            </div>
<%--             </c:if> --%>
          </div>
        </c:forEach>
      </div> 
</body>
</html>