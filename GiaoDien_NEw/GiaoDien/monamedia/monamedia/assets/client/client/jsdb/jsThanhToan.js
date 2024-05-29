var jsThanhToan = {
    init: function () {
        jsThanhToan.registerEvent();
    },
    registerEvent: function () {
        $('#btnDatHang').off('click').on('click', (function (e) {
            e.preventDefault();
                var HoTen = $('#HoTen').val();
                var DiaChi = $('#DiaChi').val();
                var DienThoai = $('#DienThoai').val();
                if (HoTen == '' || DiaChi == '' || DienThoai == '') {
                    $.toast({
                        heading: 'Thông báo',
                        text: 'Điền đầy đủ thông tin yêu cầu',
                        position: 'top-right',
                        loaderBg: '#ff6849',
                        icon: 'error',
                        hideAfter: 4000,
                        stack: 6
                    });
                }
                else {
                    $("#btnDatHang").attr("disabled", "disabled");
                    jsThanhToan.saveData();
            }
            
        }));
    },
    saveData: function () {
        var d = new Date();
        var month = d.getMonth() + 1;
        var day = d.getDate();

        var model = {
            HoTen: $('#HoTen').val(),
            DiaChi: $('#DiaChi').val(),
            DienThoai: $('#DienThoai').val(),
            Email: $('#Email').val(),
            TinhTrang: true,
            GhiChu: $('#GhiChu').val(),
            KichHoat: true,
            NgayTao: ((day < 10 ? '0' : '') + day) + '' + ((month < 10 ? '0' : '') + month) + '' + d.getFullYear(),
            NguoiTao: 'Guest',
            NgaySua: 0,
            NguoiSua: null,
            DaXoa: true,
            NgayXoa: 0,
            NguoiXoa: null,
        }
        $.ajax({
            url: '/ThanhToan/ThanhToan',
            data: { model: JSON.stringify(model) },
            type: 'POST',
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    $.toast({
                        heading: 'Thông báo',
                        text: 'Đặt hàng thành công',
                        position: 'top-right',
                        loaderBg: '#ff6849',
                        icon: 'success',
                        hideAfter: 4000,
                        stack: 6,
                        
                       // beforeShow: function () { console.log(1)}, // will be triggered before the toast is shown
                       // afterShown: function () { console.log(2) }, // will be triggered after the toat has been shown
                      //  beforeHide: function () { window.location.href = '/'; }, // will be triggered before the toast gets hidden
                        afterHidden: function () { window.location.href = '/'; }
                    });
                }
            }
        });
    },
}
jsThanhToan.init();