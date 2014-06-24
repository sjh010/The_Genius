<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<% List<CharacterVO> voList = (List<CharacterVO>)request.getAttribute("CharacterVO"); %>
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
            <h1>캐릭터관리
                <small>등록</small>
            </h1>
        </div>
    </div>
    <div class="form-button">
        <button type="button" class="btn btn-default" id="character-add">추가</button>
    </div>
    <div class="container-body">
        <div class="row selectBox">
    	<% if(voList != null) { for(CharacterVO vo : voList) { %>
            <div class="select-element" id="<%=vo.getCharacter_id() %>">
                <div class="image-frame" style="background-image: url('<%=vo.getCharacter_img() %>');">
                    <a href="/admin/character/update"><span class="glyphicon glyphicon-wrench"></span></a>
                    <a href="#" class="character-delete"><span class="glyphicon glyphicon-remove"></span></a>
                </div>
                <div class="nametag"><%=vo.getCharacter_name() %></div>
            </div>
         <% }} %>
        </div>
    </div>
</div>
<script>

$('#character-add').click(function(){
	location.replace("/admin/character/regist");
});


    $('.character-delete').click(function(){
        if(confirm("해당 캐릭터를 삭제하시겠습니까？")){
            $.ajax({
                data : {character_id : $(this).parent().parent().attr("id")},
                type : 'post',
                url : '/admin/character/deleteAction',
                dataType : 'json',
                success : function(data){
                    // 삭제 여부 확인
                }
            });
        }
    });
</script>
</body>
</html>