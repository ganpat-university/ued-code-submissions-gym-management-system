<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Hint</title>
<jsp:include page="head_content.jsp"></jsp:include>
<link rel="stylesheet" href="style1.css" />
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid ">
	<div class="container" id="itemvalues">
	</div>
</div>
</body>
	<script>
		var arr = [];
		arr[0]="Name length must be more than 2 and less than 20 character.";
		arr[1]="First Name must be contain atleast 3 Upper/Lower Alphabets";
		arr[2]="Middle/Last Name must be contain atleast 3 Upper/Lower Alphabets";
		arr[3]="Middle/LastName contains atleast 3 character";
		arr[4]="Password must be less than 15 and more than 6 characters in length";
		arr[5]="Password must have atleast one uppercase character";
		arr[6]="Password must have atleast one lowercase character";
		arr[7]="Password must have atleast one number";
		arr[9]="Password must have atleast one special character among @#$%";
		arr[10]="Security Key only Contain Alphabets and Digit";
		arr[11]="In Email Section Before '.' or '@' length is less than 2 ";
		let text = "<div class='text-primary text-center'>";
			arr.forEach(myFunction);
		text += "</div>";
		document.getElementById("itemvalues").innerHTML = text;

function myFunction(value) {
  text += "<div class='col border-top border-bottom border-right border-left border-secondary border-3 p-2'>"+value +"</div>";
} 
	</script>
</html>