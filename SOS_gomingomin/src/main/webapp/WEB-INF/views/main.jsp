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
<link rel="stylesheet" href="/resources/css/lib/datepicker.css"/>
<link rel="stylesheet" href="/resources/css/top.css">
<link rel="stylesheet" href="/resources/css/import.css">
<link rel="stylesheet" href="/resources/css/animate.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
						<li><a href="/search/searchCategory?category_id=11">노트북</a></li>
						<li><a href="/search/searchCategory?category_id=12">태블릿</a></li>
						<li><a href="/search/searchCategory?category_id=13">이어폰/헤드셋</a></li>
						<li><a href="/search/searchCategory?category_id=14">마우스</a></li>
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
						<li><a href="/search/searchCategory?category_id=15">운동화</a></li>
						<li><a href="/search/searchCategory?category_id=16">로퍼</a></li>
						<li><a href="/search/searchCategory?category_id=17">구두</a></li>
						<li><a href="/search/searchCategory?category_id=18">샌들/슬리퍼</a></li>
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
						<li><a href="/search/searchCategory?category_id=19">노트북파우치</a></li>
						<li><a href="/search/searchCategory?category_id=20">백팩</a></li>
						<li><a href="/search/searchCategory?category_id=21">크로스백</a></li>
						<li><a href="/search/searchCategory?category_id=22">샌들/슬리퍼</a></li>
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
						<li><a href="/search/searchCategory?category_id=23">선글라스</a></li>
						<li><a href="/search/searchCategory?category_id=24">지갑</a></li>
						<li><a href="/search/searchCategory?category_id=25">벨트</a></li>
						<li><a href="/search/searchCategory?category_id=26">향수</a></li>
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
						<li><a href="/search/searchCategory?category_id=27">청바지</a></li>
						<li><a href="/search/searchCategory?category_id=28">정장</a></li>
						<li><a href="/search/searchCategory?category_id=29">아웃도어</a></li>
						<li><a href="/search/searchCategory?category_id=30">카라티</a></li>
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
						<li class="depth2-dummy"><a href="/search/searchCategory?category_id=31">뷔페/레스토랑</a></li>
						<li><a href="/search/searchCategory?category_id=32">여가/레포츠/테마파크</a></li>
						<li><a href="/search/searchCategory?category_id=33">커피/피자/베이커리</a></li>
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
						<li class="depth2-dummy"><a href="/search/searchCategory?category_id=34">헬스</a></li>
						<li><a href="/search/searchCategory?category_id=35">자전거</a></li>
						<li><a href="/search/searchCategory?category_id=36">스키/보드 장비</a></li>
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
						<li class="depth2-dummy"><a href="/search/searchCategory?category_id=37">TV</a></li>
						<li><a href="/search/searchCategory?category_id=38">냉장고</a></li>
						<li><a href="/search/searchCategory?category_id=39">에어컨</a></li>
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