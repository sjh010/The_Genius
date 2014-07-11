<!-- 
  Created by Saemi Lim on 2014-06-24.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<%
	List<ProductVO> productCodeList = (List<ProductVO>) request.getAttribute("productCodeList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>고민고민</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
<link rel="stylesheet" href="/resources/css/top.css">
<link rel="stylesheet" href="/resources/css/import.css">
<link rel="stylesheet" href="/resources/css/animate.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="./navbar/navbar.jsp" flush="false" />
	<div class="page-search">
		<div class="type1">
			<div class="type-inner">
				<div class="content-close">
					<button type="button" class="close">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="content-title">
					<h3>가 추천하는 노트북 관련 상품</h3>
				</div>
				<div class="content-circle">
					<div class="search-character">
						<img class="img" src="/resources/images/search/a.png">
					</div>
				</div>
				<div class="content-body">
					<ul class="search-result-list">
						<li><span class="search-result-element"> <span
								class="thum"> <a href="#"><img name="상품1"
										src="제목 없음.png" /></a>
							</span> <span class="desc"> <span class="title"><a
										href="#">11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span
									class="price">499,000원</span>
							</span>
						</span></li>
						<li><span class="search-result-element"> <span
								class="thum"> <a href="#"><img name="상품1"
										src="제목 없음.png" /></a>
							</span> <span class="desc"> <span class="title"><a
										href="#">11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span
									class="price">499,000원</span>
							</span>
						</span></li>
						<li><span class="search-result-element"> <span
								class="thum"> <a href="#"><img name="상품1"
										src="제목 없음.png" /></a>
							</span> <span class="desc"> <span class="title"><a
										href="#">11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span
									class="price">499,000원</span>
							</span>
						</span></li>
						<li><span class="search-result-element"> <span
								class="thum"> <a href="#"><img name="상품1"
										src="제목 없음.png" /></a>
							</span> <span class="desc"> <span class="title"><a
										href="#">11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span
									class="price">499,000원</span>
							</span>
						</span></li>
						<li><span class="search-result-element"> <span
								class="thum"> <a href="#"><img name="상품1"
										src="제목 없음.png" /></a>
							</span> <span class="desc"> <span class="title"><a
										href="#">11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span
									class="price">499,000원</span>
							</span>
						</span></li>
						<li><span class="search-result-element"> <span
								class="thum"> <a href="#"><img name="상품1"
										src="제목 없음.png" /></a>
							</span> <span class="desc"> <span class="title"><a
										href="#">11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span> <span
									class="price">499,000원</span>
							</span>
						</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="type2">
			<div class="type-inner">
				<div class="content-close">
					<button type="button" class="close">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="content-title">
					<h3>가 추천하는 노트북 관련 상품</h3>
				</div>
				<div class="content-circle">
					<div class="search-character">
						<img class="img" src="/resources/images/search/b.png">
					</div>
				</div>
			</div>
		</div>
		<div class="type3">
			<div class="type-inner">
				<div class="content-close">
					<button type="button" class="close">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="content-title">
					<h3>가 추천하는 노트북 관련 상품</h3>
				</div>
				<div class="content-circle">
					<div class="search-character">
						<img class="img" src="/resources/images/search/c.png">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var type1 = $(".type1");
		var type2 = $(".type2");
		var type3 = $(".type3");

		$(".content-close button").click(function() {
			reset();
			type1.find(".type-hidden").removeClass("type-hidden");
			type2.find(".type-hidden").removeClass("type-hidden");
			type3.find(".type-hidden").removeClass("type-hidden");
			type2.removeClass("type2-close");
			type3.removeClass("type3-close");
			type1.removeClass("type1-open");
			type2.removeClass("type2-open");
			type3.removeClass("type3-open");
		});

		$(".type1 .content-circle").click(function() {
			type2.find(".type-inner").addClass("type-hidden");
			type3.find(".type-inner").addClass("type-hidden");
			
			
			type2.addClass("type2-ready");
			type3.addClass("type3-ready");
			setTimeout(function() {
				type2.removeClass("type2-ready");
				type3.removeClass("type3-ready");
				type2.addClass("type2-close");
				type3.addClass("type3-close");
			}, 500);
			type1.addClass("type1-open");
			type1.find(".content-circle").addClass("search-character-circle");
		});

		$(".type2 .content-circle").click(function() {
			type1.find(".type-inner").addClass("type-hidden");
			type3.find(".type-inner").addClass("type-hidden");
			
			type2.addClass("type2-open");
			type3.addClass("type3-ready");
			setTimeout(function() {
				type3.removeClass("type3-ready");
				type3.addClass("type3-close");
			}, 500);
			type2.find(".content-circle").addClass("search-character-circle");
		});

		$(".type3 .content-circle").click(function() {
			type2.find(".type-inner").addClass("type-hidden");
			type1.find(".type-inner").addClass("type-hidden");
			
			type2.addClass("type2-open");
			type3.addClass("type3-open");
			type3.find(".content-circle").addClass("search-character-circle");

		});

		var reset = function() {
			type1.removeClass("type1-open");
			type1.find(".content-circle")
					.removeClass("search-character-circle");
			type2.find(".content-circle")
					.removeClass("search-character-circle");
			type3.find(".content-circle")
					.removeClass("search-character-circle");
		};
	</script>
	<script>
		$(function() {
			$(".product")
					.each(
							function(index, product) {

								var element = $(this).children(
										".search-result-element");
								var image = element.children(".thum").children(
										"a").children(".product-image")[0];
								var price = element.children(".desc").children(
										".price")[0];

								$
										.ajax({
											url : 'http://apis.skplanetx.com/11st/common/products',
											type : 'get',
											dateType : 'JSON',
											data : {
												appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec',
												version : 1,
												searchKeyword : product.id,
											},

											success : function(data) {
												console.log(data);
												var productInfo = data.ProductSearchResponse.Products.Product;
												image.src = productInfo.ProductImage300;
												price.innerText = productInfo.ProductPrice
														+ "원";
											}
										});
							});

		});
		var lastPostFunc = function() {

			var str = "<li>"
					+ " <span class='search-result-element'>"
					+ "  <span class='thum'>"
					+ "  <a href='#'><img name='상품1' src='제목 없음.png'/></a>"
					+ "  </span>"
					+ " <span class='desc'>"
					+ "  <span class='title'><a href='#'>11번가 단독 특가! 삼성 미사용전시노트북 499000원 행사!</a></span>"
					+ " <span class='price'>499,000원</span>" + " </span>"
					+ " </span>" + "</li>";
			$(".search-result li:last").after(str + str + str);

		};
		$(window).scroll(
				function() {
					if ($(window).scrollTop() == $(document).height()
							- $(window).height()) {
						lastPostFunc();
					}

				});
	</script>
</body>
</html>