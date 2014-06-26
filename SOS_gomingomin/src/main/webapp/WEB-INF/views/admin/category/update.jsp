<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<% List<CategoryVO> categoryList = (List<CategoryVO>)request.getAttribute("categoryList"); %>
<% CategoryVO parentCategory = (CategoryVO)request.getAttribute("parentCategory"); %>
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
            <h1>카테고리관리
                <small>수정</small>
            </h1>
        </div>
    </div>
    <div class="container-body">
    <h3><%=parentCategory.getCategory_name()+" 카테고리"%></h3>
        <div class="category-select">
            <ul id="category-list">
            <% for(CategoryVO category : categoryList) { %>
                <li id="<%=category.getCategory_id() %>"><%=category.getCategory_name() %></li>
            <%} %>
            </ul>
        </div>
        <div class="form-button">
            <button type="button" class="btn btn-default" id="category-add">카테고리 추가</button>
        </div>
        <form class="form-horizontal" role="form" id="admin-category-form">
            <div class="character-select">
                <div class="col-md-12 chart">
                    <canvas id="myChart" width="300px" height="300px"></canvas>
                </div>
                <div class="col-md-12 character-select">
                    <div class="character-select-element">
                        <label class="control-label">모험가</label>
                        <select class="form-control" name="type_adventure">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                        <label class="control-label">실행가</label>
                        <select class="form-control" name="type_practice">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                        <label class="control-label">규율숭배자</label>
                        <select class="form-control" name="type_rule">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                        <label class="control-label">전통주의자</label>
                        <select class="form-control" name="type_tradition">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                        <label class="control-label">조화론자</label>
                        <select class="form-control" name="type_harmony">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                        <label class="control-label">향유자</label>
                        <select class="form-control" name="type_enjoyment">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                        <label class="control-label">향락주의자</label>
                        <select class="form-control" name="type_pleasure">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
            </div>
            <input type="hidden"  name="category_id" value='no'>
            <input type="hidden"  name="category_depth" value='2'>
            <input type="hidden" value="<%=request.getParameter("category_id") %>" name="category_parent_id">
        <div class="category-menu">
                <div class="input-group">
                <input type="text" class="form-control" id="category-input" name="category_name"> 
                    <span class="input-group-btn">
                            <button type="button" class="btn btn-default" id="category-regist">적용</button>
                            <button type="button" class="btn btn-default" id="category-delete">삭제</button>
                    </span>
                </div>
            </div>
        </form>
            
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 form-button">
                    <button type="button" class="btn btn-default" id="current-category-delete">현재 카테고리 삭제</button>
                    <button type="button" class="btn btn-default cancel">취소</button>
                </div>
            </div>
    </div>
</div>
<script src="/resources/js/admin/lib/Chart.js"></script>
<script src="/resources/js/admin/chart.js"></script>
<script>
    $(function () {

        var $form =$("#admin-category-form");
        var selected = false;
        var isNewCategory = false;
        var category_id =$form.find("[name=category_id]")[0];
//        $("#category-list").sortable();
//        $("#category-list").disableSelection();

        $('#category-list').mouseup(function (e) {
        	var target = e.target;
        	
        	$('#category-list li').removeClass("category-selected");
            $(target).addClass("category-selected");

            category_id.value = $(".category-selected")[0].id;
            $("#category-input").val($(".category-selected")[0].innerHTML);
            
            if(category_id.value != "no"){
            	$.ajax({
                    data : {category_id:category_id.value},
                    dataType : 'json',
                    url : '/admin/category/getInfo',
                    type : 'post',
                    success : function(data) {
                        var vo = data.result;
                        
                        $form.find("[name=type_adventure]")[0].value = vo.type_adventure;
                        $form.find("[name=type_enjoyment]")[0].value = vo.type_enjoyment;
                        $form.find("[name=type_harmony]")[0].value = vo.type_harmony;
                        $form.find("[name=type_pleasure]")[0].value = vo.type_pleasure;
                        $form.find("[name=type_rule]")[0].value = vo.type_rule;
                        $form.find("[name=type_practice]")[0].value = vo.type_practice;
                        $form.find("[name=type_tradition]")[0].value = vo.type_tradition;
                        
                        initChart();
                    }
                });
            }
            selected = true;
        });
        
        $("#category-input").focusout(function(){
        	$(".category-selected")[0].innerHTML = $("#category-input").val();
        });


        $("#category-add").click(function () {
        	$('#category-list li').removeClass("category-selected");
        	$(".category-select").animate({ scrollTop: $('.category-select')[0].scrollHeight}, 1000);
        	$("#category-input").focus();
        	
        	if(!isNewCategory){
                isNewCategory = true;
                $("#category-list").append("<li class='category-selected category-unsaved' id='no'>새로운 카테고리</li>");
                $("#category-input").val("새로운 카테고리");
                
            } else {
            	$(".category-unsaved")[0].addClass("category-selected");
            }
        	
        	category_id.value = "no";
        });

        $("#category-regist").click(function(){
            if(category_id.value == "no") {
            	category_id.value = 0;
                //추가
                
                $.ajax({
                    data : $form.serialize(),
                    dataType : 'json',
                    url : '/admin/category/registAction',
                    type : 'post',
                    success : function(data) {
                    	alert("추가되었습니다.");
                        $(".category-unsaved")[0].id = data.result;
                        $(".category-unsaved").removeClass("category-unsaved");
                        
                        isNewCategory = false;
                    }
                });
            } else {
                //수정
                $.ajax({
                    data : $form.serialize(),
                    dataType : 'json',
                    url : '/admin/category/updateAction',
                    type : 'post',
                    success : function(data) {
						if(data.result == 'y') {
							alert("수정되었습니다.");
							location.reload();
						}
                    }
                });
            }
        });
        
        $("#category-delete").click(function () {
            if(selected){
                if(confirm($(".category-selected")[0].innerHTML+" 카테고리를 삭제하시겠습니까?")){
                    $.ajax({
                        data : {category_id:category_id.value},
                        dataType : 'json',
                        url : '/admin/category/deleteAction',
                        type : 'post',
                        success : function(data) {
							if(data.result == 'y') {
								alert("삭제되었습니다.");
								location.reload();
							}
                        }
                    });
                }
            }
        });
        
        $("#current-category-delete").click(function () {
            if(selected){
                if(confirm("현재 카테고리를 삭제하시겠습니까? 모든 하위 카테고리가 삭제됩니다.")){
                    $.ajax({
                        data : {category_parent_id:$form.find("[name=category_parent_id]")[0].value},
                        dataType : 'json',
                        url : '/admin/category/deleteParentAction',
                        type : 'post',
                        success : function(data) {
							if(data.result == 'y') {
								alert("삭제되었습니다.");
								location.replace("/admin/category");
							}
                        }
                    });
                }
            }
        });
    });
</script>
</body>
</html>