$(document).ready(function () {
    window.addEventListener('message', function (event) {
        var data = event.data;

        if (data.action == "open") {

            $('.f9clothigthemenu').fadeIn(70);
        }

        if (data.action == "close") {
            $('.f9clothigthemenu').fadeOut(70);
            $('#refreshcc > i').css('animation', 'unset');
        }

        if (data.action == "update") {
            updateclothing(data.cloth);
        }

        if (data.action == "update2") {
            updateclothing2(data.cloth);
        }

        if (data.action == "getallresets") {
            restthis(data.cloth);
        }
    })
});

document.onkeyup = function (event) {
    const charCode = event.key;
    if (charCode == "Escape") {
        $.post('https://dpclothingui/close');
    }
};


$('#desccircle').click(function (e) {
    setTimeout(function () {
        $.post('https://dpclothingui/close');
    }, 1)
});

$('.resetbutton').click(function (e) {
    $('#refreshcc > i').css('animation', 'refreshhud 1s 1 forwards');
    $.post('https://dpclothingui/reset');
});

$('.onecbutton').click(function (e) {
    var whatidid = $(this).attr('id');
    var clothingui = document.getElementById(whatidid);
    if (clothingui.style.outline != "2px solid red") {
        $.post(`https://${GetParentResourceName()}/changecloth`, JSON.stringify(whatidid));
    }
});

$(document).on("mouseleave", ".onecbutton", function (e) {
    whatidid = $(this).attr('id');
    var clothingui = document.getElementById(whatidid);
    clothingui.style.outline = '2px solid white';
});

$(".onecbutton").mouseover(function () {
    gtaclickaudio();
});

$(".closebutton").mouseover(function () {
    gtaclickaudio();
});

function sleep(milliseconds) {
    const date = Date.now();
    let currentDate = null;
    do {
        currentDate = Date.now();
    } while (currentDate - date < milliseconds);
}


gtaclickaudio = function () {
    var audio = document.getElementById("audio1");
    audio.volume = 0.4;
    audio.play();
}

updateclothing = function (clot) {
    var clothingui = document.getElementById(clot);
    clothingui.style.filter = 'brightness(0.4)';
}

updateclothing2 = function (clot) {
    var clothingui = document.getElementById(clot);
    clothingui.style.filter = 'brightness(1)';
}


restthis = function (clot) {
    var clothingui = document.getElementById(clot);
    clothingui.style.outline = '2px solid red';
    $('#refreshcc > i').css('animation', 'refreshhud 1s 1 forwards');
    setTimeout(function () {
        clothingui.style.outline = '2px solid white';
        clothingui.style.filter = 'brightness(1)';
    }, 1000);

}