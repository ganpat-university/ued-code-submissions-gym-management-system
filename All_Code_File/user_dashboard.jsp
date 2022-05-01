<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>USER PAGE</title>    
    <jsp:include page="head_content.jsp"></jsp:include>
    <link rel="stylesheet" href="style1.css" />
    <link rel="stylesheet" href="style2.css" />
    <style type="text/css">
    	h4{
    		text-transform: uppercase;	
    	}
    </style>
  </head>
  <body>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3307/ued" user="root" password="gnu123"/>
<sql:query var="getname" dataSource="${con}">
	select * from login_user_details where Email=? and Password=?;
  	<sql:param value="${obj.email }"></sql:param>
  	<sql:param value="${obj.pass }"></sql:param>
</sql:query>
<sql:query var="add_diet_box" dataSource="${con}">
	select * from diet_details;
</sql:query>
<sql:query var="add_course_box" dataSource="${con}">
	select * from courses_details;
</sql:query>
<sql:query var="add_product_box" dataSource="${con}">
	select * from product_details;
</sql:query>
    <div id="header">
      <div class="container clearfix">
        <div class="row">
          <div class="col-2 logo">
            <a href="#"><h4>FIT-GAINER</h4></a>
          </div>
          <div class="col-7  menu">
            <ul class="float-right nav">
              <li class="menu-list">
                <a href="#">
                  Home
                  <span class="px-2"> <i class="fa fa-home"> </i> </span>
                </a>
              </li>
              <li>
                <a href="#course">Courses
                <span class="px-2"> <i class="fa fa-book"> </i> </span>
              </a>
              </li>
              <li>
                <a href="#product">Product
                <span class="px-2"> <i class="fa fa-cart-arrow-down"> </i> </span>
                </a>
              </li>
              <li>
                <a href="#about">About
                <span class="px-2"> <i class="fa fa-user-circle-o"> </i> </span>
                </a>
              </li>
              <li>
                <a href="#contact">Contact Us
                <span class="px-2"> <i class="fa fa-phone"> </i> </span>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-3">
            <ul class="nav_floating_menu float-right">
              <li class="has-dropdown">
                <a class="user_profile">
	              <c:forEach var="querys" items="${getname.rows}">
	              	<c:set var="names" value="${querys.Username}"></c:set>
	              	<c:out value="${names}"></c:out> 
	              </c:forEach>
	              <i class="fa fa-user-circle-o" ></i>
                <span class="fa fa-caret-down"></span>
                <ul>
                  <li><a href="profile.jsp">Profile</a></li>
                  <li><a href="dashboard.jsp">DashBoard</a></li>
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
    <div class="container-fluid" id="main">
      <div class="row">
        <div class="col-5 title">
          <h3>GYM Management Project
          </h3>
          <p >
            Bodybuilding is the use of progressive resistance exercise to
            control and develop one's muscles (muscle building) by muscle
            hypertrophy for aesthetic purposes.
            <br>
            <pre>                                         ~Internet Source</pre>
          </p>
        </div>
        <div class="col-7 main-bg bg-pic  "></div>
      </div>
    </div>
    <div id="course" class="container-fluid course title-container">
      <div class="row " >
        <div class="col py-3 title-heading"><h3>COURSES</h3></div>
      </div>
      <div class="container">
        <div class="row row-cols-3 courses-title" >

          <div class="col course-box" onclick="openForm()">
            <!-- <a href="muscular.jsp"> -->
              <div class="row course-img">
                <div class="col c-img">
                  <img src="poster-1.png" alt="image not found">
                </div>
              </div>
              <div class="row heading">
                <div class="col">
                  <h4>mUSCULAR</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui amet quibusdam corporis nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
            <!-- </a> -->
          </div>

          <div class="col  course-box"  onclick="openForm1()">
            <!-- <a href="#"> -->
              <div class="row course-img">
                <div class="col c-img">
                  <img src="poster-2.png" alt="image not found">
                </div>
              </div>
              <div class="row heading">
                <div class="col">
                  <h4>push up</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui amet quibusdam corporis nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
            <!-- </a> -->
          </div>

          <div class="col  course-box" onclick="openForm2()">
          <!-- <a href="#"> -->
            <div class="row course-img">
              <div class="col c-img">
                <img src="home-banner-2.png" alt="image not found">
              </div>
            </div>
            <div class="row heading">
              <div class="col">
                <h4>YOGA</h4>
              </div>
            </div>
            <div class="row paragraph">
              <div class="col"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui amet quibusdam corporis nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</p></div>
            </div>
            <div class="row">
              <div class="col btn">
                <input type="submit" value="SUBMIT">
              </div>
            </div>
          <!-- </a> -->
          </div>

          <div class="col  course-box" onclick="openForm3()">
           <!--  <a href="#"> -->
              <div class="row course-img">
                <div class="col c-img">
                  <img src="home-banner-3.png" alt="image not found">
                </div>
              </div>
              <div class="row heading">
                <div class="col">
                  <h4>Weight Lifting</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui amet quibusdam corporis nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
            <!-- </a> -->
          </div>

          <div class="col  course-box" onclick="openForm4()">
            <!-- <a href="#"> -->
              <div class="row course-img">
                <div class="col c-img">
                  <img src="home-banner-4.png" alt="image not found">
                </div>
              </div>
              <div class="row heading">
                <div class="col">
                  <h4>THIGH EXERCISE</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui amet quibusdam corporis nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
            <!-- </a> -->
          </div>

          <div class="col  course-box" onclick="openForm5()">
          <!-- <a href=""> -->
            <div class="row course-img">
              <div class="col c-img">
                <img src="poster-2.png" alt="image not found">
              </div>
            </div>
            <div class="row heading">
              <div class="col">
                <h4>DOLA SOLA</h4>
              </div>
            </div>
            <div class="row paragraph">
              <div class="col"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui amet quibusdam corporis nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</p></div>
            </div>
            <div class="row">
              <div class="col btn">
                <input type="submit" value="SUBMIT">
              </div>
            </div>
          </div>
           <!-- FOR DYNAMIC COURSE BOX -->
           <c:forEach var="course_db" items="${add_course_box.rows }">
          	<c:set var="c_link" value="${course_db.Course_Link }"></c:set>
	          <div class="col  course-box" >
	          	<div class="row course-img">
	              <div class="col c-img">
	                <img src="${c_link }" alt="image not found">
	              </div>
	            </div>
	            <div class="row heading">
	              <div class="col">
	                <h4>
	                	<c:set var="get_c_name" value="${course_db.Course_Name }"></c:set>
	                	<c:out value="${get_c_name}"></c:out>
	                </h4>
	              </div>
	            </div>
	            <div class="row paragraph">
	              <div class="col"><p><c:set var="get_c_desc" value="${course_db.Course_Desc }"></c:set>
	                	<c:out value="${get_c_desc}"></c:out></p></div>
	            </div>
	            <div class="row">
	              <div class="col btn">
	                <input type="submit" value="SUBMIT">
	              </div>
	            </div>
	          </div>
          </c:forEach>
        </div>

        <!-- All Cousre Specification is here -->

        <!-- 1.  -->
        <div class="form-popup" id="myForm">
          <div class="row">
            <h3>Muscular</h3>
          </div>
          <div class="row p_content">
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit temporibus tempora, voluptatem corporis quisquam debitis error a molestias incidunt eveniet! Deserunt minima odit sapiente quaerat delectus accusamus eligendi soluta assumenda.
            </p>
          </div>
          <form action="course.jsp" method="post" class="form_cart">
            <div class="row">
              <div class="col-6">COURSE &nbsp;
                <input type="text" placeholder="Enter Course Name" name="coursename" required="required" autocomplete="off">
              </div>
              <div class="col-* test1">AMOUNT&nbsp;
                <select class="select" name="amount" required="required">  
                  <option value="30">30</option>
                </select>
              </div>
            </div>
            <div class="row btns">              
              <div class="col">
                <input type="submit" value="ADD TO CART">
              </div>
              <div class="col">
              <input type="submit" value="close" onclick="closeForm()"></input></div>
            </div>
          </form>
        </div>

        <!-- 2.  -->
        <div class="form-popup" id="myForm1">
          <div class="row">
            <h3>push UP</h3>
          </div>
          <div class="row p_content">
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit temporibus tempora, voluptatem corporis quisquam debitis error a molestias incidunt eveniet! Deserunt minima odit sapiente quaerat delectus accusamus eligendi soluta assumenda.
            </p>
          </div>
          <form action="course.jsp" method="post" class="form_cart">
            <div class="row">
              <div class="col-6">COURSE &nbsp;
                <input type="text" placeholder="Enter Course Name" name="coursename" required="required" autocomplete="off">
              </div>
              <div class="col-* test1">AMOUNT&nbsp;
                <select class="select" name="amount" required="required">  
                  <option value="20">20</option>
                </select>
              </div>
            </div>
            <div class="row btns">              
              <div class="col">
                <input type="submit" value="ADD TO CART">
              </div>
              <div class="col">
              <input type="submit" value="close" onclick="closeForm1()"></input></div>
            </div>
          </form>
        </div>

        <!-- 3.  -->
        <div class="form-popup" id="myForm2">
          <div class="row">
            <h3>YOGA</h3>
          </div>
          <div class="row p_content">
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit temporibus tempora, voluptatem corporis quisquam debitis error a molestias incidunt eveniet! Deserunt minima odit sapiente quaerat delectus accusamus eligendi soluta assumenda.
            </p>
          </div>
          <form action="course.jsp" method="post" class="form_cart">
            <div class="row">

              <div class="col-6">COURSE &nbsp;
                <input type="text" placeholder="Enter Course Name" name="coursename" required="required" autocomplete="off">
              </div>
              <div class="col-* test1">AMOUNT&nbsp;
                <select class="select" name="amount" required="required">  
                  <option value="25">25</option>
                </select>
              </div>
            </div>
            <div class="row btns">              
              <div class="col">
                <input type="submit" value="ADD TO CART">
              </div>
              <div class="col">
              <input type="submit" value="close" onclick="closeForm2()"></input></div>
            </div>
          </form>
        </div>

        <!-- 4.  -->
        <div class="form-popup" id="myForm3">
          <div class="row">
            <h3>Weight Lifting</h3>
          </div>
          <div class="row p_content">
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit temporibus tempora, voluptatem corporis quisquam debitis error a molestias incidunt eveniet! Deserunt minima odit sapiente quaerat delectus accusamus eligendi soluta assumenda.
            </p>
          </div>
          <form action="course.jsp" method="post" class="form_cart">
            <div class="row">
              <div class="col-6">COURSE &nbsp;
                <input type="text" placeholder="Enter Course Name" name="coursename" required="required" autocomplete="off">
              </div>
              <div class="col-* test1">AMOUNT&nbsp;
                <select class="select" name="amount" required="required">  
                  <option value="45">45</option>
                </select>
              </div>
            </div>
            <div class="row btns">              
              <div class="col">
                <input type="submit" value="ADD TO CART">
              </div>
              <div class="col">
              <input type="submit" value="close" onclick="closeForm3()"></input></div>
            </div>
          </form>
        </div>

        <!-- 5.  -->
        <div class="form-popup" id="myForm4">
          <div class="row">
            <h3>THIGH EXERCISE</h3>
          </div>
          <div class="row p_content">
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit temporibus tempora, voluptatem corporis quisquam debitis error a molestias incidunt eveniet! Deserunt minima odit sapiente quaerat delectus accusamus eligendi soluta assumenda.
            </p>
          </div>
          <form action="course.jsp" method="post" class="form_cart">
            <div class="row">

              <div class="col-6">COURSE &nbsp;
                <input type="text" placeholder="Enter Course Name" name="coursename" required="required" autocomplete="off">
              </div>

              <div class="col-* test1">AMOUNT&nbsp;
                <select class="select" name="amount" required="required">  
                  <option value="20">20</option>
                </select>
              </div>

            </div>
            <div class="row btns">              
              <div class="col">
                <input type="submit" value="ADD TO CART">
              </div>
              <div class="col">
              <input type="submit" value="close" onclick="closeForm4()"></input></div>
            </div>
          </form>
        </div>

        <!-- 6.  -->
        <div class="form-popup" id="myForm5">
          <div class="row">
            <h3>DOLA SOLA</h3>
          </div>
          <div class="row p_content">
            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugit temporibus tempora, voluptatem corporis quisquam debitis error a molestias incidunt eveniet! Deserunt minima odit sapiente quaerat delectus accusamus eligendi soluta assumenda.
            </p>
          </div>
          <form action="course.jsp" method="post" class="form_cart">
            <div class="row">

              <div class="col-6">COURSE &nbsp;
                <input type="text" placeholder="Enter Course Name" name="coursename" required="required" autocomplete="off">
              </div>

              <div class="col-* test1">AMOUNT&nbsp;
                <select class="select" name="amount" required="required">  
                  <option value="20">20</option>
                </select>
              </div>

            </div>
            <div class="row btns">              
              <div class="col">
                <input type="submit" value="ADD TO CART">
              </div>
              <div class="col">
              <input type="submit" value="close" onclick="closeForm5()"></input></div>
            </div>
          </form>
        </div>
        <!-- ending specification section -->

      </div>
      
    </div>
    <!-- ending of special section -->
