/**
 * Created by Administrator on 2014-06-10.
 */


$("#user-join-form .join").click(function(e){
    var form = $("#user-join-form");
    console.log(form);
});


$(function () {
    /* 유효성 검사 */

    function has_error(el){
        el.parent().parent().addClass("has-error");
        el.parent().parent().addClass("has-feedback");
    }

    function has_success(el){
        el.parent().parent().removeClass("has-error");
        el.parent().parent().addClass("has-success");
    }

    var user_id = $("input[name='user_id']");
    var user_id_ok = false;
    user_id.change(function (e) {
        var id = /^[a-z0-9_-]{5,20}$/;
        if(this.value.length < 5){
            has_error(user_id);
            $(".user-id-msg")
                .html("<span class='glyphicon glyphicon-remove'></span>5자 이상이어야 합니다");
        } else if(!id.test(this.value)){
            has_error(user_id);
            $(".user-id-msg").html("영어/숫자만 가능합니다");
        } else {
            has_success(user_id);
            $(".user-id-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
//            $.ajax({
//                data : this.value,
//                url: "/user/checkUserId",
//                success : function(data){
//                    if(data == 'y'){
//                          has_success(user_id);
//                            $(".user-id-msg")
//                                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
//                                user_id_ok = true;
//                    } else {
//                          has_error(user_id);
//                            $(".user-id-msg").html("중복된 아이디입니다.");
//                    }
//                }
//            });
        }
    });

    var user_pw_ok = false;
    var user_pw = $("input[name='user_pw']");
    user_pw.change(function () {
        if(this.value.length < 8){
            has_error(user_pw);
            $(".user-pw-msg").html("8자 이상이어야 합니다");
        } else {
            has_success(user_pw);
            $(".user-pw-msg")
                .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
        }
        if(user_pw_ok == true){
            if(!(this.value === $("input[name='user_pwck']").val())){
                has_error(user_pwck);
                $(".user-pwck-msg").html("비밀번호가 일치하지 않습니다");
                user_pw_ok = false;
            } else {
                has_success(user_pwck);
                $(".user-pwck-msg")
                    .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
                user_pw_ok = true;
            }
        }
    });

    var user_pwck = $("input[name='user_pwck']");
    user_pwck.change(function () {
                if(!(this.value === $("input[name='user_pw']").val())){
                    has_error(user_pwck);
                    $(".user-pwck-msg").html("비밀번호가 일치하지 않습니다");
                    user_pw_ok = false;
                } else {
                    has_success(user_pwck);
                    $(".user-pwck-msg")
                        .html("<span class='glyphicon glyphicon-ok'></span>사용가능합니다");
                    user_pw_ok = true;
                }
    });

    var select = $("select[name='email_host']");
    select.change(function () {
        var edit = select.val();
        if (edit == 'edit') {
            $("#email-select-box").html("<input type='text' class='form-control email' name='email_host'/>")
        }
    });

});
