<!-- 
  Created by Saemi Lim on 2014-06-24.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List, java.util.Map"%>
<%
	Map<String, List<OrderVO>> magiResultMap = 
					(Map<String, List<OrderVO>>) request.getAttribute("magiResultMap");
	List<ProductVO> productCodeList = (List<ProductVO>)request.getAttribute("productCodeList");
	List<OrderVO> pearsonList = magiResultMap.get("pearson");
	List<OrderVO> cosineList = magiResultMap.get("cosine");
	List<OrderVO> multiList = magiResultMap.get("multi");
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
<link rel="stylesheet" href="/resources/css/top.css">
<link rel="stylesheet" href="/resources/css/import.css">
<link rel="stylesheet" href="/resources/css/animate.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="../navbar/navbar.jsp" flush="false" />
	<div class="page-search">
		<div class="type1">
			<div class="type-inner">
				<div class="content-close">
					<button type="button" class="close">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="content-title">
					<h3>가 추천하는<%=" "+request.getParameter("keyword")+" " %>관련 상품</h3>
				</div>
				<div class="content-circle">
					<div class="search-character">
						<img class="img" src="/resources/images/search/a.png">
					</div>
				</div>
				<div class="content-body">
					<ul class="search-result-list">
						<%  int cnt = 0;
							for(OrderVO pearson : pearsonList) { 
							if(cnt < 3){
						%>
							<li class="product" id="<%=pearson.getProduct_id() %>">
								<span class="search-result-element"> 
									<span class="thum">
									<a href="#"><img class="product-image" src="" /></a></span>
									<span class="desc"> <span class="title"><a href="#"></a></span> 
									<span class="price">0원</span>
									</span>
								</span>
							</li>
						<%} else{%>
							<li class="no-load-pearson" id="<%=pearson.getProduct_id() %>">
								<span class="search-result-element"> 
									<span class="thum">
									<a href="#"><img class="product-image" src="" /></a></span>
									<span class="desc"> <span class="title"><a href="#"></a></span> 
									<span class="price">0원</span>
									</span>
								</span>
							</li>
						<%} cnt++; }%>
						<li class="more-view-pearson">더보기</li>
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
					<h3>가 추천하는<%=" "+request.getParameter("keyword")+" " %>관련 상품</h3>
				</div>
				<div class="content-circle">
					<div class="search-character">
						<img class="img" src="/resources/images/search/b.png">
					</div>
				</div>
				<div class="content-body">
					<ul class="search-result-list">
						<%  cnt = 0;
							for(OrderVO cosine : cosineList) { 
							if(cnt < 3){
						%>
							<li class="product" id="<%=cosine.getProduct_id() %>">
								<span class="search-result-element"> 
									<span class="thum">
									<a href="#"><img class="product-image" src="" /></a></span>
									<span class="desc"> <span class="title"><a href="#"></a></span> 
									<span class="price">0원</span>
									</span>
								</span>
							</li>
						<%} else{%>
							<li class="no-load-cosine" id="<%=cosine.getProduct_id() %>">
								<span class="search-result-element"> 
									<span class="thum">
									<a href="#"><img class="product-image" src="" /></a></span>
									<span class="desc"> <span class="title"><a href="#"></a></span> 
									<span class="price">0원</span>
									</span>
								</span>
							</li>
						<%} cnt++; }%>
						<li class="more-view-cosine">더보기</li>
					</ul>
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
					<h3>가 추천하는<%=" "+request.getParameter("keyword")+" " %>관련 상품</h3>
				</div>
				<div class="content-circle">
					<div class="search-character">
						<img class="img" src="/resources/images/search/c.png">
					</div>
				</div>
				<div class="content-body">
					<ul class="search-result-list">
						<%  cnt = 0;
							for(OrderVO multi : multiList) { 
							if(cnt < 3){
						%>
							<li class="product" id="<%=multi.getProduct_id() %>">
								<span class="search-result-element"> 
									<span class="thum">
									<a href="#"><img class="product-image" src="" /></a></span>
									<span class="desc"> <span class="title"><a href="#"></a></span> 
									<span class="price">0원</span>
									</span>
								</span>
							</li>
						<%} else{%>
							<li class="no-load-multi" id="<%=multi.getProduct_id() %>">
								<span class="search-result-element"> 
									<span class="thum">
									<a href="#"><img class="product-image" src="" /></a></span>
									<span class="desc"> <span class="title"><a href="#"></a></span> 
									<span class="price">0원</span>
									</span>
								</span>
							</li>
						<%} cnt++; }%>
						<li class="more-view-multi">더보기</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="type-none">
			<div class=type-inner>
				<div class="content-title">
					<h3><span class="glyphicon glyphicon-search"></span><%=request.getParameter("keyword")+" " %> 관련 상품</h3>
				</div>
				<div class="content-close">
					<button type="button" class="close">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
				</div>
				<div class="content-body">
								<ul class="search-result-list">
									 <% for(ProductVO product : productCodeList) { %>
										<li class="product" id="<%=product.getProduct_id() %>">
											<span class="search-result-element"> 
												<span class="thum">
												<a href="#"><img class="product-image" src="" /></a></span>
												<span class="desc"> <span class="title"><a href="#"></a></span> 
												<span class="price">0원</span>
												</span>
											</span>
										</li>
									<%} %>
								</ul>
							</div>
			</div>
		</div>
	</div>
	<script>
		var type1 = $(".type1");
		var type2 = $(".type2");
		var type3 = $(".type3");
		var typeNo = $(".type-none");

		$(".content-close button").click(function(e) {
			reset();
			typeNo.removeClass("type-none-open");
			type1.removeClass("type-hidden");
			type2.removeClass("type-hidden");
			type3.removeClass("type-hidden");
			
				
				type1.find(".type-hidden").removeClass("type-hidden");
				type2.find(".type-hidden").removeClass("type-hidden");
				type3.find(".type-hidden").removeClass("type-hidden");
				type2.removeClass("type2-close");
				type3.removeClass("type3-close");
				type1.removeClass("type1-open");
				type2.removeClass("type2-open");
				type3.removeClass("type3-open");
			e.stopPropagation();
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
		
		$(".type-none").click(function() {
			$(this).addClass("type-none-open");
			type1.addClass("type-hidden");
			type2.addClass("type-hidden");
			type3.addClass("type-hidden");
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
	<script src="/resources/js/search.js"></script>
	<script>
		$(".more-view-pearson").click(function(){
			var addList = $(".no-load-pearson");
			var more = $(this);
			$.each(addList, function(idx, obj){
				if(addList.length < 3){
					more.remove(); console.log(more);
				} else if(idx > 3) {
					return 0;	
				}
				
				$(this).addClass("product");
				$(this).removeClass("no-load-pearson");
				
				var element = $(this).children(".search-result-element");
				var image = element.children(".thum").children("a").children(".product-image")[0];
				var price = element.children(".desc").children(".price")[0];
				var title = element.children(".desc").children(".title")[0];
				
				$.ajax({
					url : 'http://apis.skplanetx.com/11st/common/products',
					type : 'get',
					dateType : 'JSON',
					data : {
						appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec',
						version : 1,
						searchKeyword : $(this)[0].id,
					},

					success : function(data) {
						var productInfo = data.ProductSearchResponse.Products.Product;
						var tmp = productInfo.ProductName;
						title.innerHTML = "<a href='#' title='"+tmp+"'>" + tmp.substr(0, 35)+"...</a>" ;
						image.src = productInfo.ProductImage250;
						price.innerText = formatnumber(productInfo.ProductPrice,3) + "원";
					}
			});
			});
		});
		
		$(".more-view-cosine").click(function(){
			var addList = $(".no-load-cosine");
			var more = $(this);
			$.each(addList, function(idx, obj){
				if(addList.length < 3){
					more.remove();
				} else if(idx > 3) {
					return 0;	
				}
				
				$(this).addClass("product");
				$(this).removeClass("no-load-cosine");
				
				var element = $(this).children(".search-result-element");
				var image = element.children(".thum").children("a").children(".product-image")[0];
				var price = element.children(".desc").children(".price")[0];
				var title = element.children(".desc").children(".title")[0];
				
				$.ajax({
					url : 'http://apis.skplanetx.com/11st/common/products',
					type : 'get',
					dateType : 'JSON',
					data : {
						appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec',
						version : 1,
						searchKeyword : $(this)[0].id,
					},

					success : function(data) {
						var productInfo = data.ProductSearchResponse.Products.Product;
						var tmp = productInfo.ProductName;
						title.innerHTML = "<a href='#' title='"+tmp+"'>" + tmp.substr(0, 35)+"...</a>" ;
						image.src = productInfo.ProductImage250;
						price.innerText = formatnumber(productInfo.ProductPrice,3) + "원";
					}
			});
			});
		});
		
		$(".more-view-multi").click(function(){
			var addList = $(".no-load-multi");
			var more = $(this);
			$.each(addList, function(idx, obj){
				if(addList.length < 3){
					more.remove();
				} else if(idx > 3) {
					return 0;	
				}
				
				$(this).addClass("product");
				$(this).removeClass("no-load-multi");
				
				var element = $(this).children(".search-result-element");
				var image = element.children(".thum").children("a").children(".product-image")[0];
				var price = element.children(".desc").children(".price")[0];
				var title = element.children(".desc").children(".title")[0];
				
				$.ajax({
					url : 'http://apis.skplanetx.com/11st/common/products',
					type : 'get',
					dateType : 'JSON',
					data : {
						appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec',
						version : 1,
						searchKeyword : $(this)[0].id,
					},

					success : function(data) {
						var productInfo = data.ProductSearchResponse.Products.Product;
						var tmp = productInfo.ProductName;
						title.innerHTML = "<a href='#' title='"+tmp+"'>" + tmp.substr(0, 35)+"...</a>" ;
						image.src = productInfo.ProductImage250;
						price.innerText = formatnumber(productInfo.ProductPrice,3) + "원";
					}
			});
			});
		});
	</script>
</body>
</html>