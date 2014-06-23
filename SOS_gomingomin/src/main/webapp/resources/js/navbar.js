/**
 * Created by Saemi Lim on 2014-06-10.
 */
function loginModal(){
    $("#loginModal").modal('show');
}

$("#loginModal .join").click(function(){
    location.href="/join";
});

$("#loginModal .login").click(function(){
	var $form = $("#user-login-form");
	var str = $form.serialize();
	console.log(str);
	$.ajax({
    	data : $form.serialize(),
    	type : "post",
    	dataType : "json",
    	url : "/loginAction",
    	success : function(data){
    		console.log(data);
    		if((data != null) || (data != undefined)){
    			location.reload();
    		} else {
    			alert("아이디와 비밀번호를 확인해주세요");
    		}
        }
    });
});


var logout = function(){
	$.cookie('loginInfo', null);
	location.href("/");
};