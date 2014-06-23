<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>고민고민 관리자페이지</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    <style>
        #sortable1 {
            list-style-type: none;
            margin: 0;
            padding: 0;
            zoom: 1;
        }

        #sortable1 li {
            margin: 0 5px 5px 5px;
            padding: 3px;
            width: 90%;
        }

        #sortable1 :active {
            background-color: dodgerblue
        }
    </style>
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="../default.jsp" flush="false"/>

<div class="container">
    <div class="container-header">
        <div class="page-header">
            <h1>카테고리관리
                <small>수정</small>
            </h1>
        </div>
    </div>
    <div class="container-body">
        <div class="catagory-select">
            <ul id="sortable1">
                <li id="1">1</li>
                <li id="2">1</li>
                <li id="3">1</li>
                <li id="4">1</li>
                <li id="5">1</li>
                <li id="6">1</li>
                <li id="7">1</li>
                <li id="8">1</li>
            </ul>

        </div>
        <hr>
        <form class="form-horizontal" role="form" id="admin-product-form">
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
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 form-button">
                    <button type="button" class="btn btn-default delete">삭제</button>
                    <button type="button" class="btn btn-default ok">확인</button>
                    <button type="button" class="btn btn-default cancel">취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="../../js/lib/Chart.js"></script>
<script src="../../js/chart.js"></script>
<script>
    $(function () {
        $("#sortable1").sortable();

        $('#sortable1 li').mouseup(function(){
            console.log($(this).attr("id"));
        });

        $("#sortable1").disableSelection();
    });
</script>
</body>
</html>