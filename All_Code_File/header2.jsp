<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>HEADER</title>
    <link rel="stylesheet" href="style1.css" />
  </head>
  <body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="getname" dataSource="${con}">
	select * from login_user_details where Email=? and Password=?;
  	<sql:param value="${obj.email }"></sql:param>
  	<sql:param value="${obj.pass }"></sql:param>
</sql:query>
    <div id="header">
      <div class="container clearfix">
        <div class="row">
          <div class="col-2 logo">
            <a href="" id="homes" onclick="check_validation()"><h4>FIT-GAINER</h4></a>
          </div>
          <div class="col-8 menu">
            <ul class="float-right nav">
              <li class="menu-list">
                <a href="" id="h1" onclick="check_validation()">
                  Home<span class="px-2"> <i class="fa fa-home"> </i> </span
                ></a>
              </li>
              <li>
                <a href="" id="h2" onclick="check_validation()"
                  >Courses<span class="px-2"> <i class="fa fa-book"> </i> </span
                ></a>
              </li>
              <li>
                <a href="" id="h3" onclick="check_validation()"
                  >Product<span class="px-2">
                    <i class="fa fa-cart-arrow-down"> </i> </span
                ></a>
              </li>
              <li>
                <a href="" id="h4" onclick="check_validation()"
                  >About<span class="px-2">
                    <i class="fa fa-user-circle-o"> </i> </span
                ></a>
              </li>
              <li>
                <a href="" id="h5" onclick="check_validation()"
                  >Contact Us<span class="px-2">
                    <i class="fa fa-phone"> </i> </span
                ></a>
              </li>
            </ul>
          </div>
          <div class="col-2">
            <ul class="nav_floating_menu float-right">
              <li class="has-dropdown">
                <a class="user_profile">
                  <c:forEach var="querys" items="${getname.rows}">
                    <c:set var="names" value="${querys.Username}"></c:set>
                    <c:out value="${names}"></c:out>
                    <c:set var="profile_data" value="${querys.Profile }"></c:set> 
                  </c:forEach>
                  <i class="fa fa-user-circle-o"></i>
                <span class="fa fa-caret-down"></span>
                <ul style="z-index: 10;">
                  <li><a href="a_profile.jsp">Profile</a></li>
                  <li><a href="user.jsp">User</a></li>
                  <li><a href="trainer_approved.jsp">Approved</a></li>                  
                  <li>
	                  <form action="log_out.jsp">
	                  <input type="submit" value="Sign Out"></form>
                  </li>
                </ul>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div id="profile" style="display:none;"><c:out value="${profile_data}"></c:out></div>
  </body>
  <script type="text/javascript">
  function check_validation() {
      var profiles = document.getElementById("profile");
      var pro_data=profiles.innerHTML;
      if(pro_data=="user"){
    	  document.getElementById("homes").setAttribute("href", "user_dashboard.jsp")
    	  document.getElementById("h1").setAttribute("href", "user_dashboard.jsp")
    	  document.getElementById("h2").setAttribute("href", "user_dashboard.jsp")
    	  document.getElementById("h3").setAttribute("href", "user_dashboard.jsp")
    	  document.getElementById("h4").setAttribute("href", "user_dashboard.jsp")
    	  document.getElementById("h5").setAttribute("href", "user_dashboard.jsp")
      }else if(pro_data=="trainer"){
    	  document.getElementById("homes").setAttribute("href", "trainer_dashboard.jsp")
    	  document.getElementById("h1").setAttribute("href", "trainer_dashboard.jsp")
    	  document.getElementById("h2").setAttribute("href", "trainer_dashboard.jsp")
    	  document.getElementById("h3").setAttribute("href", "trainer_dashboard.jsp")
    	  document.getElementById("h4").setAttribute("href", "trainer_dashboard.jsp")
    	  document.getElementById("h5").setAttribute("href", "trainer_dashboard.jsp")
      }else{
    	  document.getElementById("homes").setAttribute("href", "admin_dashboard.jsp")
    	  document.getElementById("h1").setAttribute("href", "admin_dashboard.jsp")
    	  document.getElementById("h2").setAttribute("href", "admin_dashboard.jsp")
    	  document.getElementById("h3").setAttribute("href", "admin_dashboard.jsp")
    	  document.getElementById("h4").setAttribute("href", "admin_dashboard.jsp")
    	  document.getElementById("h5").setAttribute("href", "admin_dashboard.jsp")
      }
    }
  </script>
</html>
