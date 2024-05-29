
var jsGioHang = {
    init: function () {
        jsGioHang.registerEvent();
    },
    registerEvent: function () {
        $('.btn-delete').off('click').on('click', function (e) {
            e.preventDefault();
            $('.btnGioHang').on('click', function () {
                $.ajax({
                    url: "/GioHang/ThemGioHang",
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: JSON.stringify({
                        id: $("#ID").val(),
                        soLuong: $("#SoLuong").val()
                    }),
                    success: function (res) {
                        if (res.status == true) {
                            window.location.href = "/";
                        }
                    }
                });
            });
        })
    }
}
jsGioHang.init();