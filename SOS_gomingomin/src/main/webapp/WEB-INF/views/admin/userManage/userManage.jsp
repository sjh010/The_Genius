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
            <h1>회원관리</h1>
        </div>
    </div>
    <div class="container-body">
        <form>
            <div class="form-group userManage-user-grade">
                <label class="control-label">해당 회원의 등급을</label>
                <select class="form-control input-short">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
                <label class="control-label">로 </label>
                <button type="button" class="btn btn-default ok">변경</button>
            </div>

            <div class="board">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th></th>
                        <th>아이디</th>
                        <th>등급</th>
                        <th>마지막접속</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="id">
                            <div class="checkbox">
                                <input type="checkbox" value="">
                            </div>
                        </td>
                        <td class="product-name">아이디1</td>
                        <td class="price">등급</td>
                        <td class="menu">2014/12/23 23:12:12</td>
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
        </form>
    </div>
</div>

</body>
</html>