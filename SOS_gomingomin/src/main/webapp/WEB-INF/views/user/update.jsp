<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.sos.vo.*,java.text.DateFormat, java.text.SimpleDateFormat"%>
<%
	UserVO vo = (UserVO)request.getAttribute("UserVO");
	SimpleDateFormat str2date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat date2str = new SimpleDateFormat("yyyy년 MM월 dd일");
	String birth = date2str.format(str2date.parse(vo.getUser_birth()));
%>
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
		<form class="form-horizontal" role="form" id="user-modify-form">
					<div id="user-info">
						<div class="content-header">
							<span class="sub-title">회원정보수정</span>
							<span class="sub-desc">회원 정보를 수정합니다.</span>
						</div>
						<hr>
						<div class="input-area">
							<div class="form-group ">
								<label for="user_id" class="col-sm-2 control-label">아이디</label>
								<div class="col-sm-10">
									<label class="control-label"><%=vo.getUser_id() %></label>
								</div>
							</div>
							<div class="form-group">
								<label for="user_password" class="col-sm-2 control-label">비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control input-short"
										name="user_password" placeholder="수정할 경우에만 입력"> 
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
									<label class="control-label"><%=vo.getUser_name() %>(<%=(vo.getUser_sex().equals("M"))?"남":"여" %>)</label>
								</div>
							</div>
							<div class="form-group">
								<label for="user_birth" class="col-sm-2 control-label">생년월일</label>
								<div class="col-sm-10">
									 <label class="control-label"><%=birth%></label>
								</div>
							</div>
							<div class="form-group">
							<% 	String[] zipcode = (vo.getUser_addr()).split("____")[0].split("----");
            					String[] address = (vo.getUser_addr()).split("____")[1].split("----");
            				%>
								<label for="zipcode" class="col-sm-2 control-label">주소</label>
								<div class="col-sm-10 zipcode">
									<span>
										<input type="text" class="form-control" name="zipcode1" value="<%=zipcode[0] %>"></span>
										<span>-</span>
										<span><input type="text" class="form-control" name="zipcode2" value="<%=zipcode[1] %>">
									</span> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label"></label>
								<div class="col-sm-10 ">
									<input type="text" class="form-control address input-long" name="address1" value="<%=address[0] %>"> 
									<input type="text" class="form-control input-long" name="address2" value="<%=address[1] %>">
								</div>
							</div>
							<div class="form-group">
								<label for="user_phone" class="col-sm-2 control-label">휴대전화</label>
								<% 	String[] phone = (vo.getUser_phone()).split("-");%>
								<div class="col-sm-10">
									<select class="form-control phone" name="phone1">
				                        <option value="">선택</option>
				                        <option value="011" <%="011".equals(phone[0])?"selected":""%> >011</option>
				                        <option value="016" <%="016".equals(phone[0])?"selected":""%>>016</option>
				                        <option value="017" <%="017".equals(phone[0])?"selected":""%>>017</option>
				                        <option value="019" <%="018".equals(phone[0])?"selected":""%>>019</option>
				                        <option value="010" <%="010".equals(phone[0])?"selected":""%>>010</option>
				                    </select>
									<span>-</span> 
									<input type="text" class="form-control phone" name="phone2" value="<%=phone[1] %>"/> 
									<span>-</span> 
									<input type="text" class="form-control phone" name="phone3" value="<%=phone[2] %>"/> 
									<label class="control-label input-msg"></label>
								</div>
							</div>
							 <div class="form-group">
				                <label for="withdraw" class="col-sm-2 control-label">회원탈퇴</label>
				                <div class="col-sm-10">
				                    <button class="btn btn-default" id="user-modify-withdrawBtn">회원탈퇴요청</button>
				                </div>
				            </div>
				            <div class="form-group form-button">
				                    <button type="submit" class="btn btn-default ok">수정</button>
				                    <button type="submit" class="btn btn-default cancel">취소</button>
				            </div>
						</div>
					</div>
				</form>
		</div>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="withdrawModal" tabindex="-1" role="dialog" aria-labelledby="withdrawModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="withdrawModalLabel">NoGomin 회원탈퇴</h4>
            </div>
            <div class="modal-body">
                <form role="form" id="user-modify-withdrawForm">
                    <div class="form-group">
                        <label for="withdraw" class="control-label">회원탈퇴를 위해 회원님의 아이디를 입력하세요</label>
                        <input type="text" class="form-control" name="withdraw_message" placeholder="여기에 입력하세요">
                        <label class="control-label"><br>※회원탈퇴 후에는 동일한 아이디로 가입할 수 없습니다.</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="goWidthdraw">탈퇴</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<script src="/resources/js/user/update.js"></script>
<script>
	$(document).ready(function(){
		if("${result}" != ""){
			alert("${result}");
		} 
		
	});
</script>
</body>
</html>