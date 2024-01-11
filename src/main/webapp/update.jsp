<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Data</title>
<link rel="stylesheet" href="style1.css">
</head>
<body>
<%@page import="java.sql.*"%>
<%  int studid = Integer.parseInt(request.getParameter("studid")); 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surbhi","root","surbhi@321");
	PreparedStatement st = con.prepareStatement("SELECT * FROM student WHERE studid=?");
	st.setInt(1,studid);
	ResultSet rs = st.executeQuery();
	String fullname="",email="",mobile="",dob="",dept="",addr="";
	if(rs.next()){
		fullname=rs.getString(2);
		email=rs.getString(3);
		mobile=rs.getString(4);
		dob=rs.getString(5);
		dept=rs.getString(6);
		addr=rs.getString(7);
	}
	st.close();
	con.close();
%>
	<div class="header">
		<h2>Student Management App</h2>
	</div>
	<div class="add-student" id=studentForm>
		<div class="title">
			<h2>Update Student Details</h2>
		</div>
		<form method="post" action="studentUpdate.jsp">
			<input value="<%=studid%>" type="number" name="studid" readonly>
			<input type="text" value="<%=fullname%>" name="fullname" placeholder="Fullname">
			<input type="email" value="<%=email%>" name="email" placeholder="Email Address">
			<input type="text" value="<%=mobile%>" name="mobile" placeholder="Mobile No.">
			<input type="date" value="<%=dob %>" name="dob">
			<input type="text" value="<%=dept %>" name="dept" placeholder="Department">
			<textarea name="addr"><%=addr%></textarea>
			<input type="submit" value="Update Student">
		</form>
	</div>
</body>
</html>