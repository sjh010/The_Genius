<!-- 
  Created by Saemi Lim on 2014-06-17.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.sos.vo.*, java.util.List"%>
<%
	String user_name = request.getParameter("user_name");
%>
<!-- 네비게이션 -->
<nav>
	<div class="nav">
		<div class="nav-menu" id="home">
			<img class="nav-menu-img" src="/resources/images/icon/white/home.png">
			<span class="nav-menu-title">Home</span>
		</div>
		<div class="nav-menu" id="logout">
			<img class="nav-menu-img"
				src="/resources/images/icon/white/logout.png"> <span
				class="nav-menu-title">Exit</span>
		</div>
		<div class="nav-menu" id="mypage">
			<img class="nav-menu-img" src="/resources/images/icon/white/mypage.png">
			<span class="nav-menu-title">My</span>
		</div>
	</div>
</nav>

<!-- 로그인 창 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="loginModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<img src="/resources/images/logo/login.png">
			</div>
			<div class="modal-body">
				<form class="login-box">
					<div class="login-line">
						<input class="form-control" type="text" placeholder="아이디">
						<input class="form-control" type="password" placeholder="비밀번호">
					</div>
					<div class="login-button">
						<button class="btn btn-info">로그인</button>
					</div>
					<div class="login-menu">
						<span>회원가입</span> <span>비밀번호 찾기</span>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--/로그인 끝 -->
<!-- 가입페이지 시작-->
<div class="modal fade" id="joinModal" tabindex="-1" role="dialog"
	aria-labelledby="joinModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<img src="/resources/images/logo/join.png">
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" id="user-join-form">
					<div id="user-info">
						<div class="join-header">
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
										name="user_birth"> 
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
							<img id="img_1" src="/resources/images/character/한효주2.png">
							<img id="img_2" src="/resources/images/character/고현정1.png">
							<img id="img_3" src="/resources/images/character/공효진.png">
							<img id="img_4" src="/resources/images/character/김명민.png">
							<img id="img_5" src="/resources/images/character/김수현.png">
							<img id="img_6" src="/resources/images/character/김혜수.png">
							<img id="img_7" src="/resources/images/character/김희애.png">
							<img id="img_8" src="/resources/images/character/류승범.png">
							<img id="img_9" src="/resources/images/character/황정민.png">
							<img id="img_10" src="/resources/images/character/박해일.png">
							<img id="img_11" src="/resources/images/character/소지섭.png">
							<img id="img_12" src="/resources/images/character/손예진.png">
							<img id="img_13" src="/resources/images/character/송중기.png">
							<img id="img_14" src="/resources/images/character/안성기.png">
							<img id="img_15" src="/resources/images/character/유해진.png">
							<img id="img_16" src="/resources/images/character/이정재.png">
							<img id="img_17" src="/resources/images/character/전지현.png">
							<img id="img_18" src="/resources/images/character/이병헌.png">
							<img id="img_19" src="/resources/images/character/이영애.png">
							<img id="img_20" src="/resources/images/character/하정우.png">
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
	</div>
</div>
<!--/ 회원가입 끝 -->
<!--/ 네비게이션 끝 -->
<script src="/resources/js/lib/jquery-ui.min.js"></script>
<script src="/resources/js/regist.js"></script>
<script>
	var login = $("#login");
	var join = $("#join");

	$("#home").click(function() {
		location.href = "/";
	});

	login.click(function() {
		$('#loginModal').modal({
			backdrop : true
		});
	});

	join.click(function() {
		$('#joinModal').modal('toggle');
	});


	$(".nav-menu").hover(function() {
		$(this).find(".nav-menu-title").addClass("nav-menu-0-rotate");
		$(this).find(".nav-menu-img").addClass("nav-menu-90-rotate");
	}, function() {
		$(this).find(".nav-menu-title").removeClass("nav-menu-0-rotate");
		$(this).find(".nav-menu-img").removeClass("nav-menu-90-rotate");
	});
</script>