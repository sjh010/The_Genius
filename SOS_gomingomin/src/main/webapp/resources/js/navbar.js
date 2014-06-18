/**
 * Created by Saemi Lim on 2014-06-10.
 */
function loginModal(){
    $("#loginModal").modal('show');
}

$("#loginModal .join").click(function(){
    location.href="/join";
});
