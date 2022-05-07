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
    <title>Additional Info</title>
	<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
    <style>
    	body{
    		background: #dfdfdf;
    	}
    	form{
    		padding:15px;
    		box-shadow:2px 2px 10px inset;
    		color:#222;
    	}
    	form .row{
    		padding:5px;
    		font-size: 18px;
    	}
    	.trainer_add form{
			width: 50%;
			text-align: center;
		}
		.trainer_add form .row,textarea{
			padding: 6px;
			margin-bottom: 10px;
		}
		.trainer_add form .row input{
			margin:0;
			padding: 5px;
		}
		form option{
			font-size: 16px;
		}
		textarea {
			margin-left:10px;
			border:1px solid grey;
			margin-right:10px;
			padding: 5px;
			width: 90%;
		}
		form input[type=submit]{
			width:300px;
		}
    </style>
  </head>
  <body class="trainer_add">
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/> 
<sql:query var="getname" dataSource="${con}">
	select * from trainer_details where Email=? and Name=?; 
  	<sql:param value="${obj.c_email }"></sql:param>
  	<sql:param value="${obj.c_name }"></sql:param>
</sql:query>
<sql:query var="get_list" dataSource="${con}">
	select * from trainer_admin; 
</sql:query>
    <div id="header">
      <div class="container clearfix">
        <div class="row">
          <div class="col-2 logo">
            <a href="#"><h4>FIT-GAINER</h4></a>
          </div>

          <div class="offset-6 col-4 ">
            <ul class="nav float-right">
              <!-- <li><a href="login.html">Login</a></li> -->
              <li><a href="#">Trainer Additional Info</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="container trainer_add_on">
      	<div class="row d-flex p-1 pt-4 justify-content-center align-items-center">
      		<div class="col d-flex justify-content-center align-items-center">
      			<h4>Please Provide Additional Information as You are Requesting for Trainer</h4>  
      		</div>
      	</div>
        <div class="row d-flex p-4 justify-content-center align-items-center">
          <div class="col d-flex p-4 justify-content-center align-items-center">
            <form action="d_t_add_info.jsp" method="post">
              <div class="row">
                <div class="col-6 text-center">
                  <label for="t_name">Name</label>
                </div>
                <div class="col-6 text-center">
                  <label for="t_email">Email</label>
                </div>
                
              </div>
              <div class="row">
                <div class="col-6 text-center" id="t_name">
                  <!-- print trainer name from trainer_details -->
				  <c:forEach var="querys" items="${getname.rows}">
	              	<c:set var="names" value="${querys.Name}"></c:set>
	              	<c:out value="${names}"></c:out> 
	              </c:forEach> 
                </div>
                <div class="col-6 text-center" id="t_email">
                  <!-- print trainer name from trainer_details -->
                  <c:forEach var="querys" items="${getname.rows}">
	              	<c:set var="emails" value="${querys.Email}"></c:set>
 	              	<c:out value="${emails}"></c:out> 
 	              </c:forEach> 
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <label for="mobile_number">Mobile No.</label>
                </div>
                <div class="col-8">
                  <input
                    type="text"
                    name="mobile_number"
                    required
                    placeholder="Enter Mobile Number"
                    autocomplete="off"                    
                  />
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <label for="trainer_specialist">Specialist</label>
                </div>
                <div class="col-8">
                  <select name="trainer_specialist">
                  	<c:forEach var="specialist" items="${get_list.rows }">
                  		<c:set var="Specialist2" value="${specialist.Specialist}"></c:set>
                  	<option value="${specialist.Specialist}">
 	              		<c:out value="${Specialist2}"></c:out> 
                  	</option>
                  	</c:forEach>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <label for="achievement">Achievement</label>
                </div>
                <div class="col-8">
                  <input
                    type="text"
                    id="achievement"
                    name="achievement"
                    required
                    autocomplete="off"
                    placeholder="Enter Higher Skill"
                  />
                </div>
              </div>
              <div class="col textarea-css">
                <textarea
                  placeholder="Enter Your Other Informative Details... "
                  name="other_details"
                ></textarea>
              </div>
              <div class="row">
                <div class="col">
                  <input type="submit"  value="Request For Trainer" />
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
