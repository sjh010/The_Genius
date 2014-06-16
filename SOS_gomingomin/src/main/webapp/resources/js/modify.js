/**
 * Created by Administrator on 2014-06-15.
 */

jQuery.browser = {};
var form = $("#user-modify-form");

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
    };
    user_pw.focusout(function () { userPwChk(); });



    /* check user_pw */
    var user_new_pw = form.find("[name=user_new_password]");
    var user_new_pw_ok = false;
    var userNewPwChk = function(){
        if (user_new_pw.val().length < 8) {
            has_error(user_new_pw);
            $(".user-new-pw-msg").html("<span class='glyphicon glyphicon-remove'></span>8자 이상이어야 합니다");
        } else {
            has_success(user_new_pw);
            $(".user-new-pw-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
        }

            if (!(this.value === user_new_pwck.val())) {
                has_error(user_new_pwck);
                $(".user-new-pwck-msg").html("<span class='glyphicon glyphicon-remove'></span>비밀번호가 일치하지 않습니다");
                user_new_pw_ok = false;
            } else {
                has_success(user_pwck);
                $(".user-new-pwck-msg")
                    .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
                user_new_pw_ok = true;
            }
    };
    user_new_pw.focusout(function () { userNewPwChk(); console.log(user_new_pw_ok); });

    var user_new_pwck = form.find("[name=user_new_passwordck]");
    var userNewPwCkChk = function(){
        if ((user_new_pwck.val() == "") || (user_new_pw.val().length < 8) ) {
            has_error(user_new_pwck);
            $(".user-new-pwck-msg").html("<span class='glyphicon glyphicon-remove'></span>8자리 이상이어야 합니다");
            user_new_pw_ok = false;
        } else if(!(user_new_pwck.val() === user_new_pw.val())){
            $(".user-new-pwck-msg").html("<span class='glyphicon glyphicon-remove'></span>비밀번호가 일치하지 않습니다");
        }
        else {
            has_success(user_new_pwck);
            $(".user-new-pwck-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
            user_new_pw_ok = true;
        }
    };
    user_new_pwck.focusout(function () { userNewPwCkChk(); console.log(user_new_pw_ok);  });

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

    $("#user-modify-form .join").click(function () {
        var form = $("#user-join-form");
        if (!user_pw_ok) {
            user_pw.focus();
            userPwChk();
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
                user_id : user_id,
                user_pw : user_pw.val()
            };

            $.ajax({
                data : param,
                url: "/user/chkPassword",
                type: "post",
                success : function(data){
                    /*
                        비밀번호 데이터 먼저 확인 후에 진행한다.
                     */
                    var password = '';
                    if(user_new_pw_ok){
                        password = user_pw.val();
                    }

                    var update = {
                        user_pw : password,
                        user_addr : zipcode1+'-'+zipcode2+'||'+address1+'-'+address2,
                        user_email : email_id.val() + '@' + email_host.val(),
                        user_phone : phone1.val()+'-'+phone2.val()+'-'+phone3.val(),
                        user_mobile : mobile1.val()+'-'+mobile2.val()+'-'+mobile3.val()
                    };

                    $.ajax({
                        data : update,
                        url: "/user/modify",
                        type : "post",
                        success : function(data){
                            /*
                                성공하고 페이지 전환
                             */
                        }
                    });
                },
                failure : function(data){
                    console.log("에러입니다. 다음에 다시 시도해주세요..");
                }
            });
        }
    });
});
