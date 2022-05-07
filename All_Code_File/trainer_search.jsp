<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DASHBOARD</title>
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
    <link rel="stylesheet" href="style1.css" />
    <style type="text/css">
    	input[type=checkbox]{
			width:auto;
		}
    </style>
  </head>
  <body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>


<sql:query var="alltrainer" dataSource="${con}">
	select * from trainer_details where Name = ? or Email = ? or Specialist = ? or Mobile_Number = ? or Trainer_Approved = ?;
	<sql:param value="${obj3.t_name}"></sql:param>
	<sql:param value="${obj3.t_email}"></sql:param>
	<sql:param value="${obj3.t_specialist}"></sql:param>
	<sql:param value="${obj3.t_mb_number}"></sql:param>
	<sql:param value="${obj3.t_approved}"></sql:param>
</sql:query>
    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="container-fluid dashboard">
      <div class="container">
        <div class="row user_head">
          <div class="offset-3 col-5">
            <div class="title-heading ">
              <h4>ALL TRAINER DETAILS</h4>
            </div>
          </div>
          <div class="col-4 title-heading ">
            <a href="trainer_approved.jsp" style='color:#fff; '><i class='fa fa-arrow-circle-left'></i> Back User list</a>
          </div>
        </div>
        <form action="status_update" method="post">
        <div class="row user_content">
          <div class="col">Tr. NAME</div>
          <div class="col-4">EMAIL </div>
          <div class="col">SPECIALIST</div>
          <div class="col-2">MOBILE NO.</div>
          <div class="col">STATUS</div>
          <div class="col">UPDATE</div>
        </div>
        <%! int i=0; %>
        <c:forEach var="query" items="${alltrainer.rows}">
          <div class="row user_detail">
          <div class="col user_details">
              <c:set var="names" value="${query.Name}"></c:set>
              <c:out value="${names}"></c:out>
            </div>
            <div class="col-4 user_details">
              <c:set var="email" value="${query.Email}"></c:set>
              <c:out value="${email}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="specialist" value="${query.Specialist}"></c:set>
              <c:out value="${specialist}"></c:out>
            </div>
            <div class="col-2 user_details">
              <c:set var="mb_number" value="${query.Mobile_Number}"></c:set>
              <c:out value="${mb_number}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="status" value="${query.Trainer_Approved}"></c:set>
              <c:out value="${status}"></c:out>
            </div>
           	<div class="col user_details">
        		<c:if test="${query.Trainer_Approved eq 'pending'}">
        			<input type="checkbox" value="${query.Email }" id="check_box" name="Choice<%=i %>" >
		          		<% i=i+1; %>
		        </c:if>
        	</div>
         </div>
        </c:forEach>
        <input type="submit" value="UPDATE" class="border-1 border-danger">
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