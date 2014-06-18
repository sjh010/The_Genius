<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- navbar -->
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">NoGomin</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:loginModal();">로그인</a></li>
				<li><a href="#">회원가입</a></li>
				<li><a href="#">나의쇼핑정보</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<!-- /.navbar -->

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="loginModalLabel">NoGomin 로그인</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="loginId" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="loginId">
						</div>
					</div>
					<div class="form-group">
						<label for="loginPw" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="loginPw">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label><input type="checkbox">아이디 저장</label>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info join">회원가입</button>
				<button type="button" class="btn btn-primary">로그인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/navbar.js"></script>
