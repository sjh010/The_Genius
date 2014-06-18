/**
 * Created by Saemi Lim on 2014-06-13.
 */

var selectCount = 0;
var user_character1 = {id : '', name : '', display : ''};
var user_character2 = {id : '', name : '', display : ''};
var user_character3 = {id : '', name : '', display : ''};

$(".image-frame img").click(function (e) {
    var hasClassSelected = $(this).hasClass("selected");
    var hasClassNoSelected = $(this).hasClass("no-selected");

    if(hasClassSelected){

        $(this).addClass("no-selected");
        $(this).removeClass("selected");

        selectCount--;
        delUserCharacter($(this)[0].id, $(this)[0].name);

    } else if(hasClassNoSelected) {
        if(selectCount >= 3){
        }  else {

            $(this).addClass("selected");
            $(this).removeClass("no-selected");

            selectCount++;
            setUserCharacter($(this)[0].id, $(this)[0].name);

        }
    }

});

$("#user-selectCharacter-form .select").click(function(){
    if(selectCount < 3){
        alert((selectCount)+"개만 선택하셨습니다." + (3-selectCount) +"개를 더 선택해주세요.");
    } else {
        var $form = $("#user-selectCharacter-form");
        $form.attr('action', '/user/character');
        $form.attr('method', 'post');
        $form.append("<input type='hidden' value='"+user_character1.id+"' name='user_character1'>")
            .append("<input type='hidden' value='"+user_character2.id+"' name='user_character2'>")
            .append("<input type='hidden' value='"+user_character3.id+"' name='user_character3'>")
            .append("<input type='hidden' value='<%=user_id %>' name='user_id'>");
        $form.submit();
    }
});

$("#user-selectCharacter-form .init").click(function(){
    user_character1.id = '';
    user_character1.name = '';
    user_character1.display = '';

    user_character2.id = '';
    user_character2.name = '';
    user_character2.display = '';

    user_character3.id = '';
    user_character3.name = '';
    user_character3.display = '';

    selectCount = 0;

    setSelectList();

    $(".select-element img").addClass("no-selected");
    $(".select-element img").removeClass("selected");

});

$("#user-selectCharacter-form .cancel").click(function(){
    history.back();
});


function setUserCharacter(id, name){
    if(user_character1.id == '') {
        user_character1.id = id;
        user_character1.name = name;
        user_character1.display = "<span class='col-xs-4'>"+name+"</span>";
    }
    else if(user_character2.id == ''){
        user_character2.id = id;
        user_character2.name = name;
        user_character2.display = "<span class='col-xs-4'>"+name+"</span>";
    }
    else if(user_character3.id == '') {
        user_character3.id = id;
        user_character3.name = name;
        user_character3.display = "<span class='col-xs-4'>"+name+"</span>";
    }

    setSelectList();
}

function delUserCharacter(user_character){
    if(user_character1.id == user_character) {
        user_character1.id = '';
        user_character1.name = '';
        user_character1.display = '';
    }
    else if(user_character2.id == user_character) {
        user_character2.id = '';
        user_character2.name = '';
        user_character2.display = '';
    }
    else if(user_character3.id == user_character) {
        user_character3.id = '';
        user_character3.name = '';
        user_character3.display = '';
    }

    setSelectList();
}

function setSelectList() {
    var selectList = $(".selectList");
    selectList.html(user_character1.display+user_character2.display+user_character3.display);
}


