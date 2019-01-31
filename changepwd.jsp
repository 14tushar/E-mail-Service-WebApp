<%
Cookie[] cookies = null;
// Get an array of Cookies associated with this domain
cookies = request.getCookies();
int i=0;
while(!((cookies[i].getName()).equals("fbid"))){
if( i<(cookies.length-1))
i++;
else
break;
}
if((cookies[i].getName()).equals("fbid"))
{
Long snum=Long.parseLong(cookies[i].getValue());
%>
<html>
	<head>
		<title>
			Password Change
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
				border-color:#008CBA;
			}
		</style>
	</head>
	<body>
		<div class="button">
<%@ page import="java.sql.*;" %>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/desifbdb";
		Connection con=DriverManager.getConnection(url,"root","");
		Statement s=con.createStatement();
		ResultSet rs1=s.executeQuery("select * from users where mobilenum="+snum);
		rs1.next();
		if((request.getParameter("pwd1")).equals(rs1.getString(2))){

			if((request.getParameter("pwd2")).equals(request.getParameter("pwd3")))
			{
			String pass1=request.getParameter("pwd2");
			int j=s.executeUpdate("update users set password='"+pass1+"' where mobilenum="+snum);
%>
		<center><h1>Password Changed Successfully!</h1>
		<a href="mailbox.jsp"><button class="formbtn">Check Inbox here</button></a></center>
<%
			}
			else
			{
%>
		<center><h1>Re-entered Password Didn't Match!</h1>
		<a href="pwdform.jsp"><button class="formbtn">back</button></a></center>
<%			
			}
		}
		else
		{
%>
		<center><h1>You entered Incorrect current password</h1>
		<a href="pwdform.jsp"><button class="formbtn">back</button></a></center>
<%	
		}
	}
	catch(Exception se){
		System.out.println(se);
	}
}
else
{
%>
		<div class="button">
			<center><h1>You are not signed in!</h1>
			<a href="login.html"><button class="formbtn">Sign in here!</button></a></center>
		</div>
<%
}
%>
	</body>
</html>