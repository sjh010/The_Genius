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
                <tr>
                    <td class="id">1</td>
                    <td class="img"><img src="../../정우성.png"></td>
                    <td class="category">카테고리1</td>
                    <td class="product-name">상품이름1</td>
                    <td class="price">123,435원</td>
                    <td class="menu">
                        <button type="button" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-wrench"></span> 수정
                        </button>
                        <button type="button" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-remove"></span> 삭제
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="paging">
            <ul class="pagination">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li class=""><a href="#">2</a></li>
                <li class=""><a href="#">3</a></li>
                <li class=""><a href="#">4</a></li>
                <li class=""><a href="#">5</a></li>
                <li class="disabled"><a href="#">&raquo;</a></li>
            </ul>
        </div>
        <div class="form-button">
            <button type="button" class="btn btn-default ok">등록</button>
        </div>
    </div>
</div>
</body>
</html>