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
						<li><a href="/search/searchCategory?category_id=11">Notebook</a></li>
						<li><a href="/search/searchCategory?category_id=12">Tablet</a></li>
						<li><a href="/search/searchCategory?category_id=13">Headset</a></li>
						<li><a href="/search/searchCategory?category_id=14">Mouse</a></li>
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
						<li><a href="/search/searchCategory?category_id=15">Sneakers</a></li>
						<li><a href="/search/searchCategory?category_id=16">Loafer</a></li>
						<li><a href="/search/searchCategory?category_id=17">Shoes</a></li>
						<li><a href="/search/searchCategory?category_id=18">Slipper</a></li>
					</ul>
				</div>
				<div class="main-outer-circle">
					<img src="/resources/images/category/shoes.png">
				</div>
				<div class="depth1-info">Footwear</div>
			</div>
			<div class="main-circle">
				<div class="main-inner-circle">
					<ul class="depth2-info">
						<li class="depth2-dummy"><a href="/search/searchCategory?category_id=19">Notebook Pouch</a></li>
						<li><a href="/search/searchCategory?category_id=20">Backpack</a></li>
						<li><a href="/search/searchCategory?category_id=21">Crossbag</a></li>
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
						<li><a href="/search/searchCategory?category_id=22">Sunglasses</a></li>
						<li><a href="/search/searchCategory?category_id=23">Wallet</a></li>
						<li><a href="/search/searchCategory?category_id=24">Belt</a></li>
						<li><a href="/search/searchCategory?category_id=25">Perfume</a></li>
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
						<li><a href="/search/searchCategory?category_id=26">Jeans</a></li>
						<li><a href="/search/searchCategory?category_id=27">Suits</a></li>
						<li><a href="/search/searchCategory?category_id=28">Outdoors</a></li>
						<li><a href="/search/searchCategory?category_id=29">Polo T</a></li>
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
						<li class="depth2-dummy"><a href="/search/searchCategory?category_id=30">Restaurants</a></li>
						<li><a href="/search/searchCategory?category_id=31">Reports/Park</a></li>
						<li><a href="/search/searchCategory?category_id=32">Cafe/Bakery</a></li>
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
						<li class="depth2-dummy"><a href="/search/searchCategory?category_id=33">Health</a></li>
						<li><a href="/search/searchCategory?category_id=34">Bicycle</a></li>
						<li><a href="/search/searchCategory?category_id=35">Ski/Snowboard</a></li>
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
						<li class="depth2-dummy"><a href="/search/searchCategory?category_id=36">TV</a></li>
						<li><a href="/search/searchCategory?category_id=37">Refrigerator</a></li>
						<li><a href="/search/searchCategory?category_id=38">Air Conditioner</a></li>
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