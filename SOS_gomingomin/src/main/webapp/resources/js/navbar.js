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
    			console.log($.cookie('user_id'));
    			location.reload();
    		} else {
    			alert("ㅇㅁㅁㅁ");
    		}
        }
    });
});


var logout = function(){
	// logout
};