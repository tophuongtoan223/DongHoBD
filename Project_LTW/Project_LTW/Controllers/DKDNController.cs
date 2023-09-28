using Project_LTW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_LTW.Controllers
{
    public class DKDNController : Controller
    {
        LoginDataContext db = new LoginDataContext();
        // GET: DKDN
        public ActionResult DangKi()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKi(FormCollection collection, DangKi Dk)
        {
            var sUserName = collection["HOTEN"];
            var sPassword = collection["MATKHAU"];
            var sConfirmPassword = collection["NLMATKHAU"];
            var sEmail = collection["EMAIL"];
            if (String.IsNullOrEmpty(sUserName))
            {
                ViewData["t1"] = " Vui lòng nhập Họ Và Tên";
            }
            else if (String.IsNullOrEmpty(sPassword))
            {
                ViewData["t3"] = "Nhập Mật Khẩu của bạn";
            }
            else if (String.IsNullOrEmpty(sConfirmPassword))
            {
                ViewData["t4"] = "Nhập lại Mật Khẩu của bạn";
            }
            else if (sPassword != sConfirmPassword)
            {
                ViewData["t5"] = "Mật khẩu không khớp";
            }
            else if (String.IsNullOrEmpty(sEmail))
            {
                ViewData["t6"] = "Vui lòng nhập Email";
            }
            else if (db.DkiKhachHangs.SingleOrDefault(n => n.HoTen == sUserName) != null)
            {
                ViewBag.ThongBao = "Tên đăng nhập được sử dụng";
            }
            else if (db.DkiKhachHangs.SingleOrDefault(n => n.Email == sEmail) != null)
            {
                ViewBag.ThongBao = "Email đã có người sử dụng";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới(kh)
                Dk.UserName = sUserName;
                Dk.Password = sPassword;
                Dk.Email = sEmail;
                db.DangKis.InsertOnSubmit(Dk);
                db.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
                return this.DangKi();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var sUserName = collection["HOTEN"];
            var sPassword = collection["MATKHAU"];
            DangKi kh = db.DangKis.SingleOrDefault(n => n.UserName == sUserName && n.Password == sPassword);
            if (kh != null)
            {
                ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                Session["UserName"] = kh.Taikhoan;
                Session["TaiKhoan"] = kh;  
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ThongBao = " Tên Đăng Nhập hoặc Mật Khẩu của bạn không đúng";
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}