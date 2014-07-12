<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
<meta charset="UTF-8">
<title>고민고민</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/lib/datepicker.css"/>
<link rel="stylesheet" href="/resources/css/top.css">
<link rel="stylesheet" href="/resources/css/import.css">
<link rel="stylesheet" href="/resources/css/animate.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
	<jsp:include page="../navbar/navbar.jsp" flush="false" />
	<!-- 메인페이지 시작-->
	<div class="container">
		<div class="container-header">
			<img src="/resources/images/logo/join.png">
		</div>
		<div class="container-body">
		<form class="form-horizontal" role="form" id="user-join-form">
					<div id="user-info">
						<div class="content-header">
							<span class="sub-title">기본정보입력</span> <span class="sub-desc">가입에
								필요한 기본적인 회원정보를 입력해주세요</span>
						</div>
						<hr>
						<div class="input-area">
							<div class="form-group ">
								<label for="user_id" class="col-sm-2 control-label">아이디</label>
								<div class="col-sm-10">
									<input type="text" class="form-control input-short"
										name="user_id" placeholder="이메일 주소"> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="user_password" class="col-sm-2 control-label">비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control input-short"
										name="user_password" placeholder="8자리 이상"> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="user_passwordck" class="col-sm-2 control-label">비밀번호 확인</label>
								<div class="col-sm-10">
									<input type="password" class="form-control input-short"
										name="user_password_ck" placeholder="비밀번호 확인"> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="user_name" class="col-sm-2 control-label">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control input-short"
										name="user_name"> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="user_birth" class="col-sm-2 control-label">생년월일</label>
								<div class="col-sm-10">
									<input type="text" class="form-control input-short"
										name="user_birth" id="user_birth"> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="user_sex" class="col-sm-2 control-label">성별</label>
								<div class="col-sm-10">
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-default"> 
											<input type="radio" name="user_sex" value="M">남자
										</label> 
										<label class="btn btn-default"> 
											<input type="radio" name="user_sex" value="F">여자
										</label>
									</div>
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="zipcode" class="col-sm-2 control-label">주소</label>
								<div class="col-sm-10 zipcode">
									<span>
										<input type="text" class="form-control" name="zipcode1"></span>
										<span>-</span>
										<span><input type="text" class="form-control" name="zipcode2">
									</span> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label"></label>
								<div class="col-sm-10 ">
									<input type="text" class="form-control address input-long" name="address1"> 
									<input type="text" class="form-control input-long" name="address2">
								</div>
							</div>
							<div class="form-group">
								<label for="user_phone" class="col-sm-2 control-label">휴대전화</label>

								<div class="col-sm-10">
									<select class="form-control phone" name="phone1">
										<option value="">선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select> 
									<span>-</span> 
									<input type="text" class="form-control phone" name="phone2" /> 
									<span>-</span> 
									<input type="text" class="form-control phone" name="phone3" /> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
						</div>
					</div>
					<div class="selectCharacter" id="character-info"
						style="display: none">
						<div class="join-header">
							<span class="sub-title">캐릭터정보 선택</span> <span class="sub-desc">자신의
								성향을 나타내는 캐릭터를 드래그해서 올려주세요</span>
						</div>
						<hr>
						<div id="img_wrapper">
							<img id="1" src="/resources/images/character/한효주2.png">
							<img id="2" src="/resources/images/character/고현정1.png">
							<img id="3" src="/resources/images/character/공효진.png">
							<img id="4" src="/resources/images/character/김명민.png">
							<img id="5" src="/resources/images/character/김수현.png">
							<img id="6" src="/resources/images/character/김혜수.png">
							<img id="7" src="/resources/images/character/김희애.png">
							<img id="8" src="/resources/images/character/류승범.png">
							<img id="9" src="/resources/images/character/황정민.png">
							<img id="10" src="/resources/images/character/박해일.png">
							<img id="11" src="/resources/images/character/소지섭.png">
							<img id="12" src="/resources/images/character/손예진.png">
							<img id="13" src="/resources/images/character/송중기.png">
							<img id="14" src="/resources/images/character/안성기.png">
							<img id="15" src="/resources/images/character/유해진.png">
							<img id="16" src="/resources/images/character/이정재.png">
							<img id="17" src="/resources/images/character/전지현.png">
							<img id="18" src="/resources/images/character/이병헌.png">
							<img id="19" src="/resources/images/character/이영애.png">
							<img id="20" src="/resources/images/character/하정우.png">
						</div>
						<div class="btnNav">
							<span id="left"><img src="/resources/images/icon/left.png">
							</span> <span id="right"><img
								src="/resources/images/icon/right.png"> </span>
						</div>
						<!--선택한 캐릭터(Drag & Drop)-->
						<section class="character">
							<div id="selectedCharacter">
								<div class="selected" id="character1" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
								<div class="selected" id="character2" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
								<div class="selected" id="character3" ondrop="drop(event)"
									ondragover="allowDrop(event)"></div>
							</div>
						</section>
						<div class="character-button">
							<button class="btn btn-info refresh">초기화</button>
						</div>
					</div>
					<hr>
					<div class="join-nav">
						<button type="button" class="btn btn-default" id="join-prev" disabled>
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<button type="button" class="btn btn-default" id="join-next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</div>
					<div class="button-area">
						<button type="button" class="btn btn-default ok">확인</button>
						<button type="button" class="btn btn-default cancel">취소</button>
					</div>
				</form>
		</div>
		
	</div>
	<!--/ 메인페이지 끝-->
	<script src="/resources/js/lib/bootstrap-datepicker.js"></script>
<script src="/resources/js/regist.js"></script>
	<script>
		
		$(".main-circle").hover(
				function() {
					$(this).children(".main-outer-circle").addClass(
							"main-spread-circle");
					$(this).children(".main-inner-circle").addClass(
							"main-inner-show");
					$(this).children(".depth1-info").addClass(
							"main-circle-hidden");
				},
				function() {
					$(this).children(".main-outer-circle").removeClass(
							"main-spread-circle");
					$(this).children(".main-inner-circle").removeClass(
							"main-inner-show");
					$(this).children(".depth1-info").removeClass(
							"main-circle-hidden");
				});
	</script>
</body>
</html>