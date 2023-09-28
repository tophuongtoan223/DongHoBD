using Project_LTW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_LTW.Areas.Admin.Controllers
{
    public class txsdonhangController : Controller
    {
        LoginDataContext db = new LoginDataContext();
        // GET: Admin/txsdonhang
        public ActionResult Dondathang()
        {
            return View(db.DONDATHANGs.ToList());
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        public ActionResult Delete(int id)
        {
            return View(db.DONDATHANGs.SingleOrDefault(m => m.MaDonHang == id));
        }
        [HttpPost]
        public ActionResult Delete(int id, DONDATHANG model)
        {
            DONDATHANG item = db.DONDATHANGs.SingleOrDefault(m => m.MaDonHang == id);
            db.DONDATHANGs.DeleteOnSubmit(model);
            db.SubmitChanges();
            return RedirectToAction("Dondathang");
        }
        public ActionResult Edit(int id)
        {
            return View(db.DONDATHANGs.SingleOrDefault(m => m.MaDonHang == id));
        }
        [HttpPost]
        public ActionResult Edit(int id, DONDATHANG model)
        {
            DONDATHANG item = db.DONDATHANGs.SingleOrDefault(m => m.MaDonHang == id);
            item.MaKH = model.MaKH;
            item.MaDonHang = model.MaDonHang;
            item.DaThanhToan = model.DaThanhToan;
            item.TinhTrangGiaoHang = model.TinhTrangGiaoHang;
            item.NgayDat = model.NgayDat;
            item.NgayGiao = model.NgayGiao;
            //item.MaKH = model.MaKH;
            db.SubmitChanges();
            return RedirectToAction("Dondathang");
        }
        public ActionResult Details(int id)
        {
            return View(db.DONDATHANGs.SingleOrDefault(m => m.MaDonHang == id));
        }
    }
}