/**
 * Created by Administrator on 2014-06-10.
 */
$(function(){

    var select = $("select[name='email_host']");
    select.change(function(){
        var edit =select.val();
        if(edit == 'edit'){
            $("#email-select-box").html("<input type='text' class='form-control email' name='email_host'/>")
        }
    });

});
