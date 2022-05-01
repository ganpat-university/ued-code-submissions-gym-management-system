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
  </head>
  <body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>


<sql:query var="alluser" dataSource="${con}">
	select * from login_user_details where Username = ? or Email = ? or Profile = ? or Gender = ?;
	<sql:param value="${obj2.data_search}"></sql:param>
	<sql:param value="${obj2.data_email}"></sql:param>
	<sql:param value="${obj2.data_profile}"></sql:param>
	<sql:param value="${obj2.data_gender}"></sql:param>
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
          <div class="col-4 title-heading ">
            <a href="user.jsp" style='color:#fff; '><i class='fa fa-arrow-circle-left'></i> Back User list</a>
          </div>
        </div>
        <div class="row user_content">
          <div class="col">USER NAME</div>
          <div class="col">EMAIL </div>
          <div class="col">PROFILE </div>
          <div class="col">GENDER </div>
        </div>
        <c:forEach var="query" items="${alluser.rows}">
          <div class="row user_detail">
          
            <div class="col user_details">
              <c:set var="names" value="${query.Username}"></c:set>
              <c:out value="${names}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="email" value="${query.Email}"></c:set>
              <c:out value="${email}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="profile" value="${query.Profile}"></c:set>
              <c:out value="${profile}"></c:out>
            </div>
            <div class="col user_details">
              <c:set var="gender" value="${query.Gender}"></c:set>
              <c:out value="${gender}"></c:out>
            </div>
          </div>
        </c:forEach>
      </div> 
    </div> 
</body>
  <script>
    function search_func(){
      document.getElementById("submit").style.display="inline-block";
    }
  </script>
</html>