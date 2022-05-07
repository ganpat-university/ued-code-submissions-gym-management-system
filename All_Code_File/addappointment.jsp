<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Adding Appointment</title>
    <jsp:include page="head_content.jsp"></jsp:include>
    <link rel="stylesheet" href="course.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
    <style type="text/css">
    	body label{
    		font-size: 19px;
    	}
    </style>
  </head>
  <body id="appointment">
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="user_trainer" dataSource="${con}">
	select * from trainer_details;
</sql:query>
<sql:query var="getname" dataSource="${con}">
	select * from login_user_details where Email=? and Password=?;
  	<sql:param value="${obj.email }"></sql:param>
  	<sql:param value="${obj.pass }"></sql:param>
</sql:query>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid section-pad">
      <div class="container appointment">
        <div  class="row m-0 d-flex justify-content-center align-items-center p-5">
          <form action="appointment_java.jsp" method="post">
            <div class="row">
              <div class="col-5">
                <label for="u_name">Name</label>
              </div>
              <div class="col-7">
                <h4><c:forEach var="getdata" items="${getname.rows}">
                	<c:set var="xyz" value="${getdata.Username }"></c:set>
                	<c:out value="${xyz }"></c:out>
                </c:forEach></h4>
                <input type="hidden" name="u_name" value="${xyz }">
              </div>
            </div>
            <div class="row">
              <div class="col-5">
                <label for="u_email">Email</label>
              </div>
              <div class="col-7">
                <h4><c:forEach var="getdata" items="${getname.rows}">
                	<c:set var="xyz" value="${getdata.Email }"></c:set>
                	<c:out value="${xyz }"></c:out>
                <input type="hidden" name="u_email" value="${xyz }">
                </c:forEach></h4>
              </div>
            </div>
            <div class="row">
              <div class="col-5">
                <label for="option_trainer_name">Trainer-Specialist</label>
              </div>
              <div class="col-7">
                <select name="option_trainer_name" required autocomplete="off">
                	<option value="none" selected disabled hidden >Trainer [ Specialist ]</option>
                  <c:forEach var="query" items="${user_trainer.rows}">
                  	<option value="${query.Name }+${query.Specialist}">
                  		<c:set var="t_name" value="${query.Name }"></c:set>
                  		<c:out value="${t_name }"></c:out>
                  		<c:set var="t_specialist" value="${query.Specialist}"></c:set>
                  		&nbsp;&nbsp;[ <c:out value="${t_specialist }"></c:out> ]
	                </option>                  	
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col-5">
                <label for="id_picker">Date</label>
              </div>
              <div class="col-7">
                <input type="date" id="date_picker" name="dates" required autocomplete="off">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <input type="submit" value="Request">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
  <script language="javascript">
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    $('#date_picker').attr('min',today);
    </script>
</html>
