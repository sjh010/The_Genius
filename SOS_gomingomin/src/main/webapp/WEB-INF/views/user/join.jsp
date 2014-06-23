<!-- 
  Created by Saemi Lim on 2014-06-13.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Cookie[] cookies = request.getCookies(); 
	String user_id = null;
	String include = "../navbarNoLogin.jsp";
	if(cookies != null) {
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("user_id")) {
				user_id = cookie.getValue();
				include = "../navbarLogin.jsp";
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>고민고민</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="<%=include %>" flush="false">
	<jsp:param value="<%=user_id %>" name="user_id"/>
</jsp:include>

<div class="container">
    <div class="container-header">
        <div class="page-header">
            <h1>회원가입 <small>기본정보입력</small></h1>
        </div>
    </div>
    <div class="container-body">
        <form class="form-horizontal" role="form" id="user-join-form">
            <div class="form-group ">
                <label for="user_id" class="col-sm-2 control-label">아이디</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control input-short" name="user_id" placeholder="5자리 이상 영문 소문자/숫자">
                    <label class="control-label user-id-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_password" class="col-sm-2 control-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control input-short" name="user_password" placeholder="8자리 이상">
                    <label class="control-label user-pw-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_passwordck" class="col-sm-2 control-label">비밀번호 확인</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control input-short" name="user_passwordck" placeholder="비밀번호 확인">
                    <label class="control-label user-pwck-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_name" class="col-sm-2 control-label">이름</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control input-short" name="user_name">
                    <label class="control-label user-name-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_birth" class="col-sm-2 control-label">생년월일</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control input-short" name="user_birth">
                    <label class="control-label user-birth-msg"></label>
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
                    <label class="control-label user-sex-msg"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="user_email" class="col-sm-2 control-label">이메일</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control email" name="email_id"/>@
                    <div class="email" id="email-select-box">
                        <select class="form-control " name="email_host">
                            <option value=""></option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="edit">직접입력</option>
                        </select>
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
                    <input type="text" class="form-control address input-long" name="address1">
                    <input type="text" class="form-control input-long" name="address2">
                </div>
            </div>
            <div class="form-group">
                <label for="user_phone" class="col-sm-2 control-label">전화번호</label>
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
                <label for="user_mobile" class="col-sm-2 control-label">휴대전화</label>
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
                <div class="col-sm-offset-2 col-sm-10 form-button">
                    <button type="button" class="btn btn-default ok">가입</button>
                    <button type="button" class="btn btn-default cancel">취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="/resources/js/user/join.js"></script>
</body>
</html>