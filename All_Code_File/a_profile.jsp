<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Profile</title>
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
    <link rel="stylesheet" href="course.css" />
   	
  </head>
  <body>
    <sql:setDataSource
      var="con"
      driver="com.mysql.cj.jdbc.Driver"
      url="jdbc:mysql://localhost:3307/ued"
      user="root"
      password="gnu123"
    />
    <sql:query var="getname" dataSource="${con}">
      select * from login_user_details where Email=? and Password=?;
      <sql:param value="${obj.email }"></sql:param>
      <sql:param value="${obj.pass }"></sql:param>
    </sql:query>
    <jsp:include page="header2.jsp"></jsp:include>
    <div class="container-fluid profile_jsp">
      <div class="container">
        <div class="row d-flex align-items-center profile_b">
          <div class="col">
            <div class="title-heading profile_bg" style="clip-path: polygon(50% 0, 80% 15%, 100% 0, 90% 60%, 75% 85%, 50% 100%, 25% 85%, 10% 60%, 0 0, 20% 15%);wiidth:200px;height:120px;">
              <h4>Profile</h4>
            </div>
          </div>
        </div>
        <div class="container profile_jsp_box">
          <c:forEach var="query" items="${getname.rows}">
            <div class="row profile_jsp_content">
              <div class="col-4">Name</div>
              <div class="col">
                <c:set var="name" value="${query.Username}"></c:set
                ><c:out value="${name}"></c:out>
              </div>
            </div>
            <div class="row profile_jsp_content">
              <div class="col-4">Security Key</div>
              <div class="col">
                <c:set var="security" value="${query.Security_Key}"></c:set
                ><c:out value="${security}"></c:out>
              </div>
            </div>
            <div class="row profile_jsp_content">
              <div class="col-4">Gender</div>
              <div class="col">
                <c:set var="gender" value="${query.Gender}"></c:set
                ><c:out value="${gender}"></c:out>
              </div>
            </div>
            <div class="row profile_jsp_content">
              <div class="col-4">Email</div>
              <div class="col">
                <c:set var="email" value="${query.Email}"></c:set
                ><c:out value="${email}"></c:out>
              </div>
            </div>
            <div class="row profile_jsp_content">
              <div class="col-4">Profile</div>
              <div class="col">
                <c:set var="Profile" value="${query.Profile}"></c:set
                ><c:out value="${Profile}"></c:out>
              </div>
            </div>
          </c:forEach>
          <div class="row profile_jsp_content">
            <div class="col-4">Password</div>
            <div class="col-8">
              <form action="profile_pass.jsp" method="post">
                <div class="row">
                <div class="col-6">
                  <input type="password" placeholder="Enter new password" name="pass"/>
                  <input type="hidden" name="email" value="${obj.email}">
                  <input type="hidden" name="profile" value="${Profile }">
                </div>
                <div class="col-6">
                  <input type="submit" />
                </div></div>
              </form>
            </div>
          </div>
        <div class="row text-danger">
        	<div class="col bg-success"><h6>If you want to change your password then your logged out and you have to login again...</h6></div>
        </div>
        </div>
      </div>
    </div>
    <div id="profile" style="display:none;"><c:out value="${profile_data}"></c:out></div>
  </body>
  <script type="text/javascript">

  
  </script>
</html>
