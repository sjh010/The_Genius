<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<% ProductVO product = (ProductVO)request.getAttribute("product"); %>
<% List<CategoryVO> parentCategoryList = (List<CategoryVO>)request.getAttribute("parentCategoryList"); %>
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
            <h1>상품관리<small>수정</small></h1>
        </div>
    </div>
    <div class="container-body">
        <form class="form-horizontal" role="form" id="admin-product-form">
	        <div class="product-info">
	            <div class="form-group">
	                <label class="col-sm-3 control-label text-center">11번가 상품코드</label>
	                <div class="col-sm-9">
	                	<input type="hidden" name="product_id" value="<%=product.getProduct_id() %>">
	                    <label class="control-label"><%=product.getProduct_id() %></label>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-3 control-label text-center">11번가 상품이름</label>
	                <div class="col-sm-9">
	                    <input type="text" class="form-control" name="product_name" value="<%=product.getProduct_name() %>">
	                </div>
	            </div>
	            <div class="form-group product-category">
	                <label class="col-sm-3 control-label text-center">카테고리 설정</label>
	                <div class="col-sm-9">
	                    <select class="form-control" id="category-1depth">
                            <option value="">1차 카테고리</option>
                            <% for(CategoryVO category : parentCategoryList){ %>
                            <option value="<%=category.getCategory_id()%>"><%=category.getCategory_name() %></option>
                            <%} %>
                        </select>
	                     <select class="form-control" id="category_id" name="category_id">
                            <option value="1">2차 카테고리</option>
                        </select>
	                </div>
	            </div>
	         </div>
            <div class="character-select">
                <div class="col-md-12 chart">
                    <canvas id="myChart" width="300px" height="300px"></canvas>
                </div>
                <div class="col-md-12 character-select">
                   <div class="character-select-element">
                    <% String type_adventure = String.valueOf((int)product.getType_adventure()); %>
                        <label class="control-label">모험가</label>
                        <select class="form-control" name="type_adventure">
                            <option value="1" <%="1".equals(type_adventure)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_adventure)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_adventure)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_adventure)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_adventure)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_practice = String.valueOf((int)product.getType_practice()); %>
                        <label class="control-label">실행가</label>
                        <select class="form-control" name="type_practice">
                           	<option value="1" <%="1".equals(type_practice)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_practice)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_practice)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_practice)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_practice)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_rule = String.valueOf((int)product.getType_rule()); %>
                        <label class="control-label">규율숭배자</label>
                        <select class="form-control" name="type_rule">
                            <option value="1" <%="1".equals(type_rule)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_rule)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_rule)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_rule)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_rule)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_tradition = String.valueOf((int)product.getType_tradition()); %>
                        <label class="control-label">전통주의자</label>
                        <select class="form-control" name="type_tradition">
                        	<option value="1" <%="1".equals(type_tradition)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_tradition)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_tradition)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_tradition)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_tradition)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_harmony = String.valueOf((int)product.getType_harmony()); %>
                        <label class="control-label">조화론자</label>
                        <select class="form-control" name="type_harmony">
                          	<option value="1" <%="1".equals(type_harmony)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_harmony)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_harmony)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_harmony)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_harmony)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_enjoyment = String.valueOf((int)product.getType_enjoyment()); %>
                        <label class="control-label">향유자</label>
                        <select class="form-control" name="type_enjoyment">
                     		<option value="1" <%="1".equals(type_enjoyment)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_enjoyment)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_enjoyment)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_enjoyment)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_enjoyment)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                       <% String type_pleasure = String.valueOf((int)product.getType_pleasure()); %>
                        <label class="control-label">향락주의자</label>
                        <select class="form-control" name="type_pleasure">
                    		<option value="1" <%="1".equals(type_pleasure)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_pleasure)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_pleasure)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_pleasure)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_pleasure)?"selected":""%>>5</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 form-button">
                    <button type="button" class="btn btn-default ok">확인</button>
                    <button type="button" class="btn btn-default cancel">취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="/resources/js/admin/lib/Chart.js"></script>
<script src="/resources/js/admin/chart.js"></script>

<script>

var option = {};
var category_id = $("select[name='category_id']");

category_id.change(function(){
	chartOfCategory();
});


$("#category-1depth").change(function(){
	if($("#category-1depth").val() != ""){
		$.ajax({
			data : {category_id:$("#category-1depth").val()},
			type : 'get',
			dataType : 'json',
			url : '/admin/product/getCategoryAction',
			success: function(data){
				option = data.result;
				$("select[name='category_id'] option").remove();
				$.each(option,function(idx,  obj) {
					$("select[name='category_id']")
					.append('<option value="' + obj.category_id + '">' + obj.category_name + '</option>');
	            });
			}
		});
	}
});

$("#admin-product-form .ok").click(function(){
	var $form = $("#admin-product-form");
	$.ajax({
		data : $form.serialize(),
		type : 'post',
		dataType : 'json',
		url : '/admin/product/updateAction',
		success: function(data){
			if(data.result == 'y') {
				alert("수정되었습니다.");
				location.replace("/admin/product");
			}
		}
	});
});

$(".cancel").click(function(){
	history.back();
});
</script>
</body>
</html>