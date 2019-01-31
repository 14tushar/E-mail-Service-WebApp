<%@ page import="java.util.*" %>
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
String snum=cookies[i].getValue();
%>
<html>
	<head>
		<title>
			DesiFB : Draft Saved
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
Long sn=Long.parseLong(snum);
String subject=request.getParameter("sub");
String message=request.getParameter("msg");
int rn=1;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/desifbdb";
		Connection con=DriverManager.getConnection(url,"root","");
		Statement s=con.createStatement();
		int j=s.executeUpdate("insert into mails(receivernum,sendernum,subject,message) values("+rn+","+sn+",'"+subject+"','"+message+"')");
		
	}catch(Exception se){
		out.println(se);
		}
%>
			<center><h1>Message saved in draft!</h1>
			<a href="draft.jsp"><button class="formbtn">Check drafts here!</button></a></center>
		</div>
<%
}
else{
%>
			<center><h1>You are not signed in!</h1>
			<a href="login.html"><button class="formbtn">Sign in here!</button></a></center>
		</div>
<%
}
%>
	</body>
</html>