<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*"%>
<% CharacterVO character = (CharacterVO)request.getAttribute("character"); %>

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
    <div class="container-body">
        <form class="form-horizontal" role="form" id="admin-character-form" enctype="multipart/form-data">
        <input type="hidden" value="<%=request.getParameter("character_id") %>" name="character_id">
        <input type="hidden" value="<%=character.getCharacter_img() %>" name="character_img">
            <div class="row">
                <div class="col-md-2 img-upload">
                
                    <img id="preview" src="/resources/images/character/<%=character.getCharacter_img() %>"/>
                    <input type="file" accept="image/*" name="file">
                </div>
                <div class="col-md-10 info-input">
                    <div class="form-group">
                        <label class="col-sm-1 control-label">이름</label>
                        <div class="col-sm-11">
                            <input type="text" class="form-control" name="character_name" 
                            value="<%=character.getCharacter_name() %>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label" >성별</label>
                        <div class="col-sm-11">
                            <select class="form-control" name="character_sex">
                            	<option value="M" <%="M".equals(character.getCharacter_sex())?"selected":""%>>남자</option>
                            	<option value="F" <%="F".equals(character.getCharacter_sex())?"selected":""%>>여자</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5 chart">
                    <canvas id="myChart" width="300px" height="300px"></canvas>
                </div>
                <div class="col-md-7 character-select rows">
                    <div class="character-select-element">
                    <% String type_adventure = String.valueOf((int)character.getType_adventure()); %>
                        <label class="control-label">모험가</label>
                        <select class="form-control" name="type_adventure">
                            <option value="1" <%="1".equals(type_adventure)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_adventure)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_adventure)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_adventure)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_adventure)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_practice = String.valueOf((int)character.getType_practice()); %>
                        <label class="control-label">실행가</label>
                        <select class="form-control" name="type_practice">
                           	<option value="1" <%="1".equals(type_practice)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_practice)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_practice)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_practice)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_practice)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_rule = String.valueOf((int)character.getType_rule()); %>
                        <label class="control-label">규율숭배자</label>
                        <select class="form-control" name="type_rule">
                            <option value="1" <%="1".equals(type_rule)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_rule)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_rule)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_rule)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_rule)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_tradition = String.valueOf((int)character.getType_tradition()); %>
                        <label class="control-label">전통주의자</label>
                        <select class="form-control" name="type_tradition">
                        	<option value="1" <%="1".equals(type_tradition)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_tradition)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_tradition)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_tradition)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_tradition)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_harmony = String.valueOf((int)character.getType_harmony()); %>
                        <label class="control-label">조화론자</label>
                        <select class="form-control" name="type_harmony">
                          	<option value="1" <%="1".equals(type_harmony)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_harmony)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_harmony)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_harmony)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_harmony)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                    <% String type_enjoyment = String.valueOf((int)character.getType_enjoyment()); %>
                        <label class="control-label">향유자</label>
                        <select class="form-control" name="type_enjoyment">
                     		<option value="1" <%="1".equals(type_enjoyment)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_enjoyment)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_enjoyment)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_enjoyment)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_enjoyment)?"selected":""%>>5</option>
                        </select>
                    </div>
                    <div class="character-select-element">
                       <% String type_pleasure = String.valueOf((int)character.getType_pleasure()); %>
                        <label class="control-label">향락주의자</label>
                        <select class="form-control" name="type_pleasure">
                    		<option value="1" <%="1".equals(type_pleasure)?"selected":""%>>1</option>
                            <option value="2" <%="2".equals(type_pleasure)?"selected":""%>>2</option>
                            <option value="3" <%="3".equals(type_pleasure)?"selected":""%>>3</option>
                            <option value="4" <%="4".equals(type_pleasure)?"selected":""%>>4</option>
                            <option value="5" <%="5".equals(type_pleasure)?"selected":""%>>5</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10 form-button">
                    <button type="button" class="btn btn-default ok">확인</button>
                    <button type="button" class="btn btn-default cancel">취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
$(document).ready(function(){
	if("${result}" == "y"){
		alert("수정되었습니다.");
		location.replace("/admin/character");
	} 
});

$("#admin-character-form input[name=file]").change(function(){
		var input = this;
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#preview').attr('src', e.target.result);
	        };

	        reader.readAsDataURL(input.files[0]);
	    }
});

$("#admin-character-form .ok").click(function(){
	var $form = $("#admin-character-form");
	$form.attr("method", "post");
	$form.attr("action", "/admin/character/updateAction");
	$form.submit();
});

$(".cancel").click(function(){
	history.back();
});
</script>
<script src="/resources/js/admin/lib/Chart.js"></script>
<script src="/resources/js/admin/chart.js"></script>
</body>
</html>