<%
String msgid=null,msgtype=null;
Cookie[] cookies = null;
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
if(request.getParameter("received")!=null){
msgid=request.getParameter("received");
msgtype="receive";
}
if(request.getParameter("sent")!=null){
msgid=request.getParameter("sent");
msgtype="sent";
}
if(request.getParameter("draft")!=null){
msgid=request.getParameter("draft");
msgtype="draft";
}
if(msgid==null)
{
	response.sendRedirect("mailbox.jsp");
}
%>
<html>
	<head>
		<title>Desifb : Mail</title>
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
			.buttonlink{
				display:block;
				background-color:#4CAF50;
				color:#ffffff;
				text-decoration:none;
				padding: 14px 16px;
				width:40px;
				border-radius:4px;
			}
			.buttonlink:hover{
				display:block;
				background-color:#ffffff;
				border:2px solid #4CAF50;
				width: 36px;
				padding-bottom: 10px;
				color:#4CAF50;
				text-decoration:none;
			}
			
		</style>
	</head>
	<body>
		<div class="navbar">
			<ul>
				<li><a class="navlink" href="compose.jsp">Compose</a></li>
				<li><a class="navlink" href="mailbox.jsp">Inbox</a></li>
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
		<div id="form" style="padding:50px">
		
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
		ResultSet rs1=s1.executeQuery("select * from mails where id="+msgid);	
		rs1.next();
				if(msgtype.equals("receive"))
				{
							ResultSet rs2=s2.executeQuery("select * from users where mobilenum="+rs1.getString(2));
							rs2.next();
%>
				<b><a href="mailbox.jsp" class="buttonlink">Back</a></b>
				<a href="compose.jsp?to=<%= rs2.getString(1) %>" class="email_link">
					<table align="center"  class="formtable">
						<tr style="height:15px;">
						</tr>
						<tr>
							<td rowspan="2" >
								From :
							</td>
							<td>
								<% 
										out.println(rs2.getString(3)+" "+rs2.getString(4));
								%> 
							</td>
						</tr>
						<tr>
							<td>
								<%
										out.println(rs2.getString(1));
								%>
							</td>
						</tr>
					</table>
				</a>
<%
				}
				if(msgtype.equals("sent"))
				{
							ResultSet rs2=s2.executeQuery("select * from users where mobilenum="+rs1.getString(1));
							rs2.next();
%>
				<b><a href="sentmails.jsp" class="buttonlink">Back</a></b>
				<a href="compose.jsp?to=<%= rs2.getString(1) %>" class="email_link">
					<table align="center"  class="formtable">
						<tr style="height:15px;">
						</tr>
						<tr> 
							<td rowspan="2" >
								To :
							</td>
							<td>
								<% 
										out.println(rs2.getString(3)+" "+rs2.getString(4));
								%> 
							</td>
						</tr>
						<tr>
							<td>
								<%
										out.println(rs2.getString(1));
								%>
							</td>
						</tr>
					</table>
				</a>
<%
				}
				if(msgtype.equals("draft"))
				{
%>
				<b><a href="draft.jsp" class="buttonlink">Back</a></b>
				<form action="send.jsp">
					<table align="center"  class="formtable">
						<tr style="height:15px;">
						</tr>
						<tr>
							<td>
								To :
							</td>
							<td>
								<input  type="text" size="12" maxlength="10" name="rnum" placeholder="Receiver's mobile number" required>
							</td>
						</tr>
					</table>
						<input  type="hidden" size="12" maxlength="10" name="msgid" value="<%= msgid %>" >
					<center>
						<input type="submit" class="formbtn" value="Send"/>
					</center>
				</form>
				
<%
				}
%>
					<table align="center" class="formtable">
						<tr style="height:30px;">
						</tr>
						<tr>
							<td>
							Subject :
							</td>
							<td>
								<%= rs1.getString(3) %> 
							</td>
						</tr>
						<tr style="height:30px;">
						</tr>
						<tr style="height:auto";>
							<td>
							Message :
							</td>
							<td style="width:60%">
								<%= rs1.getString(4) %>
							</td>
						</tr>
						<tr style="height:30px;">
						</tr>
					</table>
				
<%
	}catch(Exception se){
		out.println(se);
		}
		
%>	
				</table>
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