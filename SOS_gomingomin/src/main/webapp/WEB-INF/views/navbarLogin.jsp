<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
%>

<!-- navbar -->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">NoGomin</a>
        </div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
	        	<li class="dropdown">
	                <a href="" class="dropdown-toggle" data-toggle="dropdown"><%=user_id %>님<b class="caret"></b></a>
	                <ul class="dropdown-menu">
	                    <li><a href="/myPage">마이페이지</a></li>
	                    <li><a href="javascript:logout();">로그아웃</a></li>
	                </ul>
	            </li>
	            <li><a href="/shoppingInfo">나의쇼핑정보</a></li>
	        </ul>
		</div>
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- /.navbar -->

<script src="/resources/js/navbar.js"></script>