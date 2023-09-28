using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_LTW.Models;

namespace Project_LTW.Areas.Admin.Controllers
{
    public class LoginAdminController : Controller
    {
        LoginDataContext db  = new LoginDataContext();
        // GET: Admin/LoginAdmin
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {
            var sUserName = collection["UserName"];
            var sPassword = collection["Password"];
            ADMINNHO kh = db.ADMINNHOs.SingleOrDefault(n => n.UserName == sUserName && n.Password == sPassword);
            if (kh != null)
            {
                ViewBag.ThongBao = "Chào Mừng Bạn Đã Đến Với ADMIN";
                Session["UserName"] = kh.UserName;
                Session["TaiKhoan"] = kh;
                return RedirectToAction("DanhSach", "Home");
            }
            else
            {
                ViewBag.ThongBao = " Tên Đăng Nhập hoặc Mật Khẩu của ADMIN không đúng";
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session["UserName"] = null;
            Session["TaiKhoan"] = null;
            return RedirectToAction("DangNhap", "LoginAdmin");
        }
    }
}