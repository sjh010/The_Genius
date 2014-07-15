<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<% List<CharacterVO> characterList = (List<CharacterVO>)request.getAttribute("characterList"); %>
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
    	<% if(characterList != null) { for(CharacterVO character : characterList) { %>
            <div class="select-element" id="<%=character.getCharacter_id() %>">
                <div class="image-frame" style="background-image: url('/resources/images/character/<%=character.getCharacter_img() %>');">
                    <a href="#" class="character-update"><span class="glyphicon glyphicon-wrench"></span></a>
                    <a href="#" class="character-delete"><span class="glyphicon glyphicon-remove"></span></a>
                </div>
                <div class="nametag"><%=character.getCharacter_name() %></div>
            </div>
         <% } }else{ %>
        	 <h3 class="searchbar">등록된 캐릭터가 존재하지 않습니다</h3>
        <%} %>
        </div>
    </div>
</div>
<script>



$('#character-add').click(function(){
	location.href="/admin/character/regist";
});


$('.character-update').click(function(){
	location.href ="/admin/character/update?character_id="+$(this).parent().parent().attr("id");
});

    $('.character-delete').click(function(){
        if(confirm("해당 캐릭터를 삭제하시겠습니까？")){
            $.ajax({
                data : {character_id : $(this).parent().parent().attr("id")},
                type : 'post',
                url : '/admin/character/deleteAction',
                dataType : 'json',
                success : function(data){
    				if(data.result == 'y') {
    					alert("삭제되었습니다");
    					location.reload();
    				}
    			}
            });
        }
    });
</script>
</body>
</html>