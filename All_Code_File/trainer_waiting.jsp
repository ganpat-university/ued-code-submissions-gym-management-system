<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trainer Waiting</title>
<jsp:include page="head_content.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="style1.css" />
    <style>
    	body{
    		background: #dfdfdf;
    	}
    	.t_wait_body{
    		min-height:92vh;
    	}
    	.t_wait_body a{
    		border-radius:15px;
    	}
    	#header .a_css li{
    		list-style: none;
    	}
    	#header .a_css li a{
    		color:#11111f;
    	}
    	#header .a_css li a:hover{
    		color:#222;
    		text-decoration:none;
    		background: none;
    	}
    	#header .a_css li a h5{
    		margin:0;
    	}
    	.home_content .col-6,.col-12,.col-4{
    		border:1px solid #aaa;
    	}
    </style>
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
</head>
<body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<c:set var="emails" value="${obj.email }"></c:set>
<sql:query var="fecth_query" dataSource="${con}">
  	select * from trainer_details where Email=?;
  	<sql:param value="${emails}"></sql:param>
</sql:query>
	<div id="header">
      <div class="container clearfix">
        <div class="row">
          <div class="col-2 logo">
            <a href="#"><h4>FIT-GAINER</h4></a>
          </div>

          <div class="offset-6 col-4 a_css">
            <ul class="nav float-right">
              <li><a href="#"><h5>Trainer Confirmation</h5></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
	<div class="container-fluid bg-warning t_wait_body">
      <div class="container trainer_add_on">
      	<div class="row d-flex p-1 pt-5 justify-content-center bg-warning align-items-center">
      		<div class="col d-flex justify-content-center align-items-center">
      			<h4>STATUS</h4>
      		</div>
      		<div class="col d-flex justify-content-center text-capitalize align-items-center">
      			<c:forEach var="querys" items="${fecth_query.rows}">
	              	<c:set var="status" value="${querys.Trainer_Approved}"></c:set>
      				<c:if test="${status eq 'pending'}">
	              		<h5 class=" text-danger "><c:out value="${status}"></c:out></h5>
	              	</c:if>
	              	<c:if test="${status eq 'approved'}">
	              		<h5 class="text-success"><c:out value="${status}"></c:out></h5>
	              	</c:if>
	            </c:forEach>
      		</div>
      	</div>
      	<c:if test="${status eq 'pending'}">
      	<div class="row d-flex p-1 pt-4 justify-content-center align-items-center">
      		<div class="col d-flex justify-content-center align-items-center">
      			<h5>Trainer have to wait for Approval from Admin Side</h5>  
      		</div>
      	</div>  
      	
      	<div class="row d-flex p-1 pt-4 justify-content-center align-items-center">
      		<div class="col d-flex justify-content-center align-items-center">
      			<h4 class="">ABOUT OUR WEBSITE</h4>
      		</div>
      	</div>
      	
		<div class="container-fluid home_content">
			<div class="row bg-danger">
			
			  <div class="col-8 bg-primary">
			  	<div class="row">
				  <div class="col-6">
					<div class="row title-heading p-2">
						Heading-1					
					</div>
					<div class="row">
						<p class="p-3 m-0 text-warning">We provide paid courses, memberships, Exercise related information, gym related equipment etc.</p>
					</div>
				  </div>
				  <div class="col-6">
				  	<div class="row title-heading p-2">
						Heading-2
					</div>
					<div class="row">
						<p class="p-3 m-0 text-warning">We provide paid courses, memberships, Exercise related information, gym related equipment etc.</p>
					</div>
				  </div>
				</div>
				<div class="row">
			  		<div class="col-12">
						<div class="row title-heading">
						Heading-1
						</div>
					</div>
				</div>
			  </div>			
			  <div class="col-4">6 of 6</div>
			</div>
		</div>	
      	</c:if>
      	<c:if test="${status eq 'approved'}">
      	<div class="row d-flex p-1 pt-4 justify-content-center align-items-center">
      		<div class="col d-flex justify-content-center align-items-center">
      			<h4>Now Trainer have access to make some effective content into our Website</h4>  
      		</div>
      	</div>
      	<div class="row d-flex p-1 pt-4 justify-content-center align-items-center">
      		<div class="col d-flex justify-content-center align-items-center">
      			<h5><a href="trainer_dashboard.jsp" class="text-success p-3 bg-light">Go For Login <i class="fa fa-arrow-circle-right"></i></a></h5>
      		</div>
      	</div>
      	</c:if>
      	
      </div>
    </div>
</body>
</html>