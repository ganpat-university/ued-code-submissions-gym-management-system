<%@page import="all_logic.getter_setter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>jsp </title>
</head>
<body>
	<%
		String data = request.getParameter("search_value");
	try {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ued","root","gnu123");
		Statement st = con.createStatement();
		String query = "select * from login_user_details where Username = '"+data+"'";
		ResultSet rs = st.executeQuery(query);
		String getdata="";
		while(rs.next()){
			if(rs.getString("Username").equals("data")){
				getdata=rs.getString("Username");
			}else{
				getdata="Data not Found";
			}
		}
		getter_setter obj = new getter_setter();
		obj.setData_search(getdata);
		request.getSession().setAttribute("obj2", obj);
		response.sendRedirect("user_search.jsp");
	}catch(Exception e){
		RequestDispatcher rs = request.getRequestDispatcher("error_page.jsp");
		rs.forward(request, response);
	}
	%>
</body>
</html>