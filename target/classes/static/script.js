$('#input').datetimepicker({
    uiLibrary: 'bootstrap4',
    modal: true,
    footer: true
});
/*=====LogIn=====*/
$(".signup").css("display", "none");

$(".signbtn").click(function(){
    $("form").animate({ height:"toggle", opacity: "toggle"}, "slow");
});


function onShowPass() {
    var x = document.getElementById("password-field");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}
/*====END=LogIn=====*/

 /*=======Show/Hide Foto in Main=========*/
function showhide(id) {
    var e = document.getElementById(id);
    e.style.display = (e.style.display == 'block') ? 'none' : 'block';
}
/*=====END==Show/Hide Foto in Main=========*/

/*
ENjoyHINT*/
