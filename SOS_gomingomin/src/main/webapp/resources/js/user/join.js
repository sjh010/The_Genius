/**
 * Created by so on 2014-07-02.
 * Modified by Saemi on 2014-07-05.
 */


jQuery.browser = {};
var form = $("#user-join-form");

/* 유효성 검사 */

    /* change text color */
    function has_error(el, msg) {
        var msgEl = el.parent().children(".input-msg");
        el.parent().parent().addClass("has-error");
        el.parent().parent().removeClass("has-success");
        msgEl.html("<span class='glyphicon glyphicon-remove'></span>"+msg);
    }

    function has_success(el, msg) {
        var msgEl = el.parent().children(".input-msg");
        el.parent().parent().removeClass("has-error");
        el.parent().parent().addClass("has-success");
        msgEl.html("<span class='glyphicon glyphicon-ok'></span>"+msg);
    }

    /* check user_id */
    var user_id = form.find("[name=user_id]");
    var user_id_ok = false;
    var userIdCheck = function(){
        var regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        if (!regEmail.test(user_id.val())) {
            has_error(user_id, "이메일 형식이 맞지 않습니다.");
        } else {
            $.ajax({
                data : {user_id : user_id.val()},
                url: "/user/checkUserId",
                dataType : "json",
                success : function(data){
                	console.log(data);
                    if(data.result == "y"){
                          has_success(user_id,"사용가능합니다.");
                          user_id_ok = true;
                    } else {
                          user_id_ok = false;
                          has_error(user_id, "중복된 아이디입니다.");
                    }
                }
            });
        }
    };
    user_id.focusout(function(){userIdCheck();});

    /* check user_pw */
    var user_pw = form.find("[name=user_password]");
    var user_pw_ok = false;
    var userPwChk = function(){
        if (user_pw.val().length < 8) {
            has_error(user_pw,"8자 이상이어야 합니다");
        } else {
            has_success(user_pw,"사용가능합니다");
        }

        if (user_pw_ok == true) {
            if (!(this.value === user_pwck.val())) {
                has_error(user_pwck, "비밀번호가 일치하지 않습니다");
                user_pw_ok = false;
            } else {
                has_success(user_pwck,"사용가능합니다");
                user_pw_ok = true;
            }
        }
    };
    user_pw.focusout(function () { userPwChk(); });

    var user_pwck = form.find("[name=user_password_ck]");
    var userPwCkChk = function(){
        if ((user_pwck.val() == "") || (!(user_pwck.val() === user_pw.val()))) {
            has_error(user_pwck, "비밀번호가 일치하지 않습니다");
            user_pw_ok = false;
        } else {
            has_success(user_pwck, "사용가능합니다");
            user_pw_ok = true;
        }
    };
    user_pwck.focusout(function () { userPwCkChk(); });

    /* check user_name */
    var user_name = form.find("[name=user_name]");
    var user_name_ok = false;

    var userNameChk = function(){
        if (user_name.val() == "") {
            has_error(user_name, "이름을 입력하세요");
        } else {
            has_success(user_name,"");
            user_name_ok = true;
        }
    };
    user_name.focusout(function () {userNameChk();});

    var user_birth = form.find("[name=user_birth]");
    
    user_birth.datepicker({
        format: "yyyy-mm-dd",
        endDate: "new Date()",
        startView: 2,
        language: "kr",
        orientation: "top auto",
        keyboardNavigation: false,
        autoclose: true
    });
    
    var user_birth_ok = false;
    var userBirthChk = function(){
        if (user_birth.val() == "") {
            has_error(user_birth, ">생년월일을 입력하세요");
        } else {
            has_success(user_birth,"");
            user_birth_ok = true;
        }
    };
    user_birth.change(function () {userBirthChk();});

    
    /* check user_sex */
    var user_sex = form.find("[name=user_sex]");
    var user_sex_ok = false;
    var userSexChk = function(){
        if (!user_sex.checked) {
        	has_success(user_sex.parent().parent(), "");
            user_sex_ok = true;
            
            $.ajax({
            	data : {user_sex : user_sex.val()},
            	url : '/user/getCharacterInfo',
            	dataType : 'json',
            	success : function(data){
            		// /user/ajax/getCharacterInfo
            		console.log(data);
            	}
            });
            
            
        }
        if(!user_sex_ok){
            has_error(user_sex.parent().parent(), "성별을 선택하세요");
        }
    };
    
    user_sex.change(function () {userSexChk(); });
    
    
    var user_addr_ok = false;
    var zipcode1 = form.find("[name=zipcode1]");
    var zipcode2 = form.find("[name=zipcode2]");
    var address1 = form.find("[name=address1]");
    var address2 = form.find("[name=address2]");

    var userAddressChk = function () {
        var regZipcode = /^[0-9]{3,4}$/;
        if ((!regZipcode.test(zipcode1.val())) || (!regZipcode.test(zipcode2.val()))
            || ((address1.val() == "") || (address2.val() == ""))) {
        	has_error(zipcode1.parent(), "주소를 입력하세요");
            has_error(address1, "");
        }
        else {
            user_addr_ok = true;
            has_success(zipcode1.parent(), "주소를 입력하세요");
            has_success(address1, "");
        }
    };
    zipcode1.focusout(function () {userAddressChk(); });
    zipcode2.focusout(function () {userAddressChk(); });
    address1.focusout(function () {userAddressChk(); });
    address2.focusout(function () {userAddressChk(); });

    var user_phone_ok = false;
    var phone1 = form.find("[name=phone1]");
    var phone2 = form.find("[name=phone2]");
    var phone3 = form.find("[name=phone3]");

    var userPhoneChk = function () {
        var regPhone = /^[0-9]{3,4}$/;

        if ((!regPhone.test(phone1.val())) || (!regPhone.test(phone2.val())) ||(!regPhone.test(phone3.val()))) {
            has_error(phone1,"전화번호를 입력하세요");
        }
        else {
            user_phone_ok = true;
            has_success(phone1,"");
        }
    };
    phone1.focusout(function () {userPhoneChk(); });
    phone2.focusout(function () {userPhoneChk(); });
    phone3.focusout(function () {userPhoneChk(); });
    
    
