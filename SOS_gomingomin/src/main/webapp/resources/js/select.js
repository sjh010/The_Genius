/**
 * Created by Saemi Lim on 2014-06-13.
 */

var selectCount = 0;
var user_character1 = '';
var user_character2 = '';
var user_character3 = '';

$(".image-frame img").click(function (e) {

    console.log(e.target.name);
    if(selectCount > 3){
        console.log("모두 선택한 상태");
    } else if(selectCount < 0){
        selectCount = 0;
        console.log("캐릭터 좀 선택하셈-_-");
    } else {
        var hasClassSelected = $(this).hasClass("selected");
        var hasClassNoSelected = $(this).hasClass("no-selected");
        if(hasClassSelected){
            $(this).addClass("no-selected");
            $(this).removeClass("selected");
        } else if(hasClassNoSelected) {
            $(this).addClass("no-selected");
            $(this).removeClass("selected");
        }
    }
});
