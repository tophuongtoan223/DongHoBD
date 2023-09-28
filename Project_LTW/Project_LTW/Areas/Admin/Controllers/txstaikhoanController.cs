using Project_LTW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
namespace Project_LTW.Areas.Admin.Controllers
{
    public class txstaikhoanController : Controller
    {
        LoginDataContext db  = new LoginDataContext();
        //GET: Admin/txstaikhoan
        public ActionResult taikhoan()
        {
            return View(db.TaiKhoans.ToList());
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        public ActionResult Delete(int id)
        {
            return View(db.TaiKhoans.SingleOrDefault(m => m.ID == id));
        }
        [HttpPost]
        public ActionResult Delete(int id, TaiKhoan model)
        {
            TaiKhoan item = db.TaiKhoans.SingleOrDefault(m => m.ID == id);
            db.TaiKhoans.DeleteOnSubmit(model);
            db.SubmitChanges();
            return RedirectToAction("taikhoan");
        }
        public ActionResult Edit(int id)
        {
            return View(db.TaiKhoans.SingleOrDefault(m => m.ID == id));
        }
        [HttpPost]
        public ActionResult Edit(int id, TaiKhoan model)
        {
            TaiKhoan item = db.TaiKhoans.SingleOrDefault(m => m.ID== id);
            item.TenDangNhap = model.TenDangNhap;
            item.MatKhau = model.MatKhau;
            item.DiaChi = model.DiaChi;
            item.Quyen = model.Quyen;
            item.Email = model.Email;
            item.SoDienThoai = model.SoDienThoai;
            db.SubmitChanges();
            return RedirectToAction("taikhoan");
        }
        public ActionResult Details(int id)
        {
            return View(db.TaiKhoans.SingleOrDefault(m => m.ID== id));
        }
    }
}