// Select Character
var right3, right2, right1, center, left1, left2, left3;
var character1, character2, character3;
var characterList = $('#img_wrapper').children();

var nextCharacter = $("#join-next");
var prevCharacter = $("#join-prev");

prevCharacter.click(function(e) {
	e.preventDefault();
	showInputPage();
});

nextCharacter.click(function(e) {
	e.preventDefault();
	if(user_sex_ok){
		showCharacterPage();
	} else {
		alert("성별을 선택하세요.");
	}
});

var showCharacterPage = function(){
	$("#user-info").hide();
	$("#character-info").show();
	nextCharacter.attr("disabled", "disabled");
	prevCharacter.removeAttr("disabled");
};
var showInputPage = function(){
	$("#user-info").show();
	$("#character-info").hide();
	prevCharacter.attr("disabled", "disabled");
	nextCharacter.removeAttr("disabled");
};


$(function(){
    $.init_CharacterList();
});

//////////////////////////////////////////////////////////// 위치 초기화
$.init_CharacterList = function() {

    characterList = $('#img_wrapper').children();

    $.each(characterList, function(index) {

        switch (index) {
            case 19:
                left3 = $(this);
                break;
            case 0:
                left2 = $(this);
                break;
            case 1:
                left1 = $(this);
                break;
            case 2:
                center = $(this);
                break;
            case 3:
                right1 = $(this);
                break;
            case 4:
                right2 = $(this);
                break;
            case 5:
                right3 = $(this);
        };
    });

    $.addCSS();
};
////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////// CSS Setting
$.addCSS = function(){
    $.each(characterList, function(index) {
        $(this).removeAttr("draggable");
        $(this).removeAttr("ondragstart");
        $(this).removeClass();
        $(this).addClass("hide");
    });

    left3.addClass("left3");
    left2.addClass("left2 show transition");
    left1.addClass("left1 show transition");
    center.addClass("center show transition");
    $.dragndrop();
    right1.addClass("right1 show transition");
    right2.addClass("right2 show transition");
    right3.addClass("right3");
};

