<%@page import="all_logic.getter_setter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String pass = request.getParameter("pass");
	String email = request.getParameter("email");
	String profile = request.getParameter("profile");
	getter_setter obj = new getter_setter();
	obj.setEmail(email); 
	obj.setPass(pass);
	obj.setProfile(profile);
	
	try {
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ued","root","gnu123");
	Statement st = con.createStatement();
	String query = "select * from login_user_details ";//where Email='"+email+"' and Password='"+pass+"'
	ResultSet rs = st.executeQuery(query);
	while(rs.next()) {
		if((rs.getString("Email").equals(email) && rs.getString("Password").equals(pass) && rs.getString("Profile").equals(profile))) {
			if(rs.getString("Profile").equals("user")) {
				request.getSession().setAttribute("obj", obj);
				RequestDispatcher rd = request.getRequestDispatcher("user_dashboard.jsp");
				rd.forward(request, response);					
			}else {
				request.getSession().setAttribute("obj", obj);
				RequestDispatcher rd = request.getRequestDispatcher("trainer_dashboard.jsp");
				rd.forward(request, response);					
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			
			rd.include(request, response);
			out.print("<h5 style='top:-70px;display:flex;justify-content:center; color:#922;letter-spacing:2px;'>Invalid Email or Security Key</h5><br>");
		}
	}		
	con.close();
	}catch (Exception e) {
		out.print("Error Occurs : "+e);		
	}
	%>
</body>
</html>