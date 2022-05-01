<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback | Page</title>
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
    <link rel="stylesheet" href="style2.css" />
<style>
	.feedback h4{
	 text-transform: uppercase;
	 font-size: 20px;
	}
	.feedback .row:nth-child(odd){
	 	background: #dddddf;
	}
	.feedback .row:nth-child(even){
	 	background: #cacaca;
	}
</style>
</head>
<body id="feedback_body">
  <jsp:include page="header.jsp"></jsp:include>
  <sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="feedback_query" dataSource="${con}">
	select * from  user_feedback;
</sql:query>
  <div class="container-fluid feedback">
    <div class="container ">
      <c:forEach var="querys" items="${feedback_query.rows}">
        <div class="row">
          <div class="col-4">
          <h4>
            <c:set var="names" value="${querys.Name}"></c:set>
            <c:out value="${names}"></c:out>            
          </h4>
          </div>
          <div class="col-8">
            <p>
              <c:set var="desc" value="${querys.Comment}"></c:set>
              <c:out value="${desc }"></c:out><br>
            </p>
          </div>
        </div>
	    </c:forEach>
    </div>
   </div>
      
</body>
  <script>
    
  </script>
</html>