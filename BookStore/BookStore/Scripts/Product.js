    function sendComment() {
                $.ajax({
                    type: "POST",
                    url: "/Product/SaveComment",
                    data: '{ma_Sach: "' + $('#MA_SACH').data('ma_sach') + '", cmt:"' + $('#cmt').val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("Đã gửi");
                        location.reload();

                    },
                    failure: function (response) {
                        alert(response.responseText);
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });
};
function changePPage(number) {
    var previous = $('.P>li.active').index() +1;
    $('.p' + previous).addClass("hidden");
    $('.p' + number).removeClass("hidden");
    $('#Pbtn' + previous).removeClass("active");
    $('#Pbtn' + number).addClass("active");
}
function changeNPage(number) {
    var previous = $('.N>li.active').index() + 1;
    $('.n' + previous).addClass("hidden");
    $('.n' + number).removeClass("hidden");
    $('#Nbtn' + previous).removeClass("active");
    $('#Nbtn' + number).addClass("active");
}