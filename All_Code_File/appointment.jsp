<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Appointment | Page</title>
    <jsp:include page="head_content.jsp"></jsp:include>
    <link rel="stylesheet" href="course.css">
  </head>
  <body id="appointment">
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="container appointment pt-5">
        <div class="row m-0 pt-5">
          <div class="col box">
            <div class="row"><img src="add_photo.png" style="width:130px;height:130px;filter:invert(1);" alt="image not found"></div>
            <div class="row title-heading"><a href="addappointment.jsp">Add Appointment</a></div>

          </div>
          <div class="col box">
            <div class="row"><img src="add_photo2.png" style="width:130px;height:130px;filter:invert(1);" alt="image not found"></div>
            <div class="row title-heading"><a href="appointment_confirmation.jsp">Check Appointment</a></div>

          </div>
        </div>
      </div>
    </div>
  </body>
</html>
