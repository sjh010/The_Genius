<!-- 
  Created by Saemi Lim on 2014-06-24.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List, java.util.Map"%>
<%
	List<ProductVO> productCodeList = 
					(List<ProductVO>) request.getAttribute("productCodeList");
	
	String keyword = request.getParameter("keyword");
	String category_id = request.getParameter("category_id");
	String title = "";
	String icon = "";
	
	if(keyword != null){
		icon = "search";
		title = keyword;
		
	} else if(category_id != null){
		icon = "filter";
		CategoryVO category = (CategoryVO) request.getAttribute("categoryInfo");
		title = category.getCategory_name();
	}
	
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
<link rel="stylesheet" href="/resources/css/lib/jquery-ui.min.css"/>
<link rel="stylesheet" href="/resources/css/top.css">
<link rel="stylesheet" href="/resources/css/import.css">
<link rel="stylesheet" href="/resources/css/animate.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="../navbar/navbar.jsp" flush="false" />
	<div class="container">
		<div class="content-title">
			<h3><span class="glyphicon glyphicon-<%=icon %>"></span><%=title+" " %> 관련 상품</h3>
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
	<script src="/resources/js/search.js"></script>
</body>
</html>