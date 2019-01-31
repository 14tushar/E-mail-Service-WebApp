<%
Cookie killcookie=new Cookie("fbid",null);
killcookie.setMaxAge(0);
response.addCookie(killcookie);
%>
<html>
	<head>
		<title>
			DesiFB : Log out
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
			<center><h1>LogOut Successful!</h1>
			<a href="login.html"><button class="formbtn">Log in again here</button></a></center>
		</div>
	</body>
</html>