/**
 * Created by Saemi Lim on 2014-06-13.
 */

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.sos.vo.*"%>
<%
	UserVO vo = (UserVO)request.getAttribute("UserVO");
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
            <h1>회원정보수정 <small>기본정보수정</small></h1>
        </div>
    </div>
    <div class="container-body">
        <form class="form-horizontal" role="form" id="user-modify-form">
            <div class="form-group">
                <label for="user_id" class="col-sm-2 control-label">아이디</label>
                <div class="col-sm-10">
                    <label class="control-label"><%=vo.getUser_id() %></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_pw" class="col-sm-2 control-label">현재 비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control input-short" name="user_password">
                    <label class="control-label user-pw-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_new_pw" class="col-sm-2 control-label">새 비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control input-short" name="user_new_password" placeholder="수정할 경우에만 입력">
                    <label class="control-label user-new-pw-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_pw" class="col-sm-2 control-label">새 비밀번호 확인</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control input-short" name="user_new_passwordck">
                    <label class="control-label user-new-pwck-msg"></label>
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
                    <label class="control-label"><%=vo.getUser_birth()%></label>
                </div>
            </div>
            <div class="form-group">
            <% String[] email = (vo.getUser_email()).split("@");%>
                <label for="email" class="col-sm-2 control-label">이메일</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control email" name="email_id" value="<%=email[0]%>"/>@
                    <div class="email" id="email-select-box">
                        <input type='text' class='form-control email' name='email_host' value="<%=email[1]%>"/>
                    </div>
                    <label class="control-label user-email-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="zipcode" class="col-sm-2 control-label">우편번호</label>
                <div class="col-sm-10 zipcode">
                    <span><input type="text" class="form-control" name="zipcode1"></span>
                    <span>-</span>
                    <span><input type="text" class="form-control" name="zipcode2"></span>
                    <span><button class="btn btn-default" id="searchZipcode">우편번호 검색</button></span>
                    <label class="control-label user-address-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="address" class="col-sm-2 control-label">주소</label>
                <div class="col-sm-10 ">
                    <input type="text" class="form-control address  input-long" name="address1">
                    <input type="text" class="form-control input-long" name="address2">
                </div>
            </div>
            <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">집전화</label>
                <div class="col-sm-10">
                    <select class="form-control mobile" name="phone1">
                        <option value="">선택</option>
                        <option value="02">02</option>
                        <option value="051">051</option>
                        <option value="053">053</option>
                        <option value="032">032</option>
                        <option value="062">062</option>
                        <option value="042">042</option>
                        <option value="052">052</option>
                        <option value="044">044</option>
                        <option value="031">031</option>
                        <option value="033">033</option>
                        <option value="043">043</option>
                        <option value="041">041</option>
                        <option value="063">063</option>
                        <option value="061">061</option>
                        <option value="054">054</option>
                        <option value="055">055</option>
                        <option value="064">064</option>
                    </select>
                    <span>-</span>
                    <input type="text" class="form-control mobile" name="phone2"/>
                    <span>-</span>
                    <input type="text" class="form-control mobile" name="phone3"/>
                    <label class="control-label user-phone-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="mobile" class="col-sm-2 control-label">휴대전화</label>
                <div class="col-sm-10">
                    <select class="form-control mobile" name="mobile1">
                        <option value="">선택</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="019">019</option>
                        <option value="010">010</option>
                    </select>
                    <span>-</span>
                    <input type="text" class="form-control mobile" name="mobile2"/>
                    <span>-</span>
                    <input type="text" class="form-control mobile" name="mobile3"/>
                    <label class="control-label user-mobile-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="withdraw" class="col-sm-2 control-label">회원탈퇴</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-default" id="user-modify-withdrawBtn">회원탈퇴요청</button>
                </div>
            </div>
            <div class="form-group form-button">
                    <button type="submit" class="btn btn-default">수정</button>
                    <button type="submit" class="btn btn-default">취소</button>
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
                <button type="button" class="btn btn-primary">탈퇴</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<script src="js/modify.js"></script>
<script>
    $(function(){
        $("#user-modify-withdrawBtn").click(function(e){
            e.preventDefault();
            $("#withdrawModal").modal('show');
        });
    });
</script>
</body>
</html>