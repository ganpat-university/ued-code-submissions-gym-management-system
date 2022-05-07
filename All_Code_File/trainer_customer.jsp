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
<title>Trainer-Customer</title>
<jsp:include page="head_content.jsp"></jsp:include>
<style type="text/css">
	#send_response_user_trainer{
		display: none;
	}
</style>
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="user_trainer" dataSource="${con}">
	SELECT * FROM ued.trainer_user as t_u inner join ued.login_user_details as l_u_d on t_u.T_Name=l_u_d.Username where l_u_d.Email=?;
  	<sql:param value="${obj.email }"></sql:param>
</sql:query>

    <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid dashboard">
      <div class="container">
        <div class="row user_head">
          <div class="offset-3 col-5">
            <div class="title-heading ">
              <h4>ALL USER DETAILS</h4>
            </div>
          </div>
<!--           <div class="col-4 title-heading "> -->
<!--             <form action="search_user_trainer" method="post"> -->
<!--           	<input type="text" id="search" onclick="search_func()" class="search" name="search_value" placeholder="Search........" required autocomplete="off"> -->
<!--             <label for="search"><i class="fa fa-search"></i></label> -->
<!--             <input type="submit" id="submit" value="search"> -->
<!--             </form> -->
<!--           </div> -->
        </div>
        <div class="row user_content">
          <div class="col">USER NAME</div>
          <div class="col-3">EMAIL </div>
          <div class="col">DATE </div>
          <div class="col">STATUS </div>
          <div class="col">ACCEPT </div>
          
        </div>
		<form action="trainer_customer_approved.jsp">
        <c:forEach var="query" items="${user_trainer.rows}">
          <div class="row user_detail">
          
            <div class="col user_details">
              <c:set var="names" value="${query.U_name}"></c:set>
              <c:out value="${names}"></c:out>
            </div>
            <div class="col-3 user_details">
              <c:set var="email" value="${query.U_Email}"></c:set>
              <c:out value="${email}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="meeting_date" value="${query.Meeting_D}"></c:set>
              <c:out value="${meeting_date}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="status" value="${query.Status}"></c:set>
              <c:out value="${status}"></c:out>
            </div>
            <c:if test="${status eq 'pending' }">
	            <div class="col user_details">
              	  <c:set var="t_name" value="${query.Username}"></c:set>
	              <input type="hidden" name="name" value="${names }">
	              <input type="hidden" name="email" value="${email }">
	              <input type="hidden" name="t_name" value="${t_name }">
	              <input type="submit" value="ACCEPT" class="bg-transparent text-success m-0 pl-2 " style="width:auto;"><i class="fa fa-hand-pointer-o"></i>
	            </div>
          	</c:if>
          <c:if test="${status eq 'approved' }">
          	<div class="col user_details">
              accepted
            </div>
          </c:if>
          </div>
        </c:forEach>
        </form>
      </div> 
    </div>
</body>
  <script>
    function search_func(){
      document.getElementById("submit").style.display="inline-block";
    }
  </script>
</html>