<!-- course body completed -->

<!-- Diet Section -->

    <div class="container-fluid diet title-container">
      <div class="row">
        <div class="col py-3 title-heading">
          <h3>Diet Plan</h3>
        </div>
      </div>
      <div class="container">
        <div class="row row-cols-3">
          <div class="btn">
            <div class="col diet-box">
              <div class="row heading">
                <div class="col">
                  <h4>Healthy Diet</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col">
                  <ul>
                    <li style="list-style: circle;">Lorem ipsum dolor sit amet consectetur
                    <li style="list-style: circle;">Adipisicing elit. Qui amet quibusdam corporis</li><li>nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</li>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="btn">
            <div class="col diet-box">
              <div class="row heading">
                <div class="col">
                  <h4>Weight Loss Diet</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col">
                  <ul>
                    <li style="list-style: circle;">Lorem ipsum dolor sit amet consectetur
                    <li style="list-style: circle;">Adipisicing elit. Qui amet quibusdam corporis</li><li>nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</li>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="btn">
            <div class="col diet-box">
              <div class="row heading">
                <div class="col">
                  <h4>FAT Diet</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col">
                  <ul>
                    <li style="list-style: circle;">Lorem ipsum dolor sit amet consectetur
                    <li style="list-style: circle;">Adipisicing elit. Qui amet quibusdam corporis</li><li>nisi fuga possimus repellat voluptas esse consequuntur temporibus saepe</li>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!-- for dynamic diet boxes -->
          <c:forEach var="querys" items="${add_diet_box.rows}">
	          <div class="btn shows">
	            <div class="col diet-box">
	              <div class="row heading">
	                <div class="col">
	                  <h4>
		              	<c:set var="names" value="${querys.Diet_Name}"></c:set>
		              	<c:out value="${names}"></c:out> </h4>
	                </div>
	              </div>
	              <div class="row paragraph">
	                <div class="col">
	                  <ul>
	                  	<c:set var="desc" value="${querys.Descriptions}"></c:set>	                  	
	                  	<c:set var = "string1" value = "${fn:split(desc, '.')}"/>
	                  	<c:forEach var="i" begin="0" end="${fn:length(string1)-1 }">
	                  	<li style="list-style: circle;">
	                  	<c:out value="${string1[i]}"></c:out>
	                    </li></c:forEach>
	                  </ul>
	                </div>
	              </div>
	            </div>
	          </div>
	      </c:forEach>
        </div>
      </div>
    </div>
