/**
 * Created by Saemi Lim on 2014-06-15.
 */

jQuery.browser = {};

var form = $("#user-modify-form");
$(function () {
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
    
    function no_action(el) {
        var msgEl = el.parent().children(".input-msg");
        el.parent().parent().removeClass("has-error");
        el.parent().parent().removeClass("has-success");
        msgEl.html("");
    }
    
    /* check user_pw */
    var user_pw = form.find("[name=user_password]");
    var user_pwck = form.find("[name=user_password_ck]");
    
    var user_pw_ok = true;
    var pw_no_change = true;
    var userNewPwChk = function(){
        if(user_pw.val() != ""){
        	if (user_pw.val().length < 8) {
           	 has_error(user_pw,"8자 이상이어야 합니다");
           } else {
               has_success(user_pw,"사용가능합니다");
           }
        } else {
        	no_action(user_pw);
        	pw_no_change = true;
        	user_pw_ok = true;
        }
        
       if (!(user_pw.val() == user_pwck.val())) {
           has_error(user_pwck, "비밀번호가 일치하지 않습니다");
           user_pw_ok = false;
       } else {
    	   user_pw_ok = true;
    	   if(user_pw.val() != ""){
    		   has_success(user_pwck,"사용가능합니다");
    		   pw_no_change = false;
    	   }else {
    		   pw_no_change = true;
    		   no_action(user_pw);
    		   no_action(user_pwck);
    	   }
       }
    };
    user_pw.focusout(function () { userNewPwChk(); console.log(user_pw_ok); });

    var userNewPwCkChk = function(){
    	
    		if((user_pwck.val()=="")&&(user_pw.val() == user_pwck.val())){
    			user_pw_ok = true;
    		    pw_no_change = true;
     		    no_action(user_pw);
     		    no_action(user_pwck);
    		} else if ((user_pw.val().length < 8) ) {
                has_error(user_pwck, "8자리 이상이어야 합니다");
                user_pw_ok = false;
            } else if(!(user_pwck.val() === user_pw.val())){
            	has_error(user_pwck, "비밀번호가 일치하지 않습니다");
            }
            else {
                has_success(user_pwck, "사용가능합니다");
                user_pw_ok = true;
                pw_no_change = false;
            }
        
    };
    user_pwck.focusout(function () { userNewPwCkChk(); });

   
    var user_addr_ok = false;
    var zipcode1 = form.find("[name=zipcode1]");
    var zipcode2 = form.find("[name=zipcode2]");
    var address1 = form.find("[name=address1]");
    var address2 = form.find("[name=address2]");

    var userAddressChk = function () {
        var regZipcode = /^[0-9]{3,4}$/;
        if ((!regZipcode.test(zipcode1.val())) || (!regZipcode.test(zipcode2.val()))
            || ((address1.val() == "") || (address2.val() == ""))) {
            has_error(zipcode1.parent(),"주소를 입력하세요");
            has_error(address1,"");
        }
        else {
            user_addr_ok = true;
            has_success(zipcode1.parent(), "");
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

    userNewPwChk();
    userPhoneChk();
    userAddressChk();
    $("#user-modify-form .ok").click(function (e) {
    	e.preventDefault();
        if (!user_pw_ok) {
            user_pw.focus();
            userPwChk();
        } else if (!user_addr_ok) {
            zipcode1.focus();
            userAddressChk();
        } else if (!user_phone_ok) {
            phone1.focus();
            userPhoneChk();
        } else {
        	var param = {
        			user_id :$.cookie("user_id"),
        			user_addr : zipcode1.val()+'----'+zipcode2.val()
        					+'____'+address1.val()+'----'+address2.val(),
        			user_phone : phone1.val()+'-'+phone2.val()+'-'+phone3.val()
        	};

        	if(!pw_no_change) param.user_password =  user_pw.val();
        	
        	$.ajax({
        		data : param,
        		url : '/myPage/updateAction',
        		type : 'post',
        		dataType : 'json',
        		success : function(data){
        			if(data.result == 'y'){
        				alert("수정되었습니다");
        				location.reload();
        			} else alert("에러가 발생하였습니다.");
        		}
        	});
        	
        }
    });
    
    $("#user-modify-form .cancel").click(function () {
    	history.back();
    });
    
    $("#user-modify-withdrawBtn").click(function(e){
        e.preventDefault();
        $("#withdrawModal").modal('show');
    });
    
    $("#goWidthdraw").click(function(e){
    	e.preventDefault();
    	console.log("asdt");
    	var $form = $("#user-modify-withdrawForm");
    	var msg = $form.find("[name=withdraw_message]");
    	if(msg.val() == $.cookie('user_id')){
    		$.ajax({
    			data : {user_id : msg.val()},
        		dataType:"json",
        		type : "post",
        		url : "/myPage/deleteAction",
        		success : function(data){
        			if(data.result == 'y') {
        				alert("탈퇴가 완료되었습니다.");
        				location.replace('/');
        			}
                	else if(data.result == 'n') alert("에러입니다. 다음에 다시 시도해주세요..");
        		}
        	});
    	}
    });  	
});
