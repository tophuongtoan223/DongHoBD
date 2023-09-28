using Project_LTW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_LTW.Controllers
{
    public class GioHangController : Controller
    {
        LoginDataContext db = new LoginDataContext();
        //        GET: GioHang
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                // Khởi tạo giỏ hàng
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        //Thêm SP vào giỏ
        public ActionResult ThemGioHang(int id, string url)
        {
            //Lấy giỏ hàng hiện tại 
            List<GioHang> lstGioHang = LayGioHang();
            //Kiểm tra nếu sản phẩm chưa có thì thêm vào , có thì tăng số lượng
            GioHang sp = lstGioHang.Find(n => n.MaDongHo == id);
            if (sp == null)
            {
                sp = new GioHang(id);
                lstGioHang.Add(sp);
            }
            else
            {
                sp.SoLuong++;
            }
            return Redirect(url);
        }
        //tinhtongsoluong
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.SoLuong);
            }
            return iTongSoLuong;
        }
        //Tinhtongtien
        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                dTongTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return dTongTien;
        }
        //Action Traveview GioHang
        public ActionResult GioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.TongSoluong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        //Tạo partial view để hiển thị thông tin giỏ hàng
        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
        // Xóa SP 
        public ActionResult XoaSPKhoiGioHang(int MaDongHo)
        {
            List<GioHang> lstGioHang = LayGioHang();
            //Kiểm tra Sach Da Co trong Session["GioHang"]
            GioHang sp = lstGioHang.SingleOrDefault(n => n.MaDongHo == MaDongHo);
            //Xóa SP
            if (sp != null)
            {
                lstGioHang.RemoveAll(n => n.MaDongHo == MaDongHo);
                if (lstGioHang.Count == 0)
                {
                    return RedirectToAction("Index", "Home");
                }

            }
            return RedirectToAction("GioHang");
        }
        //Cập nhật giỏ hàng 
        public ActionResult CapNhatGioHang(int MaDongHo, FormCollection f)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sp = lstGioHang.SingleOrDefault(n => n.MaDongHo == MaDongHo);
            // Neu ton tai thi cho sua so luong
            if (sp != null)
            {
                sp.SoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        //XoaGioHang
        public ActionResult XoaGioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            //KiemTraDangNhap
            //if (Session["HOTEN"] == null || Session["HOTEN"].ToString() == "")
            //{
            //    return Redirect("~/DKDN/DangNhap?id=2");
            //}
            //KiemTraCoHangtronggiochua
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //LayHang tu Session
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection f)
        {
            //ThemDonHang
            DONDATHANG ddh = new DONDATHANG();
            DangKi dk = (DangKi)Session["TaiKhoan"]; 
            List<GioHang> lstGioHang = LayGioHang(); 
            ddh.MaKH = dk.ID; 
            ddh.NgayDat = DateTime.Now;
            var NgayGiao = String.Format("{0:MM/dd/yyyy}", f["NgayGiao"]);
            ddh.NgayGiao = DateTime.Parse(NgayGiao);
            ddh.TinhTrangGiaoHang = 1;
            ddh.DaThanhToan = false;
            db.DONDATHANGs.InsertOnSubmit(ddh);
            db.SubmitChanges();
          
            foreach (var item in lstGioHang)
            { 
                CHITIETDONHANG ctdh = new CHITIETDONHANG();
                ctdh.MaHD = ddh.MaDonHang;
                ctdh.MaDongHo = item.MaDongHo;
                ctdh.SoLuong = item.SoLuong;
                ctdh.ThanhTien = (decimal)item.ThanhTien;
                db.CHITIETDONHANGs.InsertOnSubmit(ctdh);
            }
            db.SubmitChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XacNhanDonHang", "GioHang");

        }
        public ActionResult XacNhanDonHang()
        {
            return View();
        }
    }
}