<!-- PRODUCT SECTION -->

    <div id="product" class="container-fluid product title-container">
      <div class="row">
        <div class="col py-3 title-heading">
          <h3>PRODUCT</h3>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-4 product_box">
            <a href="https://www.amazon.com/AmazonBasics-Rubber-Encased-Dumbbell-Weight/dp/B074DZ5YL9/ref=sr_1_1_sspa?keywords=Gym+Equipment&qid=1649036091&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyNTBPSk9FVTA2SVJOJmVuY3J5cHRlZElkPUEwMzc5MjI1MjhBU0FGMENLUkFOUCZlbmNyeXB0ZWRBZElkPUEwMTY4Nzg3MzJDQ0RWVFZOUzJNUCZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=" target="_blank">
            <img src="shop-12.png" alt="image not reload"></a>
          </div>
          <div class="col-8 product_box">
            <p class="paragraph">Lorem ipsum dolor, sit amet consectetur adipisicing elit. At quos eaque quisquam sapiente voluptatibus laudantium temporibus inventore fugiat consequatur? Odit!</p>
          </div>
        </div>
        <div class="row">
          <div class="col-8 product_box">
            <p class="paragraph">Lorem ipsum dolor, sit amet consectetur adipisicing elit. At quos eaque quisquam sapiente voluptatibus laudantium temporibus inventore fugiat consequatur? Odit!</p>
          </div>
          <div class="col-4 product_box"><a href="https://www.amazon.com/FLYBIRD-Adjustable-Foldable-Strength-Training/dp/B09B7C7TVJ/ref=sr_1_53?keywords=Gym+Equipment&qid=1649036091&sr=8-53" target="_blank">
            <img src="p-1.png" alt="image not reload">
          </a>
          </div>
        </div>
        <div class="row">
          <div class="col-4 product_box">
            <a href="https://www.amazon.com/Marcypro-Training-Recumbent-Exercisers-JX-7301/dp/B09BK7GLDG/ref=sr_1_2_sspa?keywords=Gym+Equipment&qid=1649236791&sr=8-2-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUFEQjlUMk5YR01EMEwmZW5jcnlwdGVkSWQ9QTA0NzE2OTMxRVJOSUNCTEtOTkpXJmVuY3J5cHRlZEFkSWQ9QTAzMjI2MjUzRThVMk9ZNVNUUjZPJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==" target="_blank"class="change_shape">
              <img src="shop-1.png" alt="image not reload">
            </a>
          </div>
          <div class="col-8 product_box">
            <p class="paragraph">Lorem ipsum dolor, sit amet consectetur adipisicing elit. At quos eaque quisquam sapiente voluptatibus laudantium temporibus inventore fugiat consequatur? Odit!</p>
          </div>
        </div>
        <!-- DYNAMIC PRODUCT SECTION -->
        <c:forEach var="querys" items="${add_product_box.rows}">
	        <div class="row">
	          <div class="col-4 product_box">
	          <c:set var="links" value="${querys.Product_Link}"></c:set>
	          <c:set var="p_links" value="${querys.Product_Photo}"></c:set>
	            <a href="${links }" target="_blank" class="product_a_tag change_shape">
	            	<img src="${p_links}" alt="image not found">
	            </a>
	          </div>
	          <div class="col-8 product_box">
	            <p class="paragraph">
	          <c:set var="descs" value="${querys.Product_Desc}"></c:set>
	          <c:out value="${descs}"></c:out>
	          </p>
	          </div>
	        </div>
        </c:forEach>

      </div>
    </div>

    <div id="about" class="container-fulid about">
      <div class="container">
        <div class="row">
          <div class="col py-3 title-heading">
            <h3>TESTIMONIAL</h3>
          </div>
        </div>
        <div class="row">
          <div class="container">
            <div class="row testimonial">
              <div class="content">
                <div class="testimonialBx">
                    <p>Lorem ipsum dolor sit, amet consectetur Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis necessitatitur consequuntur?endi pariatur! Ratione.? Minus maiores culpa similique nostrum fugit. Distinctio doloribus repudiandae, excepturi eum sapiente placeat non quidem minima facilis. </p>
                    <h3>Nirmal<br><span>Creative Designer</span></h3>
                </div>
                <div class="testimonialBx">
                    <p>Lorem ipsum dolor sit, amet consectetur Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis necessitatitur consequuntur?endi pariatur! Ratione.? Minus maiores culpa similique nostrum fugit. Distinctio doloribus repudiandae, excepturi eum sapiente placeat non quidem minima facilis. </p>
                    <h3>Nitish<br><span>Creative Designer</span></h3>
                </div>
                <div class="testimonialBx">
                    <p>Lorem ipsum dolor sit, amet consectetur Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis necessitatitur consequuntur?endi pariatur! Ratione.? Minus maiores culpa similique nostrum fugit. Distinctio doloribus repudiandae, excepturi eum sapiente placeat non quidem minima facilis. </p>
                    <h3>VIRANSHU<br><span>Creative Designer</span></h3>
                </div>
            </div>    
           </div>
          </div>
        </div>
      </div>
    </div>

    <div id="contact" class="container-fulid contact">
      <div class="container">
        <div class="row">
          <div class="col py-3 title-heading">
            <h3>Contact US</h3>
          </div>
        </div>
        <div class="row mh-50">
          <div class="col">
            <form action="feedback.jsp" method="post">
              <div class="row" >
                <div class="col-7 ">
                  
                  <div class="row">
                    <div class="offset-3 col-3 input_format">
                      <label for="pass">Name</label>
                    </div>
                    <div class="col-6"> 
                      <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter Your Name.."
                        required
                        autocomplete="off"
                      />
                    </div>
                  </div>
               	  <div class="row">
                    <div class="offset-3 col-3 input_format">
                      <label for="email">EMAIL</label>
                    </div>
                    <div class="col-6">
                      <input
                        type="email"
                        id="email"
                        name="email"
                        placeholder="Enter Your Email."
                        required
                        autocomplete="off"
                      />
                    </div>
                  </div>      
                </div>
                <div class="col-5 textarea-css">
                  <textarea placeholder="Enter Your Message... " name="comment"></textarea>
                </div>
              </div>
              <div class="row btn feedback_btn d-flex justify-content-around align-items-center">
	                <a href="feedback_page.jsp">See FeedBack</a>
	                <input type="submit" value="SUBMIT FEEDBACK" />
              </div>
              
            </form>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid footer">
      <div class="row footer-row">
        <div class="col">FIT-GAINER</div>
        <div class="col">&copy; COPYRIGHT 2022</div>
        <div class="col">+91 9798224316</div>
      </div>
    </div>
	
  </body>
  <script>
    var c1,c2,c3,c4,c5,c6;
    function openForm() {
      c1 = document.getElementById("myForm");
      if (c1.style.display === "none") {
        c1.style.display = "block";
        c2.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";

      } else {
        c1.style.display = "none";
        c2.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      }
    } 
    function openForm1() {
      c2 = document.getElementById("myForm1");
      if (c2.style.display === "none") {
        c2.style.display = "block";
        c1.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      } else {
        c1.style.display = "none";
        c2.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      }
    } 
    function openForm2() {
      c3 = document.getElementById("myForm2");
      if (c3.style.display === "none") {
        c3.style.display = "block";
        c1.style.display = "none";
        c2.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      } else {
        c1.style.display = "none";
        c2.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      }
    } 
    function openForm3() {
      c4 = document.getElementById("myForm3");
      if (c4.style.display === "none") {
        c4.style.display = "block";
        c2.style.display = "none";
        c3.style.display = "none";
        c1.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";

      } else {
        c4.style.display = "none";
        c2.style.display = "none";
        c3.style.display = "none";
        c1.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      }
    } 
    function openForm4() {
      c5 = document.getElementById("myForm4");
      if (c5.style.display === "none") {
        c5.style.display = "block";
        c1.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c2.style.display = "none";
        c6.style.display = "none";
      } else {
        c1.style.display = "none";
        c2.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      }
    } 
    function openForm5() {
      c6 = document.getElementById("myForm5");
      if (c6.style.display === "none") {
        c6.style.display = "block";
        c1.style.display = "none";
        c2.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c3.style.display = "none";
      } else {
        c1.style.display = "none";
        c2.style.display = "none";
        c3.style.display = "none";
        c4.style.display = "none";
        c5.style.display = "none";
        c6.style.display = "none";
      }
    } 
    

    function closeForm() {
      document.getElementById("myForm").style.display = "none";
    }
    function closeForm1() {
      document.getElementById("myForm1").style.display = "none";
    }
    function closeForm2() {
      document.getElementById("myForm2").style.display = "none";
    }
    function closeForm3() {
      document.getElementById("myForm3").style.display = "none";
    }
    function closeForm4() {
      document.getElementById("myForm4").style.display = "none";
    }
    function closeForm5() {
      document.getElementById("myForm5").style.display = "none";
    }
    // end
  </script>
</html>

