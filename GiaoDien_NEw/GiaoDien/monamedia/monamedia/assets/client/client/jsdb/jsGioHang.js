
var jsGioHang = {
    init: function () {
        jsGioHang.registerEvent();
    },
    registerEvent: function () {
        $('.btn-delete').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                data: { id: $(this).data('id') },
                url: '/GioHang/XoaGioHangByID',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }

            })
        });

        //Số lượng trong giỏ hàng thay đổi
        $('.SoLuong').off('change').on('change', (function (e) {
            var listProduct = $('.SoLuong');
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
            var listProduct = $('.SoLuong');
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
                        //var data = res.data;
                        //console.log(data);
                        //$('.thanhtien').text(data + "VND");
                        window.location.href = "/gio-hang";
                        //jsGioHang.LoadData();
                    }
                }

            });
        });
    },
    LoadData:function(){
        $.ajax({
            type: "GET",
            url: "/GioHang/GetGioHang",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (res) {
                if (res.status) {
                    var data = res.data;
                    var rows = '';
                    var temp = $('#GioHang_Temp').html();
                    if (data.length > 0) {
                        $.each(data, function (i, item) {
                            rows += Mustache.render(temp, {
                                HinhAnh: item.SanPham.HinhAnh,
                                TenSanPham: item.SanPham.TenSanPham,
                                ID: item.SanPham.ID,
                                GiaKhuyenMai: item.SanPham.GiaKhuyenMai,
                                SoLuong: item.SoLuong,
                                ThanhTien: item.ThanhTien
                            });
                            stt += 1;
                        });
                        $("#GioHang").html(rows);
                    }
                    else {
                        $("#GioHang").html(rows);
                    }
                    jsGioHang.registerEvent();
                } else {
                    alert("Something went wrong");
                }
            }
        });
}
}
jsGioHang.init();