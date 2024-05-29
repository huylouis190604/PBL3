using monamedia.API;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using monamedia.Models;
using System.Xml.Linq;
namespace monamedia.Controllers
{
    public class ThanhToanController : Controller
    {
        public ActionResult Index()
        {
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            return View(giohang);

        }
        Model6 db = new Model6();
        public ActionResult ThanhToan()
        {
            return View();
        }
        public async Task<ActionResult> ChiTietDonHang(int id)
        {
            var order = db.orderDetails.Where(x => x.orderID == id).ToList();
            if (order == null || !order.Any())
            {
                return Redirect(Request.UrlReferrer.ToString());
            }
            ViewBag.Order = order;
            ViewBag.OrderId = id;
            return View();
        }
        [HttpPost]
        public ActionResult BinhLuan(int id, Review review)
        {
            var order = db.orderDetails.Where(x => x.orderID == id).ToList();
            if (order != null)
            {
                foreach (var item in order)
                {
                    review = new Review();
                    review.nameCustomer = Request.Form["username"];
                    review.cmtCustomer = Request.Form["comment"];
                    review.cmtTime = DateTime.Now;
                    review.ProductId = item.productID;
                    db.Reviews.Add(review);
                }
            }
           
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult DonHang()
        {
           
            return View();
        }
        public ActionResult OrderDetail()
        {
            return View();
        }
        public ActionResult DatHang()
        {
            var customerInfo = (monamedia.API.CustomerInfo)Session["CustomerInfo"];
            var customerID = customerInfo.customerID;

            var data = db.C_Order
                .Where(x => x.customerID == customerID)
                .OrderByDescending(x => x.timeOrder)   
                .ToList();

            return View(data);
        }
        public ActionResult Hoadon()
        {
            return View();
        }
        public async Task<ActionResult> Indexs(string masp)
        {
            try
            {
               
                var loginService = new LoginService();
                string result = await loginService.ShopingCartDeatail(masp);

                var jsonResponse = JObject.Parse(result);
                int code = jsonResponse["code"].Value<int>();
                string message = jsonResponse["message"].Value<string>();

                if (code == 1 && message == "SP Executed Successfully")
                {
                    var productsArray = jsonResponse["document"]["ResultTable1"];
                    var ShopingCartDeatail = productsArray.Select(p => new GiohangViewModel
                    {
                        ProductId = p["Productid"].Value<string>(),
                        Name = p["Name"].Value<string>(),
                        Brand = p["Brand"].Value<string>(),
                        Price = p["Price"].Value<int>(),
                        Quantity = p["Quantity"].Value<int>(),
                        Color = p["Color"].Value<string>(),
                        Ram = p["Ram"].Value<string>(),
                        Memory = p["Memory"].Value<string>(),
                        SpecId = p["Specid"].Value<string>(),
                        Img = p["Img"].Value<string>(),
                        Type = p["Type"].Value<string>(),
                        SpecId1 = p["Specid1"].Value<string>(),
                        Cpu = p["Cpu"].Value<string>(),
                        Gpu = p["Gpu"].Value<string>(),
                        Os = p["Os"].Value<string>(),
                        Screen = p["Screen"].Value<string>(),
                        Pin = p["Pin"].Value<string>(),
                        Camera = p["Camera"].Value<string>(),
                        Size = p["Size"].Value<string>(),
                        Warranty = p["Warrantly"].Value<int>(),
                        Sound = p["Sound"].Value<string>(),
                        Weight = p["Weight"].Value<string>(),
                        ConnectivityTechnologies = p["Conectivitytechnologies"].Value<string>(),
                        Charge = p["Charge"].Value<string>(),
                        YearOfDebut = p["Yearofdebut"].Value<int>(),
                        discountedPrice = p["discountedPrice"].Value<int>(),
                        per_cent = p["per_cent"].Value<int>()
                    }).ToList();

                    ViewBag.ShopingCartDeatail = ShopingCartDeatail;
                }
                else
                {
                    ViewBag.ErrorMessage = "Lỗi khi tải sản phẩm từ API: " + message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đã xảy ra lỗi khi thực hiện tải sản phẩm từ API. Vui lòng thử lại sau.";
            }

            return View();
        }
        public async Task<ActionResult> ChiTiet(string masp)
        {
            try
            {

                var loginService = new LoginService();
                string result = await loginService.ShopingCartDeatail(masp);

                var jsonResponse = JObject.Parse(result);
                int code = jsonResponse["code"].Value<int>();
                string message = jsonResponse["message"].Value<string>();

                if (code == 1 && message == "SP Executed Successfully")
                {
                    var productsArray = jsonResponse["document"]["ResultTable1"];
                    var ShopingCartDeatail = productsArray.Select(p => new GiohangViewModel
                    {
                        ProductId = p["Productid"].Value<string>(),
                        Name = p["Name"].Value<string>(),
                        Brand = p["Brand"].Value<string>(),
                        Price = p["Price"].Value<int>(),
                        Quantity = p["Quantity"].Value<int>(),
                        Color = p["Color"].Value<string>(),
                        Ram = p["Ram"].Value<string>(),
                        Memory = p["Memory"].Value<string>(),
                        SpecId = p["Specid"].Value<string>(),
                        Img = p["Img"].Value<string>(),
                        Type = p["Type"].Value<string>(),
                        SpecId1 = p["Specid1"].Value<string>(),
                        Cpu = p["Cpu"].Value<string>(),
                        Gpu = p["Gpu"].Value<string>(),
                        Os = p["Os"].Value<string>(),
                        Screen = p["Screen"].Value<string>(),
                        Pin = p["Pin"].Value<string>(),
                        Camera = p["Camera"].Value<string>(),
                        Size = p["Size"].Value<string>(),
                        Warranty = p["Warrantly"].Value<int>(),
                        Sound = p["Sound"].Value<string>(),
                        Weight = p["Weight"].Value<string>(),
                        ConnectivityTechnologies = p["Conectivitytechnologies"].Value<string>(),
                        Charge = p["Charge"].Value<string>(),
                        YearOfDebut = p["Yearofdebut"].Value<int>(),
                        discountedPrice = p["discountedPrice"].Value<int>(),
                        per_cent = p["per_cent"].Value<int>()
                    }).ToList();

                    ViewBag.ChiTiet = ShopingCartDeatail;
                    ViewBag.Comments = db.Reviews.Where(c => c.ProductId == masp).ToList();
                }
                else
                {
                    ViewBag.ErrorMessage = "Lỗi khi tải sản phẩm từ API: " + message;
                }
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đã xảy ra lỗi khi thực hiện tải sản phẩm từ API. Vui lòng thử lại sau.";
            }

            return View();
        }
        public ActionResult ThemYeuthich(string SanPhamID)
        {
            if (Session["yeuthich"] == null) // Nếu giỏ hàng chưa được khởi tạo
            {
                Session["yeuthich"] = new List<CartItem>();  // Khởi tạo Session["giohang"] là 1 List<CartItem>
            }

            List<CartItem> yeuthich = Session["yeuthich"] as List<CartItem>;  // Gán qua biến giohang dễ code

            // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa

            if (yeuthich.FirstOrDefault(m => m.SanPhamID == SanPhamID) == null) // ko co sp nay trong gio hang
            {
                Models.Product sp = db.Products.Find(SanPhamID);  // tim sp theo sanPhamID

                CartItem newItem = new CartItem()
                {
                    SanPhamID = SanPhamID,
                    TenSanPham = sp.name,
                    SoLuong = 1,
                    Hinh = sp.img,
                    DonGia = sp.price.ToString(),

                };  // Tạo ra 1 CartItem mới

                yeuthich.Add(newItem);  // Thêm CartItem vào giỏ 

            }
            else
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                CartItem cardItem = yeuthich.FirstOrDefault(m => m.SanPhamID == SanPhamID);
                cardItem.SoLuong++;
            }

            // Action này sẽ chuyển hướng về trang chi tiết sp khi khách hàng đặt vào giỏ thành công. Bạn có thể chuyển về chính trang khách hàng vừa đứng bằng lệnh return Redirect(Request.UrlReferrer.ToString()); nếu muốn.
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult XoaKhoiYeuthich(string SanPhamID)
        {
            List<CartItem> yeuthich = Session["yeuthich"] as List<CartItem>;
            CartItem itemXoa = yeuthich.FirstOrDefault(m => m.SanPhamID.Equals(SanPhamID));
            if (itemXoa != null)
            {
                yeuthich.Remove(itemXoa);
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult ThemVaoGio1(string SanPhamID)
        {
            if (Session["giohang"] == null) // Nếu giỏ hàng chưa được khởi tạo
            {
                Session["giohang"] = new List<CartItem>();  // Khởi tạo Session["giohang"] là 1 List<CartItem>
            }

            List<CartItem> giohang = Session["giohang"] as List<CartItem>;  // Gán qua biến giohang dễ code

            // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa

            if (giohang.FirstOrDefault(m => m.SanPhamID == SanPhamID) == null) // ko co sp nay trong gio hang
            {
                Models.Product sp = db.Products.Find(SanPhamID);  // tim sp theo sanPhamID

                CartItem newItem = new CartItem()
                {
                    SanPhamID = SanPhamID,
                    TenSanPham = sp.name,
                    SoLuong = 1,
                    Hinh = sp.img,
                    DonGia = sp.price.ToString(),

                };  // Tạo ra 1 CartItem mới

                giohang.Add(newItem);  // Thêm CartItem vào giỏ 

            }
            else
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                CartItem cardItem = giohang.FirstOrDefault(m => m.SanPhamID == SanPhamID);
                cardItem.SoLuong += 1;
            }

            // Action này sẽ chuyển hướng về trang chi tiết sp khi khách hàng đặt vào giỏ thành công. Bạn có thể chuyển về chính trang khách hàng vừa đứng bằng lệnh return Redirect(Request.UrlReferrer.ToString()); nếu muốn.
            return Redirect(Request.UrlReferrer.ToString());
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemVaoGio(string SanPhamID)
        {
            if (Session["giohang"] == null) // Nếu giỏ hàng chưa được khởi tạo
            {
                Session["giohang"] = new List<CartItem>();  // Khởi tạo Session["giohang"] là 1 List<CartItem>
            }

            List<CartItem> giohang = Session["giohang"] as List<CartItem>;  // Gán qua biến giohang dễ code
            int quantity = int.Parse(Request.Form["quantity"]);

            // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa

            if (giohang.FirstOrDefault(m => m.SanPhamID == SanPhamID) == null) // ko co sp nay trong gio hang
            {
                Models.Product sp = db.Products.Find(SanPhamID);  // tim sp theo sanPhamID

                CartItem newItem = new CartItem()
                {
                    SanPhamID = SanPhamID,
                    TenSanPham = sp.name,
                    SoLuong = quantity,
                    Hinh = sp.img,
                    DonGia = sp.price.ToString(),

                };  // Tạo ra 1 CartItem mới

                giohang.Add(newItem);  // Thêm CartItem vào giỏ 
                
            }
            else
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                CartItem cardItem = giohang.FirstOrDefault(m => m.SanPhamID == SanPhamID);
                cardItem.SoLuong+=quantity;
            }

            // Action này sẽ chuyển hướng về trang chi tiết sp khi khách hàng đặt vào giỏ thành công. Bạn có thể chuyển về chính trang khách hàng vừa đứng bằng lệnh return Redirect(Request.UrlReferrer.ToString()); nếu muốn.
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult XoaKhoiGio(string SanPhamID)
        {
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            CartItem itemXoa = giohang.FirstOrDefault(m => m.SanPhamID.Equals(SanPhamID));
            if (itemXoa != null)
            {
                giohang.Remove(itemXoa);
            }
            return Redirect(Request.UrlReferrer.ToString());
        }



        public async Task<ActionResult> ShopingCart(C_Order model)
        {
           
            try
            {
                
                    var customerInfo = (CustomerInfo)Session["CustomerInfo"];

                model.customerID = customerInfo.customerID;
                model.status = "Chờ xác nhận";
                model.fee= 0;
                model.timeOrder = DateTime.Now;
                model.method = "COD";
                List<CartItem> giohang = Session["giohang"] as List<CartItem>;
                int? price = 0;
                foreach (var item in giohang)
                {
                    price +=  int.Parse(item.DonGia) * item.SoLuong;
                }
                model.total = price;
                db.C_Order.Add(model);
                db.SaveChanges();
                var id = model.orderID;
                foreach (var item in giohang)
                {
                    orderDetail detail = new orderDetail();
                    detail.orderID = model.orderID;
                    detail.productID = item.SanPhamID;
                    detail.quantity = item.SoLuong;
                    detail.price = int.Parse(item.DonGia);
                    db.orderDetails.Add(detail);

                }
                db.SaveChanges();

                return Redirect(Request.Headers["Referer"].ToString());
            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = "Đã xảy ra lỗi khi đặt hàng: " + ex.Message;
                return View("Error");
            }
        }
        private async Task<string> ShopingCartAPI(int customerID, int fee, int total, string productID, int quantity,int price)
        {
            try
            {
                var loginService = new LoginService();
                // Gửi dữ liệu đặt hàng đến API
                var result = await loginService.ShopingCart(customerID, fee, total, productID, quantity,price);

                var jsonResponse = JObject.Parse(result);
                int code = jsonResponse["code"].Value<int>();
                string message = jsonResponse["message"].Value<string>();
                if (code == 1 && message == "SP Executed Successfully")
                {
                    return "Success";
                }
                else
                {
                    return "Failure";
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Đã xảy ra lỗi khi gửi dữ liệu đặt hàng đến API: " + ex.Message);
            }
        }


    }
}
