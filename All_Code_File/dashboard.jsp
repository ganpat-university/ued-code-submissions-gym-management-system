<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>DASHBOARD</title>    
    <jsp:include page="head_content.jsp"></jsp:include>
    <link rel="stylesheet" href="style1.css" />
  </head>
  <body>	
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="coursen" dataSource="${con}">
	select * from course where Email=?;
	<sql:param value="${obj.email}"></sql:param>
</sql:query>

<sql:query var="total_amount" dataSource="${con}">
	SELECT sum(Amount) as total FROM ued.course where Email=?;
	<sql:param value="${obj.email}"></sql:param>
</sql:query>

    <jsp:include page="header.jsp"></jsp:include>

    <div class="container-fluid dashboard">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="title-heading ">
              <h4>DASH BOARD</h4>
            </div>
          </div>
        </div>
        <div class="row dashboard_content">
          <div class="col">COURSE NAME</div>
          <div class="col">BILLING AMOUNT</div>
        </div>
        <hr>
        <c:forEach var="query" items="${coursen.rows}">
          <div class="row dashboard_content">
            <div class="col-6 course_name">
              <c:set var="names" value="${query.course_name}"></c:set>
              <c:out value="${names}"></c:out>
            </div>
            <div class="col course_name">
              <c:set var="amt" value="${query.Amount}"></c:set>
              <c:out value="${amt}"></c:out>
            </div>
          </div>
          <hr>
        </c:forEach>
        <hr>
        <div class="row d-flex justify-content-end dashboard_content">
          <div class="offset-md-6 col-2" style="color: aliceblue;">Total&nbsp;</div>
          <div class="col-2 ">
	          <c:forEach var="query2" items="${total_amount.rows}">
	            <c:set var="t_amt" value="${query2.total}"></c:set>
	            <c:out value="${t_amt}"></c:out>
	          </c:forEach>
          </div>
          <div class="col-2"></div>
        </div>
      </div> 
    </div>
  </body>
</html>