// Click Event
$(function() {

    var next = $('#right');
    var prev = $('#left');

    next.click(function(event) {

        $.each(characterList, function(index) {

            if($(this).hasClass("left3")){

                if (index == 0) {
                    left3 = characterList.last();
                }
                else {
                    left3 = $(this).prev();
                }
                left2 = $(this);
            }

            else if ($(this).hasClass("left2")) {
                left1 = $(this);
            }
            else if ($(this).hasClass("left1")) {
                center = $(this);
            }
            else if ($(this).hasClass("center")) {
                right1 = $(this);
            }
            else if ($(this).hasClass("right1")) {
                right2 = $(this);
            }
            else if($(this).hasClass("right2")){
                right3 = $(this);
            }
        });

        $.addCSS();
    });

    prev.click(function(index) {

        $.each(characterList, function(index) {

            if($(this).hasClass("left2")){
                left3 = $(this);
            }
            else if($(this).hasClass("left1")) {
                left2 = $(this);
            }
            else if ($(this).hasClass("center")) {
                left1 = $(this);
            }
            else if ($(this).hasClass("right1")) {
                center = $(this);
            }
            else if ($(this).hasClass("right2")) {
                right1 = $(this);
            }
            else if($(this).hasClass("right3")){
                right2 = $(this);

                if (index == characterList.length-1) {
                    right3 = characterList.first();
                }
                else {
                    right3 = $(this).next();
                }
            }
        });

        $.addCSS();
    });
});
////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////// 이미지에 Drag & Drop Setting
$.dragndrop = function(){
    center.attr({"draggable" : "true", "ondragstart" : "drag(event)"});
};

//////////////////////////////////////////////////////////// Drag & Drop function
function allowDrop(event) {
    event.preventDefault();
}

function drag(ev) {
    event.dataTransfer.setData("Text", ev.target.id);
}

function drop(ev) {
    event.preventDefault();
    var data = ev.dataTransfer.getData("Text");
    event.target.appendChild(document.getElementById(data));

    $('#img_wrapper').children("#"+data).remove();

    characterList = $('#img_wrapper').children();

    $.each(characterList, function(index) {

        if($(this).hasClass("left1")){
            center = $(this);
        }
        else if($(this).hasClass("left2")){
            left1 = $(this);
        }
        else if($(this).hasClass("left3")){
            left2 = $(this);
            if(index == 0){
                left3 = characterList.last();
            }
            else {
                left3 = $(this).prev();
            }
        }
    });
    $.addCSS();

    $('#'+ data).removeClass();
    $('#'+ data).css({"width" : "150px", "height" : "200px", "border-radius" : "5px"});
}
//////////////////////////////////////////////////////////// 확인 버튼 click 이벤트

var selected1 = $('#character1');
var selected2 = $('#character2');
var selected3 = $('#character3');
var inputComplete = false;
var selectComplete = false;
$("#user-join-form .ok").click(function () {
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
    } else if (!user_phone_ok) {
        phone1.focus();
        userPhoneChk();
    } else if (!user_addr_ok) {
        zipcode1.focus();
        userAddressChk();
    } else inputComplete = true;
    
    if(selected1.children().length == 1 &&
            selected2.children().length == 1 &&
            selected3.children().length == 1) selectComplete = true;       
    
    if(!inputComplete){
    	showInputPage();
    	alert("기본정보를 입력해주세요.");
    } else if(!selectComplete){
    	showCharacterPage();
    	alert("3개의 캐릭터를 선택해주세요.");
    } else {
        var param = {
            user_id : user_id.val(),
            user_password : user_pw.val(),
            user_name : user_name.val(),
            user_addr : zipcode1.val()+'----'+zipcode2.val()+'____'+address1.val()+'----'+address2.val(),
            user_phone : phone1.val()+'-'+phone2.val()+'-'+phone3.val(),
            user_birth : user_birth.val(),
            user_sex : user_sex.val(),
            user_character1 : selected1.children()[0].id,
            user_character2 : selected2.children()[0].id,
            user_character3 : selected3.children()[0].id
        };
        console.log(param);
        $.ajax({
            data : param,
            type : 'post',
            dataType : 'json',
            url: "/joinAction",
            success : function(data){
            	console.log(data);
                /*
                    아이디 정보 받아서 cookie 저장 후
                    캐릭터 선택 페이지로 redirect
                 */
            },
            failure : function(data){
                console.log("에러입니다. 다음에 다시 시도해주세요..");
            }
        });
    }
});

$("#user-join-form .cancel").click(function () {
	$('#joinModal').modal('hide');
});

$("#user-join-form .refresh").click(function(event) {
    event.preventDefault();
    if(selected1.children().length > 0){
        characterList.append(selected1.children());
        selected1.children().remove();
    }
    if(selected2.children().length > 0){
        characterList.append(selected2.children());
        selected2.children().remove();
    }
    if(selected3.children().length > 0){
        characterList.append(selected3.children());
        selected3.children().remove();
    }

    $.init_CharacterList();
});