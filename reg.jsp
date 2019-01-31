<html>
	<head>
		<title>
			DesiFB : Registration
		</title>
		<style>
			div.button{
				background-color: #f1f1f1;
				margin : auto;
				width: 60%;
				padding : 0px 10px 10px 10px;
				box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
			}
			.formbtn{
				padding : 10px 20px;
				font-size: 24px;
				background-color: #008CBA;
				border-radius:8px;
				color:#ffffff;
				-webkit-transition: background-color 0.2s;
				-webkit-transition: color 0.2s;
				transition: background-color 0.2s;
				transition: color 0.2s;
			}
			.formbtn:hover{
				padding : 10px 20px;
				font-size: 24px;
				background-color: #ffffff;
				border-radius:4px;
				color:#008CBA;
				border-color:#008CBA
			}
		</style>
	</head>
	<body>
		<div class="button">
<%@ page import="java.sql.*;" %>
<%
if((request.getParameter("pwd1")).equals(request.getParameter("pwd2")))
{
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	Long mobnum=Long.parseLong(request.getParameter("num"));
	String pass1=request.getParameter("pwd1");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/desifbdb";
		Connection con=DriverManager.getConnection(url,"root","");
		Statement s=con.createStatement();
		int i=s.executeUpdate("insert into users(mobilenum, password, first_name, last_name)  values("+mobnum+",'"+pass1+"' , '"+fname+"' , '"+lname+"')");
%>
		<center><h1>Registered Successfully!</h1>
		<a href="login.html"><button class="formbtn">Sign in here</button></a><h2>OR</h2></center>
<%
	}
	catch(Exception se){
		System.out.println(se);
	}

}
else
{
%>
			<center><h1>Password didn't match!<br>Try again!</h1></center>
<%
}
%>
			<center><a href="register.html"><button class="formbtn">Register again</button></a></center>
		</div>
	</body>
</html>