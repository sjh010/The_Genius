/**
 * Created by Saemi Lim on 2014-06-17.
 */

$("#user-modify-form .ok").click(function(){
	var $form = $("#user-modify-form");

	$form.attr('action', '/user/update');
	$form.attr('method', 'post');
	$form.append("<input type='hidden' value='"+user_character1.id+"' name='user_character1'>")
	    .append("<input type='hidden' value='"+user_character2.id+"' name='user_character2'>")
	    .append("<input type='hidden' value='"+user_character3.id+"' name='user_character3'>")
	    .append("<input type='hidden' value='"+$.cookie("user_id")+"' name='user_id'>");
	$form.submit();
});
