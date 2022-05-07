<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approved Page</title>
<jsp:include page="head_content.jsp"></jsp:include>
<style type="text/css">
	input[type=checkbox]{
		width:auto;
	}
</style>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="alluser" dataSource="${con}">
	select * from trainer_details order by Trainer_Approved="pending";
</sql:query>
    <div class="container-fluid dashboard">
<!--       <div class="container"> -->
        <div class="row user_head">
          <div class="offset-3 col-5">
            <div class="title-heading ">
              <h4>ALL TRAINER DETAILS</h4>
            </div>
          </div>
          <div class="col-4 title-heading ">
            <form action="searchtrainer" method="post">
          	<input type="text" id="search" onclick="search_func()" class="search" name="search_value" placeholder="Search........" required autocomplete="off">
            <label for="search"><i class="fa fa-search"></i></label>
            <input type="submit" id="submit" value="search">
            </form>
          </div>
        </div>
        <div class="row user_content" style="font-size: 22px;">
          <div class="col">Tr. NAME</div>
          <div class="col-3">EMAIL </div>
          <div class="col">SPECIALIST</div>
          <div class="col-2">MOBILE NO.</div>
          <div class="col">STATUS</div>
          <div class="col">PERMISSION</div>
        </div>
        <%! int i=0; %>
        <form action="status_update" method="post">
        <c:forEach var="query" items="${alluser.rows}">
          <div class="row user_detail">
          
            <div class="col user_details">
              <c:set var="names" value="${query.Name}"></c:set>
              <c:out value="${names}"></c:out>
            </div>
            <div class="col-3 user_details">
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
	        <div class="col user_details sp_btn">
	        	<c:if test="${query.Trainer_Approved eq 'pending'}">
	              	<input type="checkbox" id="check_box" name="Choice<%=i %>"  value="${query.Email }">
	              	<% i=i+1; %>
	        	</c:if>
	        	<c:if test="${query.Trainer_Approved eq 'approved'}">
	              	<i class="fa fa-check text-success"></i>
	        	</c:if>
	        </div>
          </div>
        </c:forEach>
        	<div class="offset-10 col user_details">
          		<input type="submit" value="Update">
          	</div>
        </form>
      </div> 
<!--     </div> -->
	<div class="container-fluid dashboard">
<!--       <div class="container"> -->
        <div class="row user_head">
          <div class="offset-3 col-5">
            <div class="title-heading ">
              <h4>ALL TRAINER DETAILS</h4>
            </div>
          </div>
          <div class="col-4 title-heading ">
            <form action="searchtrainer" method="post">
          	<input type="text" id="search" onclick="search_func()" class="search" name="search_value" placeholder="Search........" required autocomplete="off">
            <label for="search"><i class="fa fa-search"></i></label>
            <input type="submit" id="submit" value="search">
            </form>
          </div>
        </div>
        <div class="row user_content" style="font-size: 22px;">
          <div class="col">Tr. NAME</div>
          <div class="col-3">EMAIL </div>
          <div class="col">SPECIALIST</div>
          <div class="col-2">MOBILE NO.</div>
          <div class="col">STATUS</div>
          <div class="col">DELETE</div>
        </div>
        <%! int j=0; %>
        <form action="status_deletes" method="post">
        <c:forEach var="query" items="${alluser.rows}">
          <div class="row user_detail">
          
            <div class="col user_details">
              <c:set var="names" value="${query.Name}"></c:set>
              <c:out value="${names}"></c:out>
            </div>
            <div class="col-3 user_details">
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
	        <div class="col user_details sp_btn">
              	<input type="checkbox" id="check_box" name="Choice<%=j %>"  value="${query.Email }">
              	<% j=j+1; %>
	        </div>
          </div>
        </c:forEach>
        	<div class="offset-10 col user_details">
          		<input type="submit" value="Delete">
          	</div>
        </form>
      </div> 
</body>
  <script>
    function search_func(){
      document.getElementById("submit").style.display="inline-block";
    }
  </script>
</html>