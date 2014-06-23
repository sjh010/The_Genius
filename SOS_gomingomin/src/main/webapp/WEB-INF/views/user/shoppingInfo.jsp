<!-- 
  Created by Saemi Lim on 2014-06-13.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% Cookie[] cookies = request.getCookies(); 
	String user_id = null;
	String include = "../navbarNoLogin.jsp";
	if(cookies != null) {
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("user_id")) {
				user_id = cookie.getValue();
				include = "../navbarLogin.jsp";
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>고민고민</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="<%=include %>" flush="false">
	<jsp:param value="<%=user_id %>" name="user_id"/>
</jsp:include>



<div class="container">
</div>
</body>
</html>