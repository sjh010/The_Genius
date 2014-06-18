/**
 * Updated by Saemi Lim on 2014-06-18.
 * Created by Saemi Lim on 2014-06-17.
**/

$("#search-form .ok").click(function(){
	var $form = $("#search-form");
	$form.attr('action', '/search');
    $form.attr('method', 'get');
    $form.submit();
});