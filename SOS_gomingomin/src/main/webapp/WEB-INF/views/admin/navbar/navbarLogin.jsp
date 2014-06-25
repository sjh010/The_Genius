<!-- 
  Created by Saemi Lim on 2014-06-23.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- navbar -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/admin">NoGomin Admin</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/admin/product">상품관리</a></li>
                <li><a href="/admin/character">캐릭터관리</a></li>
                <li><a href="/admin/category">카테고리관리</a></li>
                <li><a href="/admin/userManage">회원관리</a></li>
                <li><a href="javascript:logout();">로그아웃</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- /.navbar -->

<script>
var logout = function(){
	$.cookie('loginInfo', null);
	$.cookie('user_grade', null);
	location.replace("/");
};
</script>