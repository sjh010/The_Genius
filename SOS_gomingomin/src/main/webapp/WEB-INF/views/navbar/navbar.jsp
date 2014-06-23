<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String loginInfo = "";
	String user_name = "";
	String user_id = "";
	String include = "./navbarNoLogin.jsp";
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("loginInfo")) {
				loginInfo = cookie.getValue();
			}
			if (cookie.getName().equals("user_name")) {
				user_name = URLDecoder.decode(cookie.getValue(), "UTF-8");
			}
			if (cookie.getName().equals("user_id")) {
				user_id = cookie.getValue();
			}
		}
	}
	
	if(loginInfo.equals("y")){
		include = "./navbarLogin.jsp";
	}
	else if(loginInfo == null || loginInfo.equals("n")){
		include = "./navbarNoLogin.jsp";
	}
	
%>
<jsp:include page="<%=include%>" flush="false">
	<jsp:param value="<%=user_name%>" name="user_name" />
	<jsp:param value="<%=user_id%>" name="user_id" />
</jsp:include>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script src="/resources/js/navbar.js"></script>
