<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="UTF-8">
    <title>고민고민</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="./navbar/navbar.jsp" flush="false"/>
<div class="container">
 <div class="container-body searchbar">
        키워드를 입력하세요
        <form class="input-group" id="search-form" action="/mySearch" method="get">
            <input type="text" class="form-control" name="keyword">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default ok">Go!</button>
                </span>
        </form>
    </div>
</div>
<script>

</script>
</body>
</html>