<%@page import="java.sql.*,all_logic.getter_setter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Password Change</title>
</head>
<body>
	<%
	
	try {		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ued","root","gnu123");
		String query = "update login_user_details set Password=? where email=?";
		String pass=request.getParameter("pass");
		String email= request.getParameter("email");
		String profile= request.getParameter("profile");
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, pass);
		ps.setString(2, email);
		
		getter_setter obj = new getter_setter();
		obj.setEmail(email);
		obj.setPass(pass);
		obj.setProfile(profile);
		
		String query2="Select * from login_user_details where Email='"+email+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query2);
		int i = ps.executeUpdate();
		int j=0,k=0;
		while(rs.next()){
			if(rs.getString("Profile").equals("user")){
				j=1;
			}else if(rs.getString("Profile").equals("trainer")){
				k=1;
			}
		}
		
		/* if(j>0 && k==0){
			request.getSession().setAttribute("obj", obj);
			RequestDispatcher rd = request.getRequestDispatcher("user_dashboard.jsp");
			rd.forward(request, response);
		}else if(j==0 && k>0){
			request.getSession().setAttribute("obj", obj);
			RequestDispatcher rd = request.getRequestDispatcher("trainer_dashboard.jsp");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
			out.print("<h4 style='color:red;'>Invalid Email You Input</h4>");
		} */
		response.sendRedirect("login.html");
	}catch (Exception e) {
		out.print(e);
	}
	
	%>
</body>
</html>