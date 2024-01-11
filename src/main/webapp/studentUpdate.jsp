<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	int studid;
	String fullname,email,mobile,dob,dept,addr;
	studid = Integer.parseInt(request.getParameter("studid"));
	fullname = request.getParameter("fullname");
	email = request.getParameter("email");
	mobile = request.getParameter("mobile");
	dob = request.getParameter("dob");
	dept = request.getParameter("dept");
	addr = request.getParameter("addr");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surbhi","root","surbhi@321");
	PreparedStatement stmt = con.prepareStatement("UPDATE student SET fullname=?,email=?,mobile=?,dob=?,department=?,address=? WHERE studid=?");
	stmt.setInt(7,studid);
	stmt.setString(1,fullname);
	stmt.setString(2,email);
	stmt.setString(3,mobile);
	stmt.setString(4,dob);
	stmt.setString(5,dept);
	stmt.setString(6,addr);
	stmt.executeUpdate();
	stmt.close();
	con.close();
%>
<script>
	alert('Student Updated Successfully!!');
	window.location.href="http://localhost:8082/StudentApp/index.jsp";
</script>