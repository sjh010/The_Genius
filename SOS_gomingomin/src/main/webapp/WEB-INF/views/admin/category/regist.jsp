<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<% List<CategoryVO> categoryList = (List<CategoryVO>)request.getAttribute("categoryList"); %>
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
        <div class="category-select">
            <ul id="category-list">
                <li id="1">컴퓨터</li>
                <li id="2">신발</li>
                <li id="3">가방</li>
                <li id="4">옷</li>
                <li id="5">냉장고</li>
                <li id="6">ㅇㅇㅇ</li>
                <li id="7">ㅁㅇㅁㄴㅇ</li>
                <li id="8">ㄴㅇㅁ</li>
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
            <input type="hidden" value="" name="category_id">
        </form>
            <div class="category-menu">
                <div class="input-group">
                <input type="text" class="form-control" id="category-input">
                    <span class="input-group-btn">
                            <button type="button" class="btn btn-default" id="category-regist">적용</button>
                            <button type="button" class="btn btn-default" id="category-delete">삭제</button>
                    </span>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 form-button">
                    <button type="button" class="btn btn-default delete">현재 카테고리 삭제</button>
                    <button type="button" class="btn btn-default cancel">취소</button>
                </div>
            </div>
    </div>
</div>
<script src="../../js/lib/Chart.js"></script>
<script src="../../js/chart.js"></script>
<script>
    $(function () {

        var $form =$("#admin-category-form");
        var selected = false;
        var isNewCategory = false;
//        $("#category-list").sortable();
//        $("#category-list").disableSelection();

        $('#category-list li').mouseup(function () {
            $('#category-list li').removeClass("category-selected");
            $(this).addClass("category-selected");

            $form.find("[name=category_id]")[0].value = $(".category-selected")[0].id;
            selected = true;
        });


        $("#category-add").click(function () {
            console.log(isNewCategory);
            if(!isNewCategory){
                isNewCategory = true;
                $('#category-list li').removeClass("category-selected");
                $("#category-list").append("<li class='category-selected category-unsaved'>새로운 카테고리</li>");
                $(".category-select").animate({ scrollTop: $('.category-select')[0].scrollHeight}, 1000);

                $("#category-input").val("새로운 카테고리");
                $("#category-input").focus();
            } else $("#category-input").focus();
        });

        $("#category-regist").click(function(){
            if($form.find("[name=category_id]")[0].value == "") {
                //추가
                $.ajax({
                    data : $form.serialize(),
                    dataType : 'json',
                    url : '/admin/',
                    type : 'post',
                    success : function(data) {
                        console.log(data);
                        isNewCategory = false;
                    }
                });
            } else {
                //수정
                $.ajax({
                    data : $form.serialize(),
                    dataType : 'json',
                    url : '/admin/',
                    type : 'post',
                    success : function(data) {
                        console.log(data);
                    }
                });
            }
        });
        
        $("#category-delete").click(function () {
            if(selected){
                if(confirm($(".category-selected")[0].innerHTML+" 카테고리를 삭제하시겠습니까?")){
                    $.ajax({
                        data : {category_id:$form.find("[name=category_id]")[0].value},
                        dataType : 'json',
                        url : '/admin/',
                        type : 'post',
                        success : function(data) {
                            console.log(data);
                        }
                    });
                }
            }
        });
    });
</script>
</body>
</html>