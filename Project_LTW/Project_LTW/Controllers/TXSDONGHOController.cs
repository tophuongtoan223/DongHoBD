using Project_LTW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Reflection;
using System.Web.Mvc;

namespace Project_LTW.Controllers
{
    public class TXSDONGHOController : Controller
    {
        LoginDataContext db = new LoginDataContext();
        // GET: TXSDONGHO
        public ActionResult Index()
        {
            return View(db.DongHos.ToList());
        }
        public ActionResult Edit(int id)
        {
            return View(db.DongHos.SingleOrDefault(m => m.MaDongHo == id));
        }
        [HttpPost]
        public ActionResult Edit(int id, DongHo model)
        {
            DongHo item = db.DongHos.SingleOrDefault(m => m.MaDongHo == id);
            item.MaDongHo = model.MaDongHo;
            item.TenDongHo = model.TenDongHo;
            item.AnhBia = model.AnhBia;
            item.GiaBan = model.GiaBan;
            item.NgaySanXuat = model.NgaySanXuat;
            item.SoLuong = model.SoLuong;
            item.GiamGia = model.GiamGia;
            item.SoLuongBan = model.SoLuongBan;
            item.MaLoai = model.MaLoai;
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        public ActionResult ThemDetails()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ThemDetails(DongHo model)
        {

            db.DongHos.InsertOnSubmit(model);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Xoa(int id)
        {
            return View(db.DongHos.SingleOrDefault(m => m.MaDongHo == id));
        }
        [HttpPost]
        public ActionResult Xoa(int id, DongHo model)
        {
            DongHo item = db.DongHos.SingleOrDefault(m => m.MaDongHo == id);
            db.DongHos.DeleteOnSubmit(model);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
    }
}