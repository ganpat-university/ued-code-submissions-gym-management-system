<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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

