<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>고민고민</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="../navbar/navbar.jsp" flush="false" />
	<div class="container">
		<div class="container-header">
			<div class="page-header">
				<h1>마이페이지</h1>
			</div>
		</div>
		<div class="container-body">
			<div class="media">
				<a class="pull-left"><span
					class="media-object glyphicon glyphicon-question-sign"></span></a>
				<div class="media-body">
					<h4 class="media-heading">정보수정을 위해 회원님의 비밀번호를 다시 한 번
						입력해주시기바랍니다..</h4>
				</div>
			</div>
			<form class="form-horizontal " role="form" id="myPage-form">
				<div class="form-group">
					<label for="user_id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-10">
						<label class=" control-label id"></label>
					</div>
				</div>
				<div class="form-group">
					<label for="user_password" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="user_password">
					</div>
				</div>
				<div class="form-button">
					<button type="button" class="btn btn-primary ok">확인</button>
					<button type="button" class="btn btn-default cancel">취소</button>
				</div>
			</form>
		</div>
	</div>
	<script src="/resources/js/user/myPage.js"></script>
	<script>
	$(document).ready(function(){
		$("#myPage-form .id").html($.cookie("user_id"));
		if("${result}" != ""){
			alert("${result}");
		} 
		
	});

	</script>
</body>
</html>