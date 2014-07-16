<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<%
	List<ProductVO> testList = 
					(List<ProductVO>) request.getAttribute("testList");
	
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
	.test-category li {
		float : left;
		margin : 0 5px 0 5px;
	}
	.test-el img{
		width : 150px;
		height :150px;
	}
	.content-body form .form-button {
		width : 100%;
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
			<h3>각 카테고리별 선호상품을 1개씩 선택해 주세요</h3>
			<form action="/test/result" method="post" id="testform">
				<ul class='test-category'>
			<% String[] testType = {"test1","test2","test3"}; int idx = 0; int cnt = 1;%>
			<% for(ProductVO product : testList){ %>
					<li class="test-el">
                        <img src="/resources/test/<%=product.getProduct_id() %>.png">
                        <span class="radio">
						  <label>
						    <input type="radio" value="<%=product.getProduct_id() %>" 
						    										name="<%=testType[idx]%>">
						    <%=product.getProduct_name() %>
						  </label>
						</span>
					</li>
					<% if(cnt%5 == 0) idx++;cnt++; %>
			<%  } %>
				</ul>
				<div class="form-button">
					<button class="btn btn-default" id="goTest">확인</button>
				</div>
			</form>
		</div>
	</div>
	<script>
	
	$("#goTest").click(function(e){
		e.preventDefault();
		var test1 = $(':radio[name="test1"]:checked');
		var test2 = $(':radio[name="test2"]:checked');
		var test3 = $(':radio[name="test3"]:checked');
		if(test1.length < 1 && test2.length < 1 && test3.length <1){
			alert("상품을 모두 선택해주세요");
		} else $("#testform").submit();
		
	});
	$(".cancel").click(function (e) {
		e.preventDefault();
		history.back();
	});
	</script>
</body>
</html>