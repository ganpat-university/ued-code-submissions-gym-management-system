<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>TRAINER PAGE</title>    
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
                  <li><a href="user.jsp">USERS</a></li>
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
    
    <!-- testing -->
    <!-- 
    <div class="row user_head">
    	<div class="col-4 title-heading">
		<form action="search_content" method="post">
			<input type="text" id="search" onclick="search_func()" class="search" name="search_value" placeholder="Search........" required autocomplete="off">
			<label for="search"><i class="fa fa-search"></i></label>
			<input type="submit" id="submit" value="search">
        </form>
    	</div>
    </div>
-->
    
    <!-- Home Page Body -->
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
    
    <!-- course body -->
    
    <div id="course" class="container-fluid course title-container">
      <div class="row " >
        <div class="col py-3 title-heading"><h3>COURSES</h3></div>
      </div>
      <div class="container">
        <div class="row row-cols-3 courses-title" >
          <div class="col course-box" onclick="openForm()">
            
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
                <div class="col"><p>Muscular strength enhances overall health and boosts athletic activity.
                  A strong body allows you to perform movements and activities that require power without getting tired.</p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
          </div>

          <div class="col  course-box"  onclick="openForm1()">
           
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
                <div class="col"><p>The abdominal muscles used to hold the body rigid during the push-up are the rectus abdominis and the internal and external obliques
                  As the push-up involves multiple joints, it is a compound exercise</p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
          </div>

          <div class="col  course-box" onclick="openForm2()">
          
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
              <div class="col"><p>Yoga is a mind and body practice. Various styles of yoga combine physical postures, breathing techniques, and meditation or relaxation.</p></div>
            </div>
            <div class="row">
              <div class="col btn">
                <input type="submit" value="SUBMIT">
              </div>
            </div>
          </div>

          <div class="col  course-box" onclick="openForm3()">
          
              <div class="row course-img">
                <div class="col c-img">
                  <img src="home-banner-3.png" alt="image not found">
                </div>
              </div>
              <div class="row heading">
                <div class="col">
                  <h4>Weight Training</h4>
                </div>
              </div>
              <div class="row paragraph">
                <div class="col"><p>Weight training, also known as resistance or strength training, builds lean, stronger muscles, strengthens your bones and joints, and can help keep your metabolism in a healthy state — meaning you’ll burn more calories even when you’re resting. </p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
          </div>

          <div class="col  course-box" onclick="openForm4()">
            
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
                <div class="col"><p>The inner thighs are often underworked, but strengthening them is important for stabilizing your hips, knees, lower back, and core.</p></div>
              </div>
              <div class="row">
                <div class="col btn">
                <input type="submit" value="SUBMIT">
                </div>
              </div>
          </div>

          <div class="col  course-box" onclick="openForm5()">
          
            <div class="row course-img">
              <div class="col c-img">
                <img src="poster-2.png" alt="image not found">
              </div>
            </div>
            <div class="row heading">
              <div class="col">
                <h4>BICEPS</h4>
              </div>
            </div>
            <div class="row paragraph">
              <div class="col"><p>The beefy, front-arm section is a highly concentrated muscle group that suggests strength and demands respect, praise and the best bicep exercises you can throw at them.</p></div>
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
	              <div class="col c-img c-img2">
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

        <!-- All Course Specification is here -->

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
              The inner thighs are often underworked, but strengthening them is important for stabilizing your hips, knees, lower back, and core.
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
            <h3>BICEPS</h3>
          </div>
          <div class="row p_content">
            <p>
              The beefy, front-arm section is a highly concentrated muscle group that suggests strength and demands respect, praise and the best bicep exercises you can throw at them.
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

        <!-- ending of special section -->
      
      </div>
    </div>

    <!-- special for admin page for adding boxes into web page -->
    
    <div class="container-fluid admin_manupulation">
      <div class="container">
        <div class="row crud_box">
          <div class="col btn-1"><button id="add_product" onclick="myFunction()">Add Product</button></div>
          <div class="col btn-1"><button id="add_courses" onclick="myFunction2()">Add Courses</button></div>
          <div class="col btn-1"><button id="add_diet_plan" onclick="myFunction3()">Add Diet Plan</button></div>
        </div>
      </div>
    </div>
    
	<!-- Add Dynamic Course Box  -->
	
    <div class="conatainer-fluid popup_container" id="popup_conatiner">
      <div class="row " >
        <div class="col py-3 title-heading"><h3>Add Product Card</h3></div>
      </div>
      <div class="container">
        <div id="addbox" class="popup">
          <form action="addproduct.jsp" id="add_product2" class="add_content" method="post">
            <div class="row popup_decorate">
              <div class="offset-1 col-5">
                <input type="text" name="product_link"  placeholder="Add Product Link" required>	
                <input type="text" name="photo_link"  placeholder="Add Photo Link" required>	
              </div>
              <div class="col-6">
                <textarea name="product_desc" id="description" cols="15" rows="4" placeholder="Enter Your Description" required></textarea>
              </div>
            </div>
            <div class="row">
              <div class="offset-10 col ">
                <input class="popup_btn" type="submit" value="DONE">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <div class="conatainer-fluid popup_container" id="popup_conatiner2">
      <div class="row " >
        <div class="col py-3 title-heading"><h3>Add Courses Card</h3></div>
      </div>
      <div class="container">
        <div id="addbox" class="popup">
          <form action="addcourse.jsp" id="add_course2" class="add_content" method="post">
            <div class="row popup_decorate">
              <div class="offset-1 col-5">
                <input type="text" autocomplete="off" name="course_name" id="course_name" placeholder="Add Course Name" required>
                <input type="text" autocomplete="off" name="course_link" id="course_link" placeholder="Add Image Link" required>
                <input type="number" autocomplete="off" name="course_price" id="course_price" placeholder="Add Course Price" required>
              </div>
              <div class="col-6">
                <textarea name="course_desc" id="description" cols="15" rows="4" placeholder="Enter Your Description" required></textarea>
              </div>
            </div>
            <div class="row">
              <div class="offset-10 col ">
                <input class="popup_btn" type="submit" value="DONE">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
   
    <div class="conatainer-fluid popup_container" id="popup_conatiner3">
      <div class="row " >
        <div class="col py-3 title-heading"><h3>ADD Diet Plan</h3></div>
      </div>
      <div class="container">
        <div id="addbox" class="popup">
          <form action="diet_details.jsp" id="add_diet2" class="add_content" method="post">
            <div class="row popup_decorate">
              <div class="offset-1 col-5">
                <input type="text" name="diet_name" autocomplete="off" id="" placeholder="Add Course Name" required>
              </div>
              <div class="col-6">
                <!-- <input type="text" placeholder="Add Description only in 30 words"> -->
                <textarea name="diet_description" id="description" cols="15" rows="4" placeholder="Enter Your Description" required ></textarea>
              </div>
            </div>
            <div class="row">
              <div class="offset-10 col ">
                <input class="popup_btn" type="submit" value="DONE">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- ending of special section -->
    <!-- course body completed -->

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
                    <li style="list-style: disc;">A healthy eating plan gives your body the nutrients it needs every day while staying within your daily calorie goal for weight loss.</li>
                    
                    <li style="list-style: disc;"> A healthy eating plan also will lower your risk for heart disease and other health conditions.</li>
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
                    <li style="list-style: disc;">Weight loss and gain revolve around caloric consumption and expenditure.</li> 
                    <li style="list-style: disc;">Simply put, you lose weight when you consume fewer calories than you expend and you gain weight when you consume more calories than you sweat. 
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
                    <li style="list-style: disc;">There are numerous fat loss diet plans available. But what is important is that you choose a fat loss diet plan which suits you.</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          
          <!-- for dynamic boxes <c:out value="${desc}"></c:out>-->
                            	
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
	                  	<li style="list-style: disc;">
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
        
        <c:forEach var="querys" items="${add_product_box.rows}">
	        <div class="row">
	          <div class="col-4 product_box p-img2">
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
    <!-- ABOUT SECTION -->
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
        <div id="contact	" class="row btn feedback_btn d-flex justify-content-end align-items-center">
          <a href="feedback_page.jsp">See FeedBack</a>
        </div>
      </div>
    </div>
    

    <!-- FOOTER -->
    <div class="container-fluid footer">
      <div class="row footer-row">
        <div class="col">FIT-GAINER</div>
        <div class="col">&copy; COPYRIGHT 2022</div>
        <div class="col">+91 9798224316</div>
      </div>
    </div>
  </body>

  <!-- Pop Up Boxes JavaScript -->
  <script>
    var x,y,z;
    function myFunction() {
      x = document.getElementById("popup_conatiner");
      if (x.style.display === "none") {
        x.style.display = "block";
        z.style.display = "none";
        y.style.display = "none";

      } else {
        x.style.display = "none";
        z.style.display = "none";
        y.style.display = "none";
      }
    } 
    function myFunction2() {
      y = document.getElementById("popup_conatiner2");
      if (y.style.display === "none") {
        y.style.display = "block";
        z.style.display = "none";
        x.style.display = "none";
      } else {
        x.style.display = "none";
        z.style.display = "none";
        y.style.display = "none";
      }
    } 
    function myFunction3() {
      z = document.getElementById("popup_conatiner3");
      if (z.style.display === "none") {
        z.style.display = "block";
        x.style.display = "none";
        y.style.display = "none";
      } else {
        z.style.display = "none";
        y.style.display = "none";
        x.style.display = "none";
      }
    } 
    //end of dynamic course box script

    // for popup box script
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
    function search_func(){
      document.getElementById("submit").style.display="inline-block";
    }
  </script>
</html>

