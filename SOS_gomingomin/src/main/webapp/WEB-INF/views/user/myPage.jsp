<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Cookie[] cookies = request.getCookies(); 
	String user_id = null;
	String include = "./navbarNoLogin.jsp";
	if(cookies != null) {
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("user_id")) {
				user_id = cookie.getValue();
				include = "./navbarLogin.jsp";
			}
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>고민고민</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>

<jsp:include page="../<%=include %>" flush="false">
	<jsp:param value="<%=user_id %>" name="user_id"/>
</jsp:include>

<div class="container">
    <div class="container-header">
        <div class="page-header">
            <h1>마이페이지</h1>
        </div>
    </div>
    <div class="container-body">
        <div class="media">
            <a class="pull-left"><span class="media-object glyphicon glyphicon-question-sign"></span></a>
            <div class="media-body">
                <h4 class="media-heading">정보수정을 위해 회원님의 비밀번호를 다시 한 번 입력해주시기바랍니다..</h4>
            </div>
        </div>
        <form class="form-horizontal " role="form" id="myPage-form">
            <div class="form-group">
                <label for="user_id" class="col-sm-2 control-label">아이디</label>
                <div class="col-sm-10">
                    <label class=" control-label"><%=user_id %></label>
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
</body>
</html>