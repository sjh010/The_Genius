<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
<meta charset="UTF-8">
<title>고민고민</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/lib/jquery-ui.min.css"/>
<link rel="stylesheet" href="/resources/css/top.css">
<link rel="stylesheet" href="/resources/css/import.css">
<link rel="stylesheet" href="/resources/css/animate.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/js/lib/jquery-ui.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="./navbar/navbar.jsp" flush="false" />
	<!-- 메인페이지 시작-->
	<div class="page-main">
		<div class="logo">
			<img src="/resources/images/logo.png">
		</div>
		<!-- 메인페이지 카테고리 -->
		<div class="main-category">
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li>노트북</li>
						<li>태블릿</li>
						<li>이어폰/헤드셋</li>
						<li>마우스</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/computer.png">
				</div>
				<div class="depth1-info">Computer</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li>운동화</li>
						<li>로퍼</li>
						<li>구두</li>
						<li>샌들/슬리퍼</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/shoes.png">
				</div>
				<div class="depth1-info">Shoes</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li class="depth2-dummy">노트북파우치</li>
						<li>백팩</li>
						<li>크로스백</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/bags.png">
				</div>
				<div class="depth1-info">Bags</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li>선글라스</li>
						<li>지급</li>
						<li>벨트</li>
						<li>향수</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/sundries.png">
				</div>
				<div class="depth1-info">Beauty</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li>청바지</li>
						<li>정장</li>
						<li>아웃도어</li>
						<li>카라티</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/clothes.png">
				</div>
				<div class="depth1-info">Clothes</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li class="depth2-dummy">뷔페/레스토랑</li>
						<li>여가/레포츠/테마파크</li>
						<li>커피/피자/베이커리</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/eticket.png">
				</div>
				<div class="depth1-info">E-Ticket</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li class="depth2-dummy">헬스</li>
						<li>자전거</li>
						<li>스키/보드 장비</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/reports.png">
				</div>
				<div class="depth1-info">Sports</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li class="depth2-dummy">TV</li>
						<li>냉장고</li>
						<li>에어컨</li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/electrons.png">
				</div>
				<div class="depth1-info">Home Appliances</div>
			</div>
		</div>
	</div>
	<!--/ 메인페이지 끝-->
	<script>
		$(".main-circle").hover(
				function() {
					$(this).children(".main-outer-circle").addClass(
							"main-spread-circle");
					$(this).children(".main-inner-circle").addClass(
							"main-inner-show");
					$(this).children(".depth1-info").addClass(
							"main-circle-hidden");
				},
				function() {
					$(this).children(".main-outer-circle").removeClass(
							"main-spread-circle");
					$(this).children(".main-inner-circle").removeClass(
							"main-inner-show");
					$(this).children(".depth1-info").removeClass(
							"main-circle-hidden");
				});
	</script>
</body>
</html>