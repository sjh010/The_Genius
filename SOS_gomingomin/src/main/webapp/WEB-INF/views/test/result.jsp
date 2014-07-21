<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List, java.util.Map, java.util.Map"%>
<%
	List<ProductVO> selectProduct = (List<ProductVO>) request.getAttribute("selectProduct");
	Map<String, List<OrderVO>> category1 = 
					(Map<String, List<OrderVO>>) request.getAttribute("category1");
	Map<String, List<OrderVO>> category2 = 
					(Map<String, List<OrderVO>>) request.getAttribute("category2");
	Map<String, List<OrderVO>> category3 = 
					(Map<String, List<OrderVO>>) request.getAttribute("category3");
	
%>
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
<style>

	.test-category {
		float : left;
		text-align: center;
		margin : 0 15px 0 15px;
		border : 1px solid;
	}
	
	.test-el {
		padding :10px;
	}
	
	.test-el img{
		width : 150px;
		height :150px;
	}
	.test-el label{
		display : block;
		width : 100%;
		text-align: center;
	}
	.test-title{
		width : 100%;
		text-align: center;
		margin-bottom: 20px;
	}
	.result-title {
		width : 100%;
	}
	.result-title div{
		display :inline-block;
		width : 24.3%;
		text-align: center;
		font-size : 20px;
	}
	.result-container{
		width : 100%;
		margin :0 auto;
		text-align: center;
	}
</style>
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="../navbar/navbar.jsp" flush="false" />
	<div class="container">
		<div class="content-title">
			<h3><span class="glyphicon glyphicon-edit"></span>테스트 모드</h3>
		</div>
		<div class="container-close">
			<button type="button" class="close cancel">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
		</div>
		<div class="content-body">
			<div class="test-title">
				<h2>테스트 결과입니다.</h2>
			</div>
			<div class="result-title">
				<div>선택하신 제품</div>
				<div>Pearson 계수</div>
				<div>Cosine 유사도</div>
				<div>가중치 계산</div>
			</div>
			<div class="result-container">
				<ul class='test-category'>
						<%for(ProductVO vo : selectProduct){ %>
						<li class="test-el">
	                        <img src="/resources/test/<%=vo.getProduct_id() %>.png">
							<label><%=vo.getProduct_name() %></label>
						</li>
						<%} %>
				</ul>
				<ul class='test-category'>
						<li class="test-el">
	                        <img src="/resources/test/<%=category1.get("pearson").get(0).getProduct_id() %>.png">
							<label><%=category1.get("pearson").get(0).getProduct_name() %></label>
						</li>
						<li class="test-el">
	                        <img src="/resources/test/<%=category2.get("pearson").get(0).getProduct_id() %>.png">
							<label><%=category2.get("pearson").get(0).getProduct_name() %></label>
						</li>
						<li class="test-el">
	                        <img src="/resources/test/<%=category3.get("pearson").get(0).getProduct_id() %>.png">
							<label><%=category3.get("pearson").get(0).getProduct_name() %></label>
						</li>
				</ul>
				<ul class='test-category'>
						<li class="test-el">
	                        <img src="/resources/test/<%=category1.get("cosine").get(0).getProduct_id() %>.png">
							<label><%=category1.get("cosine").get(0).getProduct_name() %></label>
						</li>
						<li class="test-el">
	                        <img src="/resources/test/<%=category2.get("cosine").get(0).getProduct_id() %>.png">
							<label><%=category2.get("cosine").get(0).getProduct_name() %></label>
						</li>
						<li class="test-el">
	                        <img src="/resources/test/<%=category3.get("cosine").get(0).getProduct_id() %>.png">
							<label><%=category3.get("cosine").get(0).getProduct_name() %></label>
						</li>
				</ul>
				<ul class='test-category'>
						<li class="test-el">
	                        <img src="/resources/test/<%=category1.get("multi").get(0).getProduct_id() %>.png">
							<label><%=category1.get("multi").get(0).getProduct_name() %></label>
						</li>
						<li class="test-el">
	                        <img src="/resources/test/<%=category2.get("multi").get(0).getProduct_id() %>.png">
							<label><%=category2.get("multi").get(0).getProduct_name() %></label>
						</li>
						<li class="test-el">
	                        <img src="/resources/test/<%=category3.get("multi").get(0).getProduct_id() %>.png">
							<label><%=category3.get("multi").get(0).getProduct_name() %></label>
						</li>
				</ul>
			</div>
		</div>
	</div>
	<script>
$(".cancel").click(function (e) {
	console.log("asdf");
	e.preventDefault();
	history.back();
});
</script>
</body>
</html>