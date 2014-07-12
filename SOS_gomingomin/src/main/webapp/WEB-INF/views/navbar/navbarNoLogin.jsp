<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>

<!-- 네비게이션 -->
<nav>
	<div class="nav">
		<div class="nav-menu" id="home">
			<img class="nav-menu-img" src="/resources/images/icon/white/home.png">
			<span class="nav-menu-title">Home</span>
		</div>
		<div class="nav-menu" id="login">
			<img class="nav-menu-img"
				src="/resources/images/icon/white/login.png"> <span
				class="nav-menu-title">Login</span>
		</div>
		<div class="nav-menu" id="join">
			<img class="nav-menu-img" src="/resources/images/icon/white/join.png">
			<span class="nav-menu-title">Join</span>
		</div>
	</div>
</nav>

<!-- 로그인 창 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<img src="/resources/images/logo/login.png">
			</div>
			<div class="modal-body">
				<form class="login-box" id="user-login-form">
					<div class="login-line">
						<input class="form-control" type="text" placeholder="아이디" name="user_id">
						<input class="form-control" type="password" placeholder="비밀번호" name="user_password">
					</div>
					<div class="login-button">
						<button class="btn btn-info ok">로그인</button>
					</div>
					<div class="login-menu">
						<span><a href="/join">회원가입</a></span><span>비밀번호 찾기</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--/로그인 끝 -->
<!--/ 네비게이션 끝 -->
<script>
	var login = $("#login");
	var join = $("#join");

	$("#home").click(function() {
		location.href = "/";
	});

	login.click(function() {
		$('#loginModal').modal('toggle');
	});

	join.click(function() {
		location.href = "/join";
	});
	

	$("#user-login-form .ok").click(function(e){
		e.preventDefault();
		var $form = $("#user-login-form");
		$.ajax({
	    	data : $form.serialize(),
	    	type : "post",
	    	dataType : "json",
	    	url : "/loginAction",
	    	success : function(data){
	    		if((data.result == null) || (data.result == undefined)){
	    			location.href = "/";
	    		} else {
	    			alert(data.result);
	    		}
	        }
	    });
	});


	$(".nav-menu").hover(function() {
		$(this).find(".nav-menu-title").addClass("nav-menu-0-rotate");
		$(this).find(".nav-menu-img").addClass("nav-menu-90-rotate");
	}, function() {
		$(this).find(".nav-menu-title").removeClass("nav-menu-0-rotate");
		$(this).find(".nav-menu-img").removeClass("nav-menu-90-rotate");
	});
</script>