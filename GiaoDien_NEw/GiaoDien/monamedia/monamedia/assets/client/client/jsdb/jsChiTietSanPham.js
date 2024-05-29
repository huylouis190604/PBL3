
var jsGioHang = {
    init: function () {
        jsGioHang.registerEvent();
    },
    registerEvent: function () {
        $('.btnGioHang').click(function (e) {
            var listProduct = $('#SoLuong');
            var lstGioHang = [];
            $.each(listProduct, function (i, item) {
                lstGioHang.push({
                    SoLuong: $(item).val(),
                    SanPham: {
                        ID: $(item).data('id')
                    }
                });
            });

            $.ajax({
                url: '/GioHang/ThemGioHang',
                data: { model: JSON.stringify(lstGioHang) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }

            });
        });
        //Số lượng trong giỏ hàng thay đổi
        $('#SoLuong').off('change').on('change', (function (e) {
            var listProduct = $('#SoLuong');
            var lstGioHang = [];
            $.each(listProduct, function (i, item) {
                lstGioHang.push({
                    SoLuong: $(item).val(),
                    SanPham: {
                        ID: $(item).data('id')
                    }
                });
            });

            $.ajax({
                url: '/GioHang/CapNhapGioHang',
                data: { model: JSON.stringify(lstGioHang) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }

            });
        }));
        $('.btnSoLuong').click(function (e) {
            var listProduct = $('#SoLuong');
            var lstGioHang = [];
            $.each(listProduct, function (i, item) {
                lstGioHang.push({
                    SoLuong: $(item).val(),
                    SanPham: {
                        ID: $(item).data('id')
                    }
                });
            });

            $.ajax({
                url: '/GioHang/CapNhapGioHang',
                data: { model: JSON.stringify(lstGioHang) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }

            });
        });
    }
}
jsGioHang.init();