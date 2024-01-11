<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System Using JSP</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@page import="java.sql.*"%>
<% ResultSet resultSet = null; %>
	<div class="header">
		<h2>Student Management App</h2>
		<button onclick="toggle()">Add Student</button>
	</div>
	<div class="tabel-panel">
		<table>
			<thead>
				<tr>
					<th>StudentId</th>
					<th>Full Name</th>
					<th>Email Address</th>
					<th>Mobile No</th>
					<th>Date of Birth</th>
					<th>Department</th>
					<th>Address</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surbhi","root","surbhi@321");
					PreparedStatement stmt = con.prepareStatement("SELECT * FROM student");
					resultSet = stmt.executeQuery();
					while(resultSet.next()){
				%>
				<tr>
					<td><%=resultSet.getInt("studid")%></td>
					<td><%=resultSet.getString("fullname")%></td>
					<td><%=resultSet.getString("email")%></td>
					<td><%=resultSet.getString("mobile")%></td>
					<td><%=resultSet.getString("dob")%></td>
					<td><%=resultSet.getString("department")%></td>
					<td><%=resultSet.getString("address")%></td>
					<td>
						<a href="update.jsp?studid=<%=resultSet.getInt(1)%>"><i class="fa-solid fa-user-pen"></i></a>
						<a href="delete.jsp?studid=<%=resultSet.getInt(1)%>"><i class="fa-solid fa-trash"></i></a>
					</td>
				</tr>
				<%}
				%>
			</tbody>
		</table>
	</div>
	<div class="add-student" id=studentForm>
		<div class="title">
			<h2>Student Registration System</h2>
		</div>
		<form method="post" action="studentadd.jsp">
			<input type="number" name="studid" placeholder="Student id">
			<input type="text" name="fullname" placeholder="Fullname">
			<input type="email" name="email" placeholder="Email Address">
			<input type="text" name="mobile" placeholder="Mobile No.">
			<input type="date" name="dob">
			<input type="text" name="dept" placeholder="Department">
			<textarea name="addr"></textarea>
			<input type="submit" value="Add Student">
		</form>
	</div>
	<script>
		var studentForm = document.querySelector("#studentForm");
		function toggle(){
			if(studentForm.style.display=='none'){
				studentForm.style.display='block';
				studentForm.style.animation='anim1 linear 0.5s';
			}
			else{
				studentForm.style.display='none';
			}
		}
	</script>
</body>
</html>