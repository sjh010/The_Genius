<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<%
	List<CategoryVO> categoryList = (List<CategoryVO>)request.getAttribute("categoryList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>고민고민 관리자페이지</title>
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
	<jsp:include page="../navbar/navbar.jsp" flush="false" />
	<div class="container">
		<div class="container-header">
			<div class="page-header">
				<h1>
					카테고리관리 <small>등록</small>
				</h1>
			</div>
		</div>
		<div class="container-body">
		<form id="category-regist-form">
			<div class="input-group">
				<input type="text" class="form-control" name="category_name" id="category_name"> <span
					class="input-group-btn">
					<button type="button" class="btn btn-default" id="new-category">추가</button>
				</span>
			</div>
		</form>
			<div class="category-list">
				<%
					for(CategoryVO depth1 : categoryList) { 
				        	if(depth1.getCategory_depth().equals("1")) {
				        		int id = depth1.getCategory_id();
				%>
				<div class="category" id="<%=id%>">
					<div class="depth-1-category">
						<span><%=depth1.getCategory_name()%></span>
					</div>

					<div class="depth-2-category">
						<%
							for(CategoryVO depth2 : categoryList) { 
								        if(depth2.getCategory_depth().equals("2") 
								        		&& depth2.getCategory_parent_id() == id ) {
						%>
						<span><%=depth2.getCategory_name()%></span>
						<%
							}}
						%>
					</div>
				</div>
				<%
					}}
				%>

			</div>

		</div>
	</div>
	<script>
	
	
	
	$("#new-category").click(function(){
			$.ajax({
				data : {category_name : $("#category_name").val(), category_depth : 0},
				dataType : "json",
				url : "/admin/category/registAction",
				type : "post",
				success : function(data){
					location.href="/admin/category/update?category_id="
							+ data.result;
				}
			});
	});
			
	
		$(".category").click(
				function(e) {
					location.href = "/admin/category/update?category_id="
							+ $(this)[0].id;
		});
	</script>
</body>
</html>