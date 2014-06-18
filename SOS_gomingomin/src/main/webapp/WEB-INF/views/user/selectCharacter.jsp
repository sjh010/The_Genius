<!-- 
  Created by Saemi Lim on 2014-06-13.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.*"%>
<%
	List<CharacterVO> voList = (List<CharacterVO>)request.getAttribute("CharacterVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>고민고민</title>
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
	<jsp:include page="../default.jsp" flush="false" />


<div class="container">
    <div class="container-header">
        <div class="page-header">
            <h1>회원가입
                <small>추가정보선택</small>
            </h1>
        </div>
    </div>
    <div class="container-body">
        <div class="media">
            <a class="pull-left" href="#"><span class="media-object glyphicon glyphicon-question-sign"></span></a>

            <div class="media-body">
                <h4 class="media-heading">자신의 성향을 선택하는 페이지입니다. 해당정보는 좀 더 효과적인 추천, 검색 기능이 제공하기 위해 사용됩니다.</h4>
            </div>
        </div>
        <div class="row selectBox">
            <%	for(CharacterVO vo : voList){ %>
            		<div class="select-element">
		                <div class="image-frame">
		                    <img class="no-selected" name="<%=vo.getCharacter_name() %>" 
		                    id="<%=vo.getCharacter_id() %>" 
		                    src="<%=vo.getCharacter_img() %>>"/>
		                </div>
		                <div class="nametag">정우성</div>
		            </div>
            <% }%>
            <div class="dummy"></div>
        </div>
        <div class="rows selectList"></div>
        <form class="form-button" id="user-selectCharacter-form">
            <button type="button" class="btn btn-default init">초기화</button>
            <button type="button" class="btn btn-default select">확인</button>
            <button type="button" class="btn btn-default">취소</button>
        </form>
    </div>
</div>
<script src="js/select.js"></script>
</body>
</html>