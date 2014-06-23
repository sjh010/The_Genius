/**
 * Created by Saemi Lim on 2014-06-17.
 */

$("#myPage-form .ok").click(function() {
			var $form = $("#myPage-form");
			$form.attr('action', '/myPage');
			$form.attr('method', 'post');
			$form.serialize();
			$form.submit();
});


$("#myPage-form .cancel").click(function() {
	history.back();
});