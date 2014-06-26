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
	$.ajax({
    	data : $form.serialize(),
    	type : "post",
    	dataType : "json",
    	url : "/loginAction",
    	success : function(data){
    		if((data.result == null) || (data.result == undefined)){
    			location.reload();
    		} else {
    			alert(data.result);
    		}
        }
    });
});
