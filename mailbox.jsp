<html>
	<head>
		<title>Mail box : Home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style>
			div.navbar{
				background-color: #333;
				margin: 0px;
				padding : 0;
				width : 100%;
				height : 44px;
				position : fixed;
				box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
			}
			div.navbar ul{
				list-style-type: none;
				margin:0;
				padding:0;
			}
			div.navbar li{
				float: left;
				color: #ffffff;
				display: block;
				text-align: center;
			}
			div.navbar li a.navlink{
				color: #ffffff;
				display: block;
				text-align: center;
				padding : 14px 16px;
				text-decoration: none;
			}
			div.navbar li a.navlink:hover{
				background-color:#111;
			}
			div.navbar li a.navlink:active{
				background-color:#4CAF50;
			}
			div.navbar li a.navlinkactive{
				color: #ffffff;
				display: block;
				text-align: center;
				background-color:#4CAF50;
				padding : 14px 16px;
				text-decoration: none;
			}
			.dropdown {
				position: relative;
				display: inline-block;
			}

			.dropdown-content {
				display: none;
				position: absolute;
				background-color: #f9f9f9;
				min-width: 320px;
				right:0;
				box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				padding: 12px 16px;
				z-index: 1;
			}
			a.droplink{
				color: #4CAF50;
				display: block;
				text-align: center;
				padding : 14px 16px;
				text-decoration: none;
			}
			a.droplink:hover{
				background-color:#4CAF50;
				color:#f9f9f9;
			}
			a.droplink:active{
				background-color:#4CAF50;
				color:#f9f9f9;
			}
			.dropdown:hover .dropdown-content {
				display: inline-block;
			}
			.propic{
				margin : 0px 80px 0px 0px;
				width: 140px;
				float: left;
				background-color:#ffffff;
				color:#4CAF50;
				position : fixed;
				height:140px;
				
			}
			#form{
				background-color: #f1f1f1;
				box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
			}
			div.button{
				background-color: #f1f1f1;
				margin : auto;
				padding : 10px 10px 10px 10px;
				box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
			}
			input[type="text"] {
				border : none;
				border-bottom : 2px solid blue;
				-webkit-transition: border-bottom 1s;
				transition: border-bottom 1s;
				background-color: #f1f1f1;
				height: 30px;
				padding: 10px;
				font-size: 24px;
				width:90%;
			}
			input[type="text"]:focus {
				border : none;
				border-bottom : 2px solid red;
				background-color: #f1f1f1;				
			}
			input[type="password"] {
				border : none;
				border-bottom : 2px solid blue;
				-webkit-transition: border-bottom 1s;
				transition: border-bottom 1s;
				background-color: #f1f1f1;
				height: 30px;
				padding: 10px;
				font-size: 24px;
				width:90%;
			}
			input[type="password"]:focus {
				border : none;
				border-bottom : 2px solid red;
				background-color: #f1f1f1;
			}
			td{
				padding : 10px;
				font-size : 24px;
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
			table.formtable{
				width: 90%;
				margin:auto;
				overflow-x:auto;
			}
			.email_link{
				text-decoration : none;
				display: block;
				border-radius:4px;
			}
			.email_link:hover{
				background-color: grey;
			}
			.email_link:hover table.formtable td{
				color:white;
			}
		</style>
	</head>
	<body>
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
		<div class="navbar">
			<ul>
				<li><a class="navlink" href="compose.jsp">Compose</a></li>
				<li><a class="navlinkactive" href="mailbox.jsp">Inbox</a></li>
				<li><a class="navlink" href="sentmails.jsp">Sentbox</a></li>
				<li><a class="navlink" href="draft.jsp">Draft</a></li>
				<li style="float:right" class="dropdown">
					<a class="navlink" href="javascript:void(0)">Profile</a>
					<div class="dropdown-content">
							<div class="propic">
							<img src="<%= snum%>.jpg" style="width:160px">
							</div>
							<div style="float:right;width:160px">
								<a class="droplink" href="logout.jsp">Sign out</a>
								<a class="droplink" href="pwdform.jsp">Change Password</a>
								<a class="droplink" href="profile.jsp">Open account settings</a>
							</div>
					</div>
				</li>
			</ul>
		</div>
		<div id="form" style="padding:40px">
			<h1 class="form_heading" align="center"> Inbox </h1>
<%@ page import="java.sql.*;" %>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/desifbdb";
		Connection con1=DriverManager.getConnection(url,"root","");
		Connection con2=DriverManager.getConnection(url,"root","");
		Statement s1=con1.createStatement();
		Statement s2=con2.createStatement();
		ResultSet rs1=s1.executeQuery("select * from mails where receivernum="+snum+" and receivernum!=1 order by time desc");	
		while(rs1.next())
		{	
%>
				<a href="message.jsp?received=<%= rs1.getString(6) %>" class="email_link">
					<table align="center"  class="formtable">
						<tr style="height:15px;">
						</tr>
						<tr>
							<td>From :
								<% 
									ResultSet rs2=s2.executeQuery("select * from users where mobilenum="+rs1.getString(2));
									if(rs2.next())
										out.println(rs2.getString(3));
									else
										out.println(rs1.getString(1));
								%> 
							</td>
						</tr>
						<tr>
							<td width="75%"> <%= rs1.getString(3) %></td>
							<td align="right"> <%= rs1.getString(5) %> </td>
						</tr>
						<tr style="height:30px;">
						</tr>
					</table>
				</a>
				<hr>
<%
		}
	}catch(Exception se){
		out.println(se);
		}
		
%>	
				</table>
<%
}
else{
%>
		<div id="form" style="padding:20px;width:60%;margin:0 auto;">
			<center><h1>You are not signed in!</h1>
			<a href="login.html"><button class="formbtn">Sign in here!</button></a></center>
		</div>
<%
}
%>
	</body>
</html>