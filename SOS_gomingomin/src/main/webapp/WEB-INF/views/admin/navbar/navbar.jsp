<!-- 
  Created by Saemi Lim on 2014-06-23.
-->
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String loginInfo = "";
	String include = "./navbarNoLogin.jsp";
	if (cookies != null) {
		for (Cookie cookie : cookies) {
	if (cookie.getName().equals("loginInfo")) {
		loginInfo = cookie.getValue();
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
<jsp:include page="<%=include%>" flush="false" />


<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
