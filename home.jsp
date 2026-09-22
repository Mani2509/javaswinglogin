<%@page import="java.sql.*"%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("index.html");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home Page</title>
	<style>
		body {
			margin: 0;
			padding: 0;
			overflow-x: hidden;
		}

		.marquee-wrap {
			width: 100%;
			overflow: hidden;
			white-space: nowrap;
			box-sizing: border-box;
			padding: 20px 0;
		}

		.marquee-text {
			display: inline-block;
			padding-left: 100%;
			font-size: 2.5em;
			font-weight: bold;
			color: #4CAF50;
			animation: run-left 8s linear infinite;
		}

		@keyframes run-left {
			0%   { transform: translateX(0); }
			100% { transform: translateX(-200%); }
		}
	</style>
</head>
<body>
	<div class="marquee-wrap">
		<h1 class="marquee-text">Welcome, <%= username %>!</h1>
	</div>
	<p>You have successfully logged in.</p>
	<a href="logout.jsp">Logout</a>
</body>
</html>
