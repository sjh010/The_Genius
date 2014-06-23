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
	var $form = $("#login-form");
    $.ajax({
    	data : $form.serialize(),
    	type : "post",
    	dataType : "json",
    	url : "/login",
    	success : function(data){
        	if(data.result == 'y') location.reload();
            	else if(data.result == 'n') alert("아이디와 비밀번호를 확인해주세요");
        },
        failure : function(){
        	alert("에러입니다. 다음에 다시 시도해주세요..");
        }
    });
});
