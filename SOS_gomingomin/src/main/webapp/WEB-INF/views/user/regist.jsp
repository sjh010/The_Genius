<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>고민고민</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<body>
<jsp:include page="../default.jsp" flush="false" />
<div class="page-header">
  <h1>회원가입 <small>기본정보입력</small></h1>
</div>
<div class="container">
  <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="user_id" class="col-sm-2 control-label">아이디</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="user_id">
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-sm-2 control-label">비밀번호</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="user_pw">
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-sm-2 control-label">비밀번호 확인</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="user_pwck">
            </div>
        </div>
        <div class="form-group">
            <label for="user_name" class="col-sm-2 control-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="user_name">
            </div>
        </div>
        <div class="form-group">
            <label for="user_birth" class="col-sm-2 control-label">생년월일</label>
            <div class="col-sm-10">
                    <input type="text" class="form-control" name="user_birth">
            </div>
        </div>
        <div class="form-group">
            <label for="user_sex" class="col-sm-2 control-label">성별</label>
            <div class="col-sm-10">
                <div class="btn-group" data-toggle="buttons">
                    <label class="btn btn-default">
                        <input type="radio" name="user_sex">남자
                    </label>
                    <label class="btn btn-default active">
                        <input type="radio" name="user_sex" checked="">여자
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">이메일</label>
            <div class="col-sm-10">
                <input type="text" class="form-control email" name="email_id"/>@
                <div class="email" id="email-select-box">
                    <select class="form-control " name="email_host">
                        <option value="">선택</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="naver.com">naver.com</option>
                        <option value="edit">직접입력</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="zipcode" class="col-sm-2 control-label">우편번호</label>
            <div class="col-sm-10 zipcode">
                <span><input type="text" class="form-control" name="zipcode1"></span>
                <span>-</span>
                <span><input type="text" class="form-control" name="zipcode2"></span>
                <span><button class="btn btn-default" id="searchZipcode">우편번호 검색</button></span>
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">주소</label>
            <div class="col-sm-10 ">
                <input type="text" class="form-control address" name="address1">
                <input type="text" class="form-control" name="address2">
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
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">가입</button>
                <button type="submit" class="btn btn-default">취소</button>
            </div>
        </div>
    </form>
</div>
<script src="/resources/js/default.js"></script>
</body>
</html>