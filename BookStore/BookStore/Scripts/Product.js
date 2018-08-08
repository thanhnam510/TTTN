function sendComment() {
    var ND = $('#cmt').val();
    if (ND === "" || ND === null) {
        alert("Không được bỏ trống");
        return;
    }
    $.ajax({
        type: "POST",
        url: "/Product/SaveComment",
        data: '{ma_Sach: "' + $('#MA_SACH').data('ma_sach') + '", cmt:"' + $('#cmt').val() + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            alert("Đã gửi");
            location.reload();
            $('.cmt').focus();

        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });
}

function changePPage(number) {
    var previous = $('.P>li.active').index() +1;
    $('.p' + previous).addClass("hidden");
    $('.p' + number).removeClass("hidden");
    $('#Pbtn' + previous).removeClass("active");
    $('#Pbtn' + number).addClass("active");
    var top = $('center').position().top;
    $(window).scrollTop(top);
}
function changeNPage(number) {
    var previous = $('.N>li.active').index() + 1;
    $('.n' + previous).addClass("hidden");
    $('.n' + number).removeClass("hidden");
    $('#Nbtn' + previous).removeClass("active");
    $('#Nbtn' + number).addClass("active");
}
function changeNeuPage(number) {
    var previous = $('.Neu>li.active').index() + 1;
    $('.neu' + previous).addClass("hidden");
    $('.neu' + number).removeClass("hidden");
    $('#Neubtn' + previous).removeClass("active");
    $('#Neubtn' + number).addClass("active");
}