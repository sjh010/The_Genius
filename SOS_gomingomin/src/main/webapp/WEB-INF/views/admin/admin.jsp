<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>고민고민 관리자페이지</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">NoGomin Admin</a>
        </div>
        <!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav><!-- /.navbar -->
<div class="container">
    <div class="container-body searchbar">
        <form class="form-horizontal" role="form" id="admin-login-form">
            <div class="form-group">
                <label class="col-sm-2 control-label">아이디</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="user_id">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="user_password">
                </div>
            </div>
            <div class="form-group form-button">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default login">로그인</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
$("admin-login-form .login").click(function(){
	console.log($form.serialize());
	var $form = $("#admin-login-form");
	$.ajax({
		data : $form.serialize(),
		dataType : "json",
		url : "/admin/login",
		type : "post",
		success : function(data){
			if(data.result == 'y'){
				console.log("로긴");
			} else if(data.result == 'n') {
				console.log("오류");
			}
		}
	});
});
</script>
</body>
</html>