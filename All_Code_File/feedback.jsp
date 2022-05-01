<%@ page import="org.hibernate.engine.jdbc.connections.spi.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Back-end | Page</title>
</head>
<body>
	<%
	
	try {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String comment = request.getParameter("comment");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/ued","root","gnu123");
		
		String query2="Select * from login_user_details where Email='"+email+"'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query2);
		
		String query = "insert into user_feedback values(?,?,?); ";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, comment);
		int i = ps.executeUpdate();
		int j=0,k=0;
		while(rs.next()){
			if(rs.getString("Profile").equals("user")){
				j=1;
			}else if(rs.getString("Profile").equals("trainer")){
				k=1;
			}
		}
		
		if(j>0 && k==0){
			RequestDispatcher rd = request.getRequestDispatcher("user_dashboard.jsp");
			rd.forward(request, response);
		}else if(j==0 && k>0){
			RequestDispatcher rd = request.getRequestDispatcher("trainer_dashboard.jsp");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			rd.forward(request, response);
			out.print("<h4 style='color:red;'>Invalid Email You Input</h4>");
		}
		
		ps.close();
		con.close();
	}catch(Exception ex){
		out.print(ex);
		RequestDispatcher rs = request.getRequestDispatcher("error_page.jsp");
		rs.forward(request, response);
	}
	
	%>
</body>
</html>
