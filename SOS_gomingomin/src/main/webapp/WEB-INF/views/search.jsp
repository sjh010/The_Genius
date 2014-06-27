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
<link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="./navbar/navbar.jsp" flush="false" />
	<div class="container">
		<div class="container-header">
			<div class="page-header">
				<h1>검색결과</h1>
			</div> 
		</div>
		<div class="container-body">
			<ul class="search-result">
			<% for(ProductVO product : productCodeList) { %>
				<li class="product" id="<%=product.getProduct_id() %>">
					<span class="search-result-element"> 
						<span class="thum">
						<a href="#"><img class="product-image" name="상품1" src="제목 없음.png" /></a></span>
						<span class="desc"> <span class="title"><a href="#"><%=product.getProduct_name() %></a></span> 
						<span class="price">0원</span>
						</span>
					</span>
				</li>
			<%} %>
			</ul>
		</div>
	</div>
	<script>
		$(function(){
			$(".product").each(function(index, product){
				
				var element = $(this).children(".search-result-element");
				var image = element.children(".thum").children("a").children(".product-image")[0];
				var price = element.children(".desc").children(".price")[0];

				$.ajax({
          		  	url : 'http://apis.skplanetx.com/11st/common/products',
            	  	type : 'get',
            		dateType : 'JSON',
            		data : {
                		appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec', 
                		version : 1, 
                		searchKeyword : product.id,
            		},
            		
            		success : function(data){
                		console.log(data);
            			var productInfo = data.ProductSearchResponse.Products.Product;
        		        image.src = productInfo.ProductImage300;
        		        price.innerText = productInfo.ProductPrice + "원";
                	}       			
    			});
    		});
			
			
		});
	</script>
	<script>
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