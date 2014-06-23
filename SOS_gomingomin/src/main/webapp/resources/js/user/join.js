/**
 * Created by Administrator on 2014-06-10.
 */
jQuery.browser = {};
var form = $("#user-join-form");

/* 유효성 검사 */
$(function () {

    /* change text color */
    function has_error(el) {
        el.parent().parent().addClass("has-error");
    }

    function has_success(el) {
        el.parent().parent().removeClass("has-error");
        el.parent().parent().addClass("has-success");
    }

    /* check user_id */
    var user_id = form.find("[name=user_id]");
    var user_id_ok = false;
    var userIdCheck = function(){
        var id = /^[a-z0-9_-]{5,20}$/;
        if (user_id.val().length < 5) {
            has_error(user_id);
            $(".user-id-msg")
                .html("<span class='glyphicon glyphicon-remove'></span>5자 이상이어야 합니다");
        } else if (!id.test(this.value)) {
            has_error(user_id);
            $(".user-id-msg").html("영어/숫자만 가능합니다");
        } else {
            has_success(user_id);
            $(".user-id-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
            user_id_ok = true;
            $.ajax({
                data : user_id.val(),
                url: "/user/checkUserId",
                success : function(data){
                    if(data == 'y'){
                          has_success(user_id);
                            $(".user-id-msg")
                                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
                                user_id_ok = true;
                    } else {
                          has_error(user_id);
                            $(".user-id-msg").html("중복된 아이디입니다.");
                    }
                }
            });
        }
    };
    user_id.focusout(function(){userIdCheck()});

    /* check user_pw */
    var user_pw = form.find("[name=user_password]");
    var user_pw_ok = false;
    var userPwChk = function(){
        if (user_pw.val().length < 8) {
            has_error(user_pw);
            $(".user-pw-msg").html("<span class='glyphicon glyphicon-remove'></span>8자 이상이어야 합니다");
        } else {
            has_success(user_pw);
            $(".user-pw-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
        }

        if (user_pw_ok == true) {
            if (!(this.value === user_pwck.val())) {
                has_error(user_pwck);
                $(".user-pwck-msg").html("<span class='glyphicon glyphicon-remove'></span>비밀번호가 일치하지 않습니다");
                user_pw_ok = false;
            } else {
                has_success(user_pwck);
                $(".user-pwck-msg")
                    .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
                user_pw_ok = true;
            }
        }
    };
    user_pw.focusout(function () { userPwChk(); });

    var user_pwck = form.find("[name=user_passwordck]");
    var userPwCkChk = function(){
        if ((user_pwck.val() == "") || (!(user_pwck.val() === user_pw.val()))) {
            has_error(user_pwck);
            $(".user-pwck-msg").html("<span class='glyphicon glyphicon-remove'></span>비밀번호가 일치하지 않습니다");
            user_pw_ok = false;
        } else {
            has_success(user_pwck);
            $(".user-pwck-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
            user_pw_ok = true;
        }
    };
    user_pwck.focusout(function () { userPwCkChk(); });

    /* check user_name */
    var user_name = form.find("[name=user_name]");
    var user_name_ok = false;

    var userNameChk = function(){
        if (user_name.val() == "") {
            has_error(user_name);
            $(".user-name-msg").html("<span class='glyphicon glyphicon-remove'></span>이름을 입력하세요");
        } else {
            has_success(user_name);
            $(".user-name-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>");
            user_name_ok = true;
        }
    };
    user_name.focusout(function () {userNameChk();});

    /* check user_name */
    var user_birth = form.find("[name=user_birth]");
    user_birth.datepicker({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        showMonthAfterYear: true,
        changeMonth: true,
        changeYear: true,
        beforeShow: function(input) {
            var i_offset= $(input).offset();
            setTimeout(function(){
                $('#ui-datepicker-div').css({'top':i_offset.top, 'bottom':'', 'right':'10px'});
            })

        }
    });
    var user_birth_ok = false;
    var userBirthChk = function(){
        if (user_birth.val() == "") {
            has_error(user_birth);
            $(".user-birth-msg").html("<span class='glyphicon glyphicon-remove'></span>생년월일을 입력하세요");
        } else {
            has_success(user_birth);
            $(".user-birth-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>");
            user_birth_ok = true;
        }
    };
    user_birth.change(function () {userBirthChk();});

    /* check user_sex */
    var user_sex = form.find("[name=user_sex]");
    var user_sex_ok = false;
    var userSexChk = function(){
        if (!user_sex.checked) {
            has_success(user_sex.parent().parent());
            $(".user-sex-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>");
            user_sex_ok = true;
        }
        if(!user_sex_ok){
            has_error(user_sex.parent().parent());
            $(".user-sex-msg")
                .html("<span class='glyphicon glyphicon-remove'></span>성별을 선택하세요");
        }
    };
    user_sex.change(function () {userSexChk(); console.log("asdf");});

    /* check user_email */
    var email_host = form.find("[name=email_host]");
    var email_id = form.find("[name=email_id]");
    var user_email_ok = false;
    var userEmailChk = function () {
        var regEmail = /((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if ((email_id.val() == "") || (email_host.val() == "") || !regEmail.test(email_host.val())) {
            has_error(email_id);
            $(".user-email-msg")
                .html("<span class='glyphicon glyphicon-remove'></span>메일주소를 정확히 입력하세요");
        }
        else {
            user_email_ok = true;
            has_success(email_id);
            $(".user-email-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>");
        }
    };
    email_id.focusout(function () {
        userEmailChk()
    });
    email_host.focusout(function () {
        if ($(this).val() == 'edit') {
            $("#email-select-box").html("<input type='text' class='form-control email' name='email_host'/>");
            email_host = form.find("[name=email_host]");
        }
        userEmailChk();
    });

    var user_addr_ok = false;
    var zipcode1 = form.find("[name=zipcode1]");
    var zipcode2 = form.find("[name=zipcode2]");
    var address1 = form.find("[name=address1]");
    var address2 = form.find("[name=address2]");

    var userAddressChk = function () {
        var regZipcode = /^[0-9]{3,4}$/;
        if ((!regZipcode.test(zipcode1.val())) || (!regZipcode.test(zipcode2.val()))
            || ((address1.val() == "") || (address2.val() == ""))) {
            has_error(zipcode1.parent());
            has_error(address1);
            $(".user-address-msg")
                .html("<span class='glyphicon glyphicon-remove'></span>주소를 입력하세요");
        }
        else {
            user_addr_ok = true;
            has_success(zipcode1.parent());
            has_success(address1);
            $(".user-address-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>");
        }
    };
    zipcode1.focusout(function () {userAddressChk() });
    zipcode2.focusout(function () {userAddressChk() });
    address1.focusout(function () {userAddressChk() });
    address2.focusout(function () {userAddressChk() });

    var user_phone_ok = false;
    var phone1 = form.find("[name=phone1]");
    var phone2 = form.find("[name=phone2]");
    var phone3 = form.find("[name=phone3]");

    var userPhoneChk = function () {
        var regPhone = /^[0-9]{3,4}$/;

        console.log((!regPhone.test(phone1.val())));
        console.log((!regPhone.test(phone2.val())));
        console.log((!regPhone.test(phone3.val())));

        if ((!regPhone.test(phone1.val())) || (!regPhone.test(phone2.val())) ||(!regPhone.test(phone3.val()))) {
            has_error(phone1);
            $(".user-phone-msg")
                .html("<span class='glyphicon glyphicon-remove'></span>전화번호를 입력하세요");
        }
        else {
            user_phone_ok = true;
            has_success(phone1);
            $(".user-phone-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>");
        }
    };
    phone1.focusout(function () {userPhoneChk() });
    phone2.focusout(function () {userPhoneChk() });
    phone3.focusout(function () {userPhoneChk() });


    var user_mobile_ok = false;
    var mobile1 = form.find("[name=mobile1]");
    var mobile2 = form.find("[name=mobile2]");
    var mobile3 = form.find("[name=mobile3]");

    var userMobileChk = function () {
        var regmobile = /^[0-9]{3,4}$/;

        if ((!regmobile.test(mobile1.val())) || (!regmobile.test(mobile2.val())) ||(!regmobile.test(mobile3.val()))) {
            has_error(mobile1);
            $(".user-mobile-msg")
                .html("<span class='glyphicon glyphicon-remove'></span>휴대전화를 입력하세요");
        }
        else {
            user_mobile_ok = true;
            has_success(mobile1);
            $(".user-mobile-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>");
        }
    };
    mobile1.focusout(function () {userMobileChk() });
    mobile2.focusout(function () {userMobileChk() });
    mobile3.focusout(function () {userMobileChk() });

    $("#user-join-form .join").click(function () {
        var form = $("#user-join-form");
        if (!user_id_ok) {
            user_id.focus();
            userIdCheck();
        } else if (!user_pw_ok) {
            user_pw.focus();
            userPwChk();
        } else if (!user_name_ok) {
            user_name.focus();
            userNameChk();
        } else if (!user_birth_ok) {
            user_birth.focus();
            userBirthChk();
        } else if (!user_sex_ok) {
            user_sex.focus();
            userSexChk();
        } else if (!user_email_ok) {
            email_id.focus();
            userEmailChk();
        } else if (!user_phone_ok) {
            zipcode1.focus();
            userAddressChk();
        } else if (!user_mobile_ok) {
            mobile1.focus();
            userMobileChk();
        } else {
            var param = {
                user_id : user_id.val(),
                user_pw : user_pw.val(),
                user_name : user_name.val(),
                user_birth : user_birth.val(),
                user_sex : user_sex.val(),
                user_addr : zipcode1+'-'+zipcode2+'||'+address1+'-'+address2,
                user_email : email_id.val() + '@' + email_host.val(),
                user_phone : phone1.val()+'-'+phone2.val()+'-'+phone3.val(),
                user_mobile : mobile1.val()+'-'+mobile2.val()+'-'+mobile3.val()
            };


            $.ajax({
                data : param,
                type:'post',
                url: "/joinAction",
                dataType : "json",
                success : function(data){
                	/* 가입처리가 완료되었으면 selectCharacter페이지로 이동한다. */
                	if(data.result == 'y') location.replace('/user/selectCharacter');
                    	else if(data.result == 'n') alert("에러입니다. 다음에 다시 시도해주세요..");
                },
                failure : function(){
                	alert("에러입니다. 다음에 다시 시도해주세요..");
                }
            });
        }
    });
});
