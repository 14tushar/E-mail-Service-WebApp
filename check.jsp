<html>
	<head>
		<title>
			DesiFB : Sign In
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
Long n=Long.parseLong(request.getParameter("num"));
Cookie numcookie;
String pass=request.getParameter("pwd");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/desifbdb";
		Connection con=DriverManager.getConnection(url,"root","");
		Statement s=con.createStatement();
		ResultSet rs=s.executeQuery("select * from users where mobilenum="+n);
		if(rs.next())
		{
			if((rs.getString(2)).equals(pass))
			{
			numcookie=new Cookie("fbid",request.getParameter("num"));
			numcookie.setMaxAge(60*60*24);
			response.addCookie(numcookie);
			response.sendRedirect("mailbox.jsp");
			}
			else
			{
%>
			<center><h1>Password Incorrect!</h1>
			<a href="login.html"><button class="formbtn">Log in again here</button></a></center>
<%
			}
		}
		else
		{
%>
			<center><h1>Number not Registered!<br>OR<br>You entered incorrect Number!</h1>
			<a href="login.html"><button class="formbtn">Log in again here</button></a></center>
<%
		}
	}
	catch(Exception se){
		System.out.println(se);
	}
%>
		</div>
	</body>
</html>