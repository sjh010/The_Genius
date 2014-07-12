<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<%
	String user_name = request.getParameter("user_name");
%>


<!-- 네비게이션 -->
<nav>
	<div class="nav">
		<div class="nav-menu" id="home">
			<img class="nav-menu-img" src="/resources/images/icon/white/home.png">
			<span class="nav-menu-title">Home</span>
		</div>
		<div class="nav-menu" id="logout">
			<img class="nav-menu-img"
				src="/resources/images/icon/white/logout.png"> <span
				class="nav-menu-title">Exit</span>
		</div>
		<div class="nav-menu" id="mypage">
			<img class="nav-menu-img" src="/resources/images/icon/white/mypage.png">
			<span class="nav-menu-title">My</span>
		</div>
	</div>
</nav>
<!--/ 네비게이션 끝 -->
<script>
	var logout = $("#logout");
	var mypage = $("#mypage");

	$("#home").click(function() {
		location.href = "/";
	});

	logout.click(function() {
		location.href="/logout";
	});

	mypage.click(function() {
		location.href = "/myPage";
	});
	

	$(".nav-menu").hover(function() {
		$(this).find(".nav-menu-title").addClass("nav-menu-0-rotate");
		$(this).find(".nav-menu-img").addClass("nav-menu-90-rotate");
	}, function() {
		$(this).find(".nav-menu-title").removeClass("nav-menu-0-rotate");
		$(this).find(".nav-menu-img").removeClass("nav-menu-90-rotate");
	});
</script>