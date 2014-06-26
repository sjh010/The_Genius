<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List, java.util.Map"%>
<%
	List<ProductVO> productList = (List<ProductVO>)request.getAttribute("productList");
	Map<Integer, String> parentCategoryNameMap = (Map<Integer, String>)request.getAttribute("parentCategoryNameMap");
	Map<Integer, String> childCategoryNameMap = (Map<Integer, String>)request.getAttribute("childCategoryNameMap");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>고민고민 관리자페이지</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="../navbar/navbar.jsp" flush="false"/>
<div class="container">
    <div class="container-header">
        <div class="page-header">
            <h1>상품관리</h1>
        </div>
    </div>
    <div class="container-body">
        <div class="board">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>사진</th>
                    <th>카테고리</th>
                    <th>상품이름</th>
                    <th>상품가격</th>
                    <th>메뉴</th>
                </tr>
                </thead>
                <tbody>
                <% for(ProductVO product : productList){ %>
                <tr class="product" id="<%=product.getProduct_id() %>">
                    <td class="id"><%=product.getProduct_id() %></td>
                    <td class="img"><img src="/resources/images/noImage.png"></td>
                    <td class="category"><%=parentCategoryNameMap.get(product.getCategory_id()) %>/
                    	<%=childCategoryNameMap.get(product.getCategory_id()) %></td>
                    <td class="product-name"><%=product.getProduct_name() %></td>
                    <td class="price">0원</td>
                    <td class="menu">
                        <button type="button" class="btn btn-default btn-sm product-update" >
                            <span class="glyphicon glyphicon-wrench"></span> 수정
                        </button>
                        <button type="button" class="btn btn-default btn-sm product-delete" >
                            <span class="glyphicon glyphicon-remove"></span> 삭제
                        </button>
                    </td>
                </tr>
                <%} %>
                </tbody>
            </table>
        </div>
        <div class="paging">
          <ul class="pagination">
			<%
				PagingVO pagingVo = (PagingVO) request.getAttribute("paging");
				int minPage = pagingVo.getMinPage();
				int maxPage = pagingVo.getMaxPage();
				int pageNo = pagingVo.getPageNo();
				 
				if(minPage - 1 >= 1){%>
					<li><a href="?page=<%=minPage %>">&laquo;</a></li>
				<%} else {	%>
						<li class="disabled"><a>&laquo;</a></li>
				<% } %>
				
				<% for (int i = minPage + 1; i <= maxPage; i++) {
						if (pageNo == i) { %>
					<li class="active"><a><%=i%></a></li>
				<% } else { %>
				<li><a href="?page=<%=i%>"><%=i%></a></li>
				<% }} %>
				
				<% if(maxPage + 1 <= pagingVo.getPageCnt()){%>
					<li><a href="?page=<%=(maxPage + 1) %>">&raquo;</a></li>
				<%} else {	%>
					<li class="disabled"><a>&raquo;</a></li>
				<% } %>
			</ul>
        </div>
        <div class="form-button">
            <button type="button" class="btn btn-default" id="product-add">등록</button>
        </div>
    </div>
</div>
<script>
$(function(){
	$('.product').each(function() {
		var productCode = $(this).children(".id")[0].innerText;
		var name = $(this).children(".product-name")[0];
		var image = $(this).children(".img").children("img")[0];
		var price = $(this).children(".price")[0];
		
		$.ajax({
		    url : 'http://apis.skplanetx.com/11st/common/products/'+productCode,
		    type : 'get',
		    dateType : 'JSON',
		    data : {
		        appKey : '3c64217d-ab48-329f-82a4-3fbdb55e79ec',    // 발급받은 key
		        option : 'PdOption',
		        version : 1    // API 버전 정보, type : number
		    },
		    success : function(data){
		        var productInfo = data.ProductInfoResponse.Product;
		        var productPrice = productInfo.ProductPrice;
		        name.innerText = productInfo.ProductName;
		        image.src = productInfo.BasicImage;
		        price.innerText = productPrice.LowestPrice+" ~ "+productPrice.Price;
		    }
		});
	});
});

$(".product-update").click(function(){
	location.href = "/admin/product/update?product_id="+$(this).parent().parent()[0].id;
});

$("#product-add").click(function(){
	location.href = "/admin/product/regist";
});

$(".product-delete").click(function(){
	if(confirm("해당 제품을 삭제하시겠습니까?")){
		$.ajax({
			data : {product_id :$(this).parent().parent()[0].id},
			type : 'post',
			dataType : 'json',
			url : '/admin/product/deleteAction',
			success: function(data){
				if(data.result == 'y') {
					alert("삭제되었습니다.");
					location.reload();
				}
			}
		});
	}
});


	
</script>
</body>
</html>