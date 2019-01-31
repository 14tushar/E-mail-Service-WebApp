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
		<title>Change Password</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style>
			div.form{
				background-color: #f1f1f1;
				margin: 20px;
				padding : 10px; 
				box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
			}
			div.button{
				background-color: #f1f1f1;
				margin : auto;
				width: 60%;
				padding : 0px 10px 10px 10px;
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
				border-color:#008CBA;
			}
			table.formtable{
				margin:auto;
				overflow-x:auto;
			}
		</style>
	</head>
	<body>
	
		<div class="form">
			<h1 class="form_heading" align="center"> Enter your old password and new password </h1>
			<form action="changepwd.jsp" method="post">
				<table align="center"  class="formtable">
					<tr>
						<td> Confirm Old Password</td>
						<td> :   </td>
						<td><input  type="password" size="12" maxlength="10" name="pwd1" required></td>
					</tr>
					<tr>
						<td> Enter New Password </td>
						<td> :   </td>
						<td><input  type="password" name="pwd2" value="" \></td>
					</tr>
					<tr>
						<td> ReEnter New Password </td>
						<td> :   </td>
						<td><input  type="password" name="pwd3" value="" \></td>
					</tr>
				</table>
				<center>
					<input type="submit" class="formbtn" value="Confirm Change!"/>
				</center>
			</form>
		</div>
		<div class="button">
			<center><h1>Do not want to change!</h1>
			<a href="mailbox.jsp"><button class="formbtn">Go back to inbox here!</button></a></center>
		</div>
<%
}
else{
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