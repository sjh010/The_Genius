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
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="../default.jsp" flush="false"/>
<div class="container">
    <div class="container-header">
        <div class="page-header">
            <h1>카테고리관리
                <small>등록</small>
            </h1>
        </div>
    </div>
    <div class="container-body">
        <div class="category-list">
            <div class="category" id="category1">
                <div class="depth-1-category">
                    <span>컴퓨터/가전</span>
                </div>

                <div class="depth-2-category">
                    <span>aaaa</span>
                    <span>aaaa</span>
                    <span>aaaa</span>
                    <span>aaaa</span>
                    <span>aaaa</span>
                    <span>aaaa</span>
                </div>
            </div>
            <div class="category" >
                <div class="input float">
                    <div class="form-group">
                        <input type="text" class="form-control">
                    </div>
                </div>
                <div class="float category-add">
                    <button type="button" class="btn btn-default">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </div>
            </div>

        </div>

    </div>
</div>
<script>
    $(".category").click(function(e){
        console.log($(this)[0]);
    });
</script>
</body>
</